local MiscTable = class("MiscTable")

function MiscTable:ctor()
	self.data_ = import("Data/tables/misc").data
end

function MiscTable:getMiscParams(key)
	return self.data_[key]
end

function MiscTable:getMiscParam(key,k)
	return (self.data_[key] or {})[k]
end

return MiscTable