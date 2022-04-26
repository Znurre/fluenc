#ifndef FUNCTIONNOTFOUNDEXCEPTION_H
#define FUNCTIONNOTFOUNDEXCEPTION_H

#include "CompilerException.h"
#include "Stack.h"

class FunctionNotFoundException : public CompilerException
{
	public:
		FunctionNotFoundException(const std::shared_ptr<peg::Ast> &ast
			, const std::string &name
			, const Stack &values
			);

		std::string message() const override;

	private:
		std::string m_name;

		Stack m_values;
};

#endif // FUNCTIONNOTFOUNDEXCEPTION_H
