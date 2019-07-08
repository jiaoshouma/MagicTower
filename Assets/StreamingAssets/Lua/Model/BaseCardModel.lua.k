local BaseCardModel = class("BaseCardModel")

function BaseCardModel:ctor(cardNumber,cardType,idx)
	self.cardID_ = cardNumber
	self.cardType_ = cardType
	self.idx_ = idx

	self:initAttributes()
end

function BaseCardModel:initAttributes()
	local setting = self:getSetting()
	self.nameKey_ = setting.name
	self.texRes_ = setting.tex
end

function BaseCardModel:getNameKey()
	return self.nameKey_ or ""
end

function BaseCardModel:getTexRes()
	return self.texRes_
end

function BaseCardModel:getSetting()
	if not self.setting_ then
		local typeSettings = sun.CardManager.get():getCardsSetting(self.cardType_)
		self.setting_ = typeSettings.Get(self.cardID_)
	end
	return self.setting_
end

function BaseCardModel:getName()
	local name = string.format("%s_%s_%s",self.cardID_,self.cardType_,self.idx_)
	return name
end

function BaseCardModel:registerEvent(eventName,callback)
	if not self.eventProxy_ then
		self.eventProxy_ = sun.EventDispatcher.outer():newProxy(self:getName())
	end
	self.eventProxy_:addEventListener(eventName,callback)
end

function BaseCardModel:onDispose()
	sun.EventDispatcher.outer():diposeProxy(self:getName())
end

return BaseCardModel