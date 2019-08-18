local MissionTable = class("MissionTable")

function MissionTable:ctor()
	self:init()

	import("DataModule/TableParser").parse("mission",function(row)
		local id = tonumber(row["id"])
		table.insert(self.ids_,id)
		self.names_[id] = row["name"]
		self.descs_[id] = row["desc"]
		self.ais_[id] = row["ai"]
		self.root_ids_[id] = row["root_id"]
		self.conditions_[id] = row["condition"]
	end)
end

function MissionTable:init()
	self.ids_ = {}
	self.names_ = {}
	self.descs_ = {}
	self.ais_ = {}
	self.root_ids_ = {}
	self.conditions_ = {}
end

return MissionTable