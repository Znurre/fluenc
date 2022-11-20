#include <numeric>

#include "IteratorStorage.h"
#include "IndexIterator.h"

#include "values/ArrayValueGenerator.h"
#include "values/ArrayValue.h"
#include "values/ReferenceValue.h"
#include "values/IndexedValue.h"
#include "values/ArrayValueProxy.h"

#include "nodes/ArrayElementNode.h"

#include "types/ArrayType.h"
#include "types/IteratorType.h"

ArrayValueGenerator::ArrayValueGenerator(const std::vector<DzResult > &values, const std::shared_ptr<peg::Ast> &ast, size_t id, size_t size)
	: m_values(values)
	, m_ast(ast)
	, m_id(id)
	, m_size(size)
{
}

const IIteratable *ArrayValueGenerator::generate(const EntryPoint &entryPoint, GenerationMode mode) const
{
	UNUSED(mode);

	auto iteratorStorage = entryPoint
		.iteratorStorage();

	auto index = iteratorStorage->getOrCreate(std::to_string(m_id), entryPoint);

	auto subject = new ArrayValue(m_ast, index, type(), m_values, m_size);

	return new ArrayValueProxy(index, subject);
}

const Type *ArrayValueGenerator::type() const
{
	if (m_values.size() == 1)
	{
		auto [_, values] = *m_values.begin();

		std::vector<const Type *> types;

		std::transform(values.rbegin(), values.rend(), std::back_inserter(types), [](auto value)
		{
			return value->type();
		});

		return ArrayType::get(types);
	}

	return IteratorType::instance();
}

size_t ArrayValueGenerator::size() const
{
	return m_size;
}

const BaseValue *ArrayValueGenerator::elementAt(size_t index) const
{
	if (m_values.size() != 1)
	{
		throw new std::exception();
	}

	auto [_, values] = m_values[0];

	if (index >= values.size())
	{
		throw new std::exception();
	}

	auto indexed = dynamic_cast<const IndexedValue *>(*(values.rbegin() + index));

	return indexed->subject();
}

const ILazyValueGenerator *ArrayValueGenerator::clone(const EntryPoint &entryPoint, CloneStrategy strategy) const
{
	if (m_values.size() == 1)
	{
		auto [inputEntryPoint, inputValues] = m_values[0];

		std::vector<const BaseValue *> clonedValues;

		std::transform(inputValues.begin(), inputValues.end(), std::back_inserter(clonedValues), [&](auto value)
		{
			return value->clone(entryPoint, strategy);
		});

		return new ArrayValueGenerator({{ inputEntryPoint, clonedValues }}, m_ast, m_id, m_size);
	}

	throw new std::exception();
}

const ILazyValueGenerator *ArrayValueGenerator::forward(size_t id) const
{
	return new ArrayValueGenerator(m_values, m_ast, id, m_size);
}
