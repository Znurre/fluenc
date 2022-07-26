#include "nodes/ExpansionNode.h"

ExpansionNode::ExpansionNode(const Node *consumer, const std::shared_ptr<peg::Ast> &ast)
	: m_consumer(consumer)
	, m_ast(ast)
{
}

std::vector<DzResult> ExpansionNode::accept(const Emitter &visitor, const EntryPoint &entryPoint, Stack values) const
{
	return visitor.visitExpansion(this, entryPoint, values);
}
