local BaseScene = class("BaseScene")

function BaseScene:ctor(sType)
	self.type_ = sType
	self.eventProxy_ = sun.EventDispatcher.inner():newProxy(self)
	self:registerEvents()
end

function BaseScene:getType()
	return self.type_
end

function BaseScene:registerEvents()

end

function BaseScene:dispose()
	sun.EventDispatcher.inner():diposeProxy(self)
end

return BaseScene