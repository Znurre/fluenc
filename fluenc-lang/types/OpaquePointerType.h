#ifndef OPAQUEPOINTERTYPE_H
#define OPAQUEPOINTERTYPE_H

#include "Type.h"

class IPrototype;

class OpaquePointerType : public Type
{
	public:
		OpaquePointerType(const IPrototype *subject);

		std::string name() const override;
		std::string fullName() const override;

		llvm::Type *storageType(llvm::LLVMContext &context) const override;

		int8_t compatibility(const Type *type, const EntryPoint &entryPoint) const override;

	private:
		const IPrototype *m_subject;
};

#endif // OPAQUEPOINTERTYPE_H