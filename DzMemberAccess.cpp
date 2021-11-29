#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instructions.h>

#include "DzMemberAccess.h"
#include "EntryPoint.h"
#include "Type.h"

#include "values/TypedValue.h"
#include "values/NamedValue.h"

DzMemberAccess::DzMemberAccess(DzValue *consumer, const std::string &name)
	: m_consumer(consumer)
	, m_name(name)
{
}

std::vector<DzResult> DzMemberAccess::build(const EntryPoint &entryPoint, Stack values) const
{
	auto &module = entryPoint.module();
	auto &context = entryPoint.context();

	auto block = entryPoint.block();
	auto locals = entryPoint.locals();

	auto iterator = locals.find(m_name);

	if (iterator == locals.end())
	{
		throw new std::exception();
	}

	if (auto value = dynamic_cast<const TypedValue *>(iterator->second))
	{
		auto valueType = value->type();

		auto storageType = valueType->storageType(*context);

		auto dataLayout = module->getDataLayout();
		auto align = dataLayout.getABITypeAlign(storageType);

		auto load = new llvm::LoadInst(storageType, *value, m_name, false, align, block);

		values.push(new TypedValue { valueType, load });
	}
	else if (auto value = dynamic_cast<const NamedValue *>(iterator->second))
	{
		std::vector<DzResult> results;

		for (auto &[forwardedEntryPoint, forwardedValues] : value->build(block, values))
		{
			auto consumerEntryPoint = entryPoint
				.pushTag(forwardedEntryPoint.tag())
				.withBlock(forwardedEntryPoint.block());

			for (auto &result : m_consumer->build(consumerEntryPoint, forwardedValues))
			{
				results.push_back(result);
			}
		}

		return results;
	}
	else if (iterator->second)
	{
		values.push(iterator->second);
	}

	return m_consumer->build(entryPoint, values);
}
