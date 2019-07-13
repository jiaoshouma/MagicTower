--对接后端，日后再说,先留接口
local Backend = class("Backend")

function Backend:ctor( ... )
	-- body
end

function Backend.get()
	if not Backend.instance_ then
		Backend.instance_ = Backend.new()
	end
	return Backend.instance_
end

function Backend:request(mid,msg)
	
end

return Backend