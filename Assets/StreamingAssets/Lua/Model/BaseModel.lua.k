local BaseModel = class("BaseModel")

function BaseModel:ctor(...)
	self.eventProxy_ = sun.EventDispatcher.outer():newProxy(self)

	self:registerEvents()
end

function BaseModel:registerEvents()
	
end

return BaseModel