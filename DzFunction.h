#ifndef DZFUNCTION_H
#define DZFUNCTION_H

#include "DzCallable.h"

class DzArgument;

class DzFunction : public DzCallable
{
	public:
		DzFunction(const std::string &name
			, std::vector<DzArgument *> arguments
			, DzValue *block
			);

		std::string name() const override;

		FunctionAttribute attribute() const override;

		bool hasMatchingSignature(const EntryPoint &entryPoint, const Stack &values, size_t numberOfArguments) const override;

		Stack build(const EntryPoint &entryPoint, Stack values) const override;

	private:
		std::string m_name;
		std::vector<DzArgument *> m_arguments;

		DzValue *m_block;
};


#endif // DZFUNCTION_H
