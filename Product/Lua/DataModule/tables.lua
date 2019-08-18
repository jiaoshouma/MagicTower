sun = sun or {}
local mt = {}
local name2classes = {
	--can name exception here.
}
setmetatable(name2classes,{__index = function(t,k)
	local className = string.format("DataModule/%s_table",k)
	name2classes[k] = className
	return className
end})

mt = {__index = function(t,k)
	local className = name2classes[k]
	local instance = import(className).new()
	sun.tables[k] = instance
	return instance
end}

sun.tables = {}
setmetatable(sun.tables,mt)
