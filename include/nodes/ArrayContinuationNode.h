#ifndef ARRAYCONTINUATIONNODE_H
#define ARRAYCONTINUATIONNODE_H

#include "Node.h"

class ReferenceValue;

class ArrayContinuationNode : public Node
{
	public:
		ArrayContinuationNode(const ReferenceValue *index, const Node *node, const Type *iteratorType);

		std::vector<DzResult> build(const EntryPoint &entryPoint, Stack values) const override;

	private:
		const ReferenceValue *m_index;
		const Node *m_node;
		const Type *m_iteratorType;
};

#endif // ARRAYCONTINUATIONNODE_H
