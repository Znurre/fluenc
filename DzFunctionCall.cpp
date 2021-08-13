#include <iostream>

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/IRBuilder.h>

#include "DzFunctionCall.h"
#include "DzFunction.h"
#include "EntryPoint.h"

DzFunctionCall::DzFunctionCall(DzValue *consumer, const std::string name, size_t numberOfArguments)
	: m_consumer(consumer)
	, m_name(name)
	, m_numberOfArguments(numberOfArguments)
{
}

std::vector<DzResult> DzFunctionCall::build(const EntryPoint &entryPoint, Stack values) const
{
	auto &context = entryPoint.context();

	auto functions = entryPoint.functions();
	auto function = entryPoint.function();
	auto block = entryPoint.block();

	block->insertInto(function);

	auto tailCallTarget = entryPoint
		.byName(m_name);

	if (tailCallTarget)
	{
		auto tailCallValues = tailCallTarget->values();

		for (auto i = 0u; i < m_numberOfArguments; i++)
		{
			llvm::IRBuilder<> builder(block);

			builder.CreateStore(values.pop(), tailCallValues.pop());
		}

		linkBlocks(block, tailCallTarget->block());

		return std::vector<DzResult>();
	}

	for (auto [i, end] = functions.equal_range(m_name); i != end; i++)
	{
		auto function = i->second;

		if (function->hasMatchingSignature(entryPoint, values, m_numberOfArguments))
		{
			std::vector<llvm::Value *> argumentValues;

			for (auto i = 0u; i < m_numberOfArguments; i++)
			{
				auto value = values.pop();

				argumentValues.push_back(value);
			}

			auto functionBlock = llvm::BasicBlock::Create(*context);

			for (auto i = rbegin(argumentValues); i != rend(argumentValues); i++)
			{
				llvm::IRBuilder<> builder(block);

				auto argumentType = builder.getInt32Ty();
				auto alloc = builder.CreateAlloca(argumentType);

				builder.CreateStore(*i, alloc);

				values.push(alloc);
			}

			linkBlocks(block, functionBlock);

			auto functionEntryPoint = entryPoint
				.withValues(values)
				.withBlock(functionBlock);

			std::vector<DzResult> result;

			auto functionResults = function->build(functionEntryPoint, values);

			for (const auto &[lastEntryPoint, returnValue] : functionResults)
			{
				auto consumerBlock = llvm::BasicBlock::Create(*context);

				linkBlocks(lastEntryPoint.block(), consumerBlock);

				auto consumerEntryPoint = functionEntryPoint
					.withBlock(consumerBlock);

				auto consumerResults = m_consumer->build(consumerEntryPoint, returnValue);

				for (const auto &consumerResult : consumerResults)
				{
					result.push_back(consumerResult);
				}
			}

			return result;
		}
	}

	throw new std::exception(); // TODO
}