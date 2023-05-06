#ifndef STRINGITERATABLE_H
#define STRINGITERATABLE_H

#include "values/IIteratable.h"

class StringIteratable : public IIteratable
{
	friend class Emitter;

	public:
		StringIteratable(const ReferenceValue *index, llvm::Value *address, const ReferenceValue *length);

		std::vector<DzResult> accept(const DefaultNodeVisitor &visitor, DefaultVisitorContext context) const override;

	private:
		const ReferenceValue *m_index;
		const Node *m_node;

		llvm::Value *m_address;

		const ReferenceValue *m_length;
};


#endif // STRINGITERATABLE_H
