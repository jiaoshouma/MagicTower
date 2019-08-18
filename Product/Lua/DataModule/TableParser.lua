local TableParser = class("TableParser")

function TableParser.parse(name,callback)
	local path = string.format("Data/tables/%s",name)
	local data = import(path)
	local key2index = {}
	for index,key in ipairs(data.keys) do
		key2index[key] = index
	end
	local mt = {__index = function(t,k)
		local index = key2index[k]
		if index then
			return t[index]
		else
			error(string.format("No such key:%s in table:%s",k,name))
		end
	end}
	for _,row in ipairs(data.rows) do
		setmetatable(row,mt)
		callback(row)
	end
end

return TableParser