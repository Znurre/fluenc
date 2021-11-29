#include <numeric>

#include <llvm/IR/Instructions.h>

#include "InteropHelper.h"
#include "IndexIterator.h"
#include "EntryPoint.h"
#include "DzFieldAccess.h"
#include "VoidIterator.h"

#include "types/IPrototype.h"

#include "values/NamedValue.h"
#include "values/TypedValue.h"
#include "values/UserTypeValue.h"

const BaseValue *InteropHelper::createReadProxy(llvm::Value *value, const Type *type, const EntryPoint &entryPoint)
{
	auto &context = entryPoint.context();

	auto block = entryPoint.block();

	if (auto prototype = dynamic_cast<const IPrototype *>(type))
	{
		auto fields = prototype->fields(entryPoint);

		std::vector<llvm::Type *> types;

		std::transform(begin(fields), end(fields), std::back_insert_iterator(types), [&](auto field)
		{
			auto type = field->type();

			return type->storageType(*context);
		});

		auto structType = llvm::StructType::get(*context, types);
		auto structPtr = structType->getPointerTo();

		auto cast = new llvm::BitCastInst(value, structPtr, "cast", block);

		std::vector<const NamedValue *> fieldValues;

		std::transform(begin(fields), end(fields), index_iterator(), std::back_insert_iterator(fieldValues), [&](auto field, auto index)
		{
			auto fieldAccess = new DzFieldAccess(cast, field, index);

			return new NamedValue { field->name(), entryPoint, fieldAccess, nullptr };
		});

		return new UserTypeValue { prototype, fieldValues };
	}

	return new TypedValue { type, value };
}

llvm::Value *InteropHelper::createWriteProxy(const UserTypeValue *userTypeValue, const EntryPoint &entryPoint)
{
	auto &context = entryPoint.context();
	auto &module = entryPoint.module();

	auto block = entryPoint.block();

	auto dataLayout = module->getDataLayout();

	auto fields = userTypeValue->fields();

	std::vector<const TypedValue *> elementValues;

	std::transform(begin(fields), end(fields), std::back_insert_iterator(elementValues), [&](const NamedValue *field) -> const TypedValue *
	{
		auto fieldResults = field->build(block, Stack());
		auto &[_, fieldValues] = *fieldResults.begin();

		auto fieldValue = fieldValues.pop();

		if (auto typedValue = dynamic_cast<const TypedValue *>(fieldValue))
		{
			return typedValue;
		}

		if (auto userTypeValue = dynamic_cast<const UserTypeValue *>(fieldValue))
		{
			return new TypedValue { userTypeValue->type(), createWriteProxy(userTypeValue, entryPoint) };
		}

		throw new std::exception();
	});

	std::vector<llvm::Type *> elementTypes;

	std::transform(begin(elementValues), end(elementValues), std::back_insert_iterator(elementTypes), [&](auto value)
	{
		auto type = value->type();

		return type->storageType(*context);
	});

	auto intType = llvm::Type::getInt32Ty(*context);
	auto structType = llvm::StructType::get(*context, elementTypes);

	auto alloc = entryPoint.alloc(structType);

	std::transform(begin(elementValues), end(elementValues), index_iterator(), void_iterator<llvm::Value *>(), [&](auto field, auto index)
	{
		llvm::Value *indexes[] =
		{
			llvm::ConstantInt::get(intType, 0),
			llvm::ConstantInt::get(intType, index)
		};

		auto gep = llvm::GetElementPtrInst::CreateInBounds(alloc, indexes, "gep", block);

		auto type = field->type();
		auto storageType = type->storageType(*context);

		auto align = dataLayout.getABITypeAlign(storageType);

		return new llvm::StoreInst(*field, gep,false, align, block);
	});

	return new llvm::BitCastInst(alloc, llvm::Type::getInt8PtrTy(*context), "cast", block);
}