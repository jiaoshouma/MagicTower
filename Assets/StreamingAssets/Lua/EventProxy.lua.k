local EventProxy = class("EventProxy")

function EventProxy:ctor(name)
	self.name_ = name
	self.eventMap_ = {}
	self.onceEventMap_ = {}
end

function EventProxy:getName()
	return self.name_
end

function EventProxy:addEventListener(eventName,callback,isOnce)
	if isOnce then
		self.onceEventMap_[eventName] = callback
	else
		self.eventMap_[eventName] = callback
	end
end

function EventProxy:removeEventListener(eventName)
	self.eventMap_[eventName] = nil
end

function EventProxy:removeAllEventListner()
	self.eventMap_ = {}
end

function EventProxy:getCallback(eventName)
	return self.eventMap_[eventName] or self.onceEventMap_[eventName]
end

function EventProxy:afterCall(eventName)
	self.onceEventMap_[eventName] = nil
end

function EventProxy:dispose()
	self:removeAllEventListner()
end

return EventProxy