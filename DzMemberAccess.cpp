#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instructions.h>

#include "DzMemberAccess.h"
#include "EntryPoint.h"
#include "IRBuilderEx.h"
#include "Type.h"
#include "UndeclaredIdentifierException.h"

#include "values/TypedValue.h"
#include "values/IteratorValue.h"
#include "values/ReferenceValue.h"
#include "values/ArrayValue.h"
#include "values/FunctionValue.h"

DzMemberAccess::DzMemberAccess(antlr4::ParserRuleContext *context, DzValue *consumer, const std::string &name)
	: m_context(context)
	, m_consumer(consumer)
	, m_name(name)
{
}

std::vector<DzResult> DzMemberAccess::build(const EntryPoint &entryPoint, Stack values) const
{
	auto locals = entryPoint.locals();
	auto functions = entryPoint.functions();
	auto globals = entryPoint.globals();

	auto localsIterator = locals.find(m_name);

	if (localsIterator != locals.end())
	{
		if (auto value = dynamic_cast<const ReferenceValue *>(localsIterator->second))
		{
			auto valueType = value->type();

			IRBuilderEx builder(entryPoint);

			auto load = builder.createLoad(*value, m_name);

			values.push(new TypedValue { valueType, load });
		}
		else if (localsIterator->second)
		{
			values.push(localsIterator->second);
		}

		return m_consumer->build(entryPoint, values);
	}

	auto functionsIterator = functions.find(m_name);

	if (functionsIterator != functions.end())
	{
		auto value = new FunctionValue(functionsIterator->second, entryPoint);

		values.push(value);

		return m_consumer->build(entryPoint, values);
	}

	auto globalsIterator = globals.find(m_name);

	if (globalsIterator != globals.end())
	{
		std::vector<DzResult> results;

		for (auto &[resultEntryPoint, resultValues] : globalsIterator->second->build(entryPoint, values))
		{
			for (auto &result : m_consumer->build(resultEntryPoint, resultValues))
			{
				results.push_back(result);
			}
		}

		return results;
	}

	throw new UndeclaredIdentifierException(m_context, m_name);
}
