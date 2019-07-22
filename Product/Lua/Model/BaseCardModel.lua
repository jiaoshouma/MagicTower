local BaseCardModel = class("BaseCardModel")

function BaseCardModel:ctor(cardNumber,cardType,id)
	self.cardID_ = cardNumber
	self.cardType_ = cardType
	self.id_ = id

	self:initAttributes()
end

function BaseCardModel:initAttributes()
	local setting = self:getSetting()
	self.nameKey_ = setting.name
	self.descKey_ = setting.desc
	self.texRes_ = setting.tex
	self.simpleTexAtlas_ = setting.simple_atlas ~= "" and setting.simple_atlas or "CardSimple"
	self.simpleTexRes_ = setting.simple_tex ~= "" and setting.simple_tex or "base_simple_"..self:getPostFix()
end

function BaseCardModel:getPostFix()
	local cardType = self.cardType_
	if cardType == sun.CardType.ROLE then
		return "role"
	elseif cardType == sun.CardType.STG then
		return "stg"
	elseif cardType == sun.CardType.SOLDIER then
		return "soldier"
	elseif cardType == sun.CardType.FOOD then
		return "food"
	end
end

function BaseCardModel:getNameKey()
	return self.nameKey_ or ""
end

function BaseCardModel:getSimpleTexRes()
	return self.simpleTexRes_
end

function BaseCardModel:getTexRes()
	if not self.texRes_ or self.texRes_ == "" then
		return "Images/cards/Common/Unknown.png"
	end
	return self:getMainTexPrefix() ..  self.texRes_ .. ".png"
end

function BaseCardModel:getMainTexPrefix()
	return "Images/cards/"
end

function BaseCardModel:getDescKey()
	return self.descKey_
end

function BaseCardModel:getSetting()
	if not self.setting_ then
		local typeSettings = sun.CardManager.get():getCardsSetting(self.cardType_)
		self.setting_ = typeSettings.Get(self.cardID_)
	end
	return self.setting_
end

function BaseCardModel:getName()
	local name = string.format("%s_%s_%s",self.cardID_,self.cardType_,self.id_)
	return name
end

function BaseCardModel:registerEvent(eventName,callback)
	if not self.eventProxy_ then
		self.eventProxy_ = sun.EventDispatcher.outer():newProxy(self:getName())
	end
	self.eventProxy_:addEventListener(eventName,callback)
end

function BaseCardModel:onDispose()
	sun.EventDispatcher.outer():disposeProxy(self:getName())
end

return BaseCardModel