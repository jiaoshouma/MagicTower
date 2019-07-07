local CardManager = class("CardManager")
local BaseCard = import("Cards/BaseCard")

function CardManager:ctor(...)
	self.cardPrefabsByTypes_ = {}
end

function CardManager.get()
	if not CardManager.instance_ then
		local instance = CardManager.new()
		CardManager.instance_ = instance
	end
	return CardManager.instance_
end

function CardManager:loadCard(cardType,path)
	local cardPrefab = self.cardPrefabsByTypes_[cardType]
	if not cardPrefab then
		path = path..".prefab"
		cardPrefab = sun.AssetsLoader.get():loadAsset(path)
	end
	return cardPrefab
end

function CardManager:getCardsSetting(cardType)
	if cardType == sun.CardType.ROLE then
		return RoleCardSettings
	elseif cardType == sun.CardType.STG then
		return StgCardSettings
	elseif cardType == sun.CardType.SOLDIER then
		return SoldierCardSettings
	elseif cardType == sun.CardType.FOOD then
		return FoodCardSettings
	end
end

function CardManager:getCardClass(cardNumber,cardType)
	local setting = self:getCardsSetting(cardType)
	local logicRes = setting.Get(cardNumber).logic_res
	local prefix,posfix,path
	if cardType == sun.CardType.ROLE then
		prefix = "Cards/RoleCards/"
		posfix = "BaseRoleCard"
	elseif cardType == sun.CardType.STG then
		prefix = "Cards/StgCards/"
		posfix = "BaseStgCard"
	elseif cardType == sun.CardType.SOLDIER then
		prefix = "Cards/SoldierCards/"
		posfix = "BaseSoldierCard"
	elseif cardType == sun.CardType.FOOD then
		prefix = "Cards/FoodCards/"
		posfix = "BaseFoodCard"
	end
	if logicRes and logicRes ~= "" then
		path = prefix .. logicRes
	else
		path = prefix .. posfix
	end
	return import(path)
end

function CardManager:createCard(cardNumber,cardType)
	local class = self:getCardClass(cardNumber,cardType)
	local card = class.new(cardNumber,cardType)
	return card
end

function CardManager:createCardFor(cardNumber,cardType,player)

end

return CardManager
