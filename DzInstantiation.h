#ifndef DZINSTANTIATION_H
#define DZINSTANTIATION_H

#include <unordered_set>

#include "DzValue.h"

class DzTypeName;
class DzAssignment;

class DzInstantiation : public DzValue
{
	public:
		DzInstantiation(DzValue *consumer
			, DzTypeName *type
			, const std::vector<std::string> &fields
			);

		std::vector<DzResult> build(const EntryPoint &entryPoint, Stack values) const override;

	private:
		DzValue *m_consumer;
		DzTypeName *m_type;

		std::unordered_set<std::string> m_fields;
};

#endif // DZINSTANTIATION_H