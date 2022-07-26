#ifndef BLOCKINSTRUCTIONNODE_H
#define BLOCKINSTRUCTIONNODE_H

#include "IBlockInstruction.h"

class BlockInstructionNode : public IBlockInstruction
{
	friend class Emitter;

	public:
		BlockInstructionNode(const Node *subject, bool containsIterator);

		bool containsIterator() const override;

		std::vector<DzResult> accept(const Emitter &visitor, const EntryPoint &entryPoint, Stack values) const override;

	private:
		const Node *m_subject;

		bool m_containsIterator;
};

#endif // BLOCKINSTRUCTIONNODE_H
