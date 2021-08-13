#include <llvm/ExecutionEngine/SectionMemoryManager.h>
#include <llvm/ExecutionEngine/Orc/CompileUtils.h>

#include "KaleidoscopeJIT.h"

KaleidoscopeJIT::KaleidoscopeJIT(llvm::orc::JITTargetMachineBuilder targetMachineBuilder, llvm::DataLayout dataLayout)
	: m_dataLayout(std::move(dataLayout))
	, m_mangle(m_session, m_dataLayout)
	, m_objectLayer(m_session, []() { return std::make_unique<llvm::SectionMemoryManager>(); })
	, m_compileLayer(m_session, m_objectLayer, std::make_unique<llvm::orc::ConcurrentIRCompiler>(std::move(targetMachineBuilder)))
	, m_lib(m_session.createBareJITDylib("<main>"))
{
	m_lib.addGenerator(cantFail(llvm::orc::DynamicLibrarySearchGenerator::GetForCurrentProcess(m_dataLayout.getGlobalPrefix())));
}

KaleidoscopeJIT::~KaleidoscopeJIT()
{
	if (auto error = m_session.endSession())
	{
		m_session.reportError(std::move(error));
	}
}

llvm::Expected<KaleidoscopeJIT *> KaleidoscopeJIT::create()
{
	auto targetMachineBuilder = llvm::orc::JITTargetMachineBuilder::detectHost();
	auto dataLayout = targetMachineBuilder->getDefaultDataLayoutForTarget();

	if (!dataLayout)
	{
		return dataLayout.takeError();
	}

	return new KaleidoscopeJIT(std::move(*targetMachineBuilder), std::move(*dataLayout));
}

llvm::Error KaleidoscopeJIT::addModule(llvm::orc::ThreadSafeModule threadSafeModule)
{
	auto resourceTracker = m_lib.getDefaultResourceTracker();

	return m_compileLayer.add(resourceTracker, std::move(threadSafeModule));
}

llvm::Expected<llvm::JITEvaluatedSymbol> KaleidoscopeJIT::lookup(llvm::StringRef name)
{
	return m_session.lookup({&m_lib}, m_mangle(name.str()));
}