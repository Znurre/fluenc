#ifndef FUNCTIONCALLPROXYNODE_H
#define FUNCTIONCALLPROXYNODE_H

#include "Node.h"

class FunctionCallProxyNode : public Node
{
	friend class Emitter;

	public:
		FunctionCallProxyNode(const std::vector<std::string> &names
			, const Node *regularCall
			, const Node *consumer
			);

		std::vector<DzResult> accept(const Emitter &visitor, const EntryPoint &entryPoint, Stack values) const override;

	private:
		std::vector<std::string> m_names;

		const Node *m_regularCall;
		const Node *m_consumer;
};

#endif // FUNCTIONCALLPROXYNODE_H
