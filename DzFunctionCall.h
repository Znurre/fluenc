#ifndef DZFUNCTIONCALL_H
#define DZFUNCTIONCALL_H

#include <numeric>

#include "DzValue.h"

#include "values/UserTypeValue.h"
#include "values/DependentValue.h"
#include "values/TaintedValue.h"

class DzFunctionCall : public DzValue
{
	public:
		DzFunctionCall(const std::string &name);

		int order(const EntryPoint &entryPoint) const override;

		std::vector<DzResult> build(const EntryPoint &entryPoint, Stack values) const override;

	private:
		const DzCallable *findFunction(const EntryPoint &entryPoint, Stack values) const;

		template<typename Container>
		const EntryPoint *findTailCallTarget(const EntryPoint *candidate, Container container) const
		{
			return std::accumulate(container.begin(), container.end(), candidate, [&](const EntryPoint *target, auto value) -> const EntryPoint *
			{
				if (!target)
				{
					return nullptr;
				}

				if (auto userTypeValue = dynamic_cast<const UserTypeValue *>(value))
				{
					auto fields = userTypeValue->fields();

					std::vector<const BaseValue *> values;

					std::transform(begin(fields), end(fields), std::back_inserter(values), [](auto field)
					{
						return field->value();
					});

					return findTailCallTarget(target, values);
				}

				if (auto dependentValue = dynamic_cast<const DependentValue *>(value))
				{
					auto provider = dependentValue->provider();

					if (provider->depth() < target->depth())
					{
						return provider->entry();
					}
				}

				if (auto tainted = dynamic_cast<const TaintedValue *>(value))
				{
					return nullptr;
				}

				return target;
			});
		}

		std::vector<DzResult> regularCall(const EntryPoint &entryPoint, Stack values) const;

		std::string m_name;
};

#endif // DZFUNCTIONCALL_H
