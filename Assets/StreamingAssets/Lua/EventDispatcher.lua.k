local EventDispatcher = class("EventDispatcher")

function EventDispatcher:ctor(...)
	self.eventProxy_ = {}
end

function EventDispatcher.outer()
	if not EventDispatcher.outerInstance_ then
		local instance = EventDispatcher.new()
		EventDispatcher.outerInstance_ = instance
	end
	return EventDispatcher.outerInstance_
end

function EventDispatcher.inner()
	if not EventDispatcher.innerInstance_ then
		local instance = EventDispatcher.new()
		EventDispatcher.innerInstance_ = instance
	end
	return EventDispatcher.innerInstance_
end

function EventDispatcher:dispatchEvent(eventName,params)
	for _,proxy in pairs(self.eventProxy_) do
		local callback = proxy:getCallback(eventName)
		-- print_r(_)
		-- print(_,proxy,callback,eventName,"---------------------")
		if callback then
			local event = {}
			event.params = params
			event.eventName = eventName
			callback(event)
			proxy:afterCall(eventName)
		end
	end
end

function EventDispatcher:newProxy(name)
	local p = import("EventProxy").new(name)
	self.eventProxy_[name] = p
	return p
end

-- function EventDispatcher:disposeProxy(para)
-- 	if type(para) == "string" then
-- 		local p = self.eventProxy_[para]
-- 		if p then
-- 			p:dispose()
-- 		end
-- 		self.eventProxy_[name] = nil
-- 	elseif type(para) == "table" then
-- 		for name,p in pairs(self.eventProxy_) do
-- 			if p == para then
-- 				p:dispose()
-- 				self.eventProxy_[name] = nil
-- 				break
-- 			end
-- 		end
-- 	end
-- end

function EventDispatcher:disposeProxy(para)
	local p = self.eventProxy_[para]
	if p then
		p:dispose()
	end
	self.eventProxy_[para] = nil
end

return EventDispatcher