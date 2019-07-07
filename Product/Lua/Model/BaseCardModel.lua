local BaseCardModel = class("BaseCardModel")

function BaseCardModel:ctor(cardNumber,cardType,idx)
	self.cardID_ = cardNumber
	self.cardType_ = cardType
	self.idx_ = idx
end

function BaseCardModel:getSetting()
	return sun.CardManager.get():getCardsSetting(self.cardType_)
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