#ifndef COMPILEREXCEPTION_H
#define COMPILEREXCEPTION_H

#include <exception>
#include <memory>

#include "TokenInfo.h"

class CompilerException : public std::exception
{
	public:
		CompilerException(const std::shared_ptr<peg::Ast> &ast);

		size_t row() const;
		size_t column() const;
		size_t length() const;

		virtual std::string message() const = 0;

	private:
		std::shared_ptr<peg::Ast> m_ast;
};

#endif // COMPILEREXCEPTION_H
