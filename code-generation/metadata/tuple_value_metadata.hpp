#pragma once

#include "value_metadata.hpp"

struct tuple_value_metadata : public value_metadata
{
	std::string name() const override;
};