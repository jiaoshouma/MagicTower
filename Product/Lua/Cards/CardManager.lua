local CardManager = class("CardManager")
local BaseCard = import("Cards/BaseCard")

function CardManager:ctor(...)
	self.cardPrefabsByTypes_ = {}
	self.cardPool_ = {}
	self.cardPoolRoot_ = SunUtils.newGameObject("CardPool")
	self.cardPoolRoot_:SetActive(false)
end

function CardManager.get()
	if not CardManager.instance_ then
		local instance = CardManager.new()
		CardManager.instance_ = instance
	end
	return CardManager.instance_
end

function CardManager:prewarm()
	if not next(self.cardPrefabsByTypes_) then
		for _,cardType in pairs(sun.CardType) do
			self.cardPool_[cardType] = self.cardPool_[cardType] or {}
			local prefab = self:loadCard(cardType)
			for i = 1,10 do
				local prefab = self:loadCard(cardType)
				-- resultGo = CS.UnityEngine.GameObject.Instantiate(prefab)
				resultGo = SunUtils.AddChild(self.cardPoolRoot_,prefab)
				table.insert(self.cardPool_[cardType],resultGo)
			end
		end
	end
end

function CardManager:loadCard(cardType,path)
	if not path then
		if cardType == sun.CardType.ROLE then
			path = "Prefabs/Cards/base_role_card"
		elseif cardType == sun.CardType.STG then
			path = "Prefabs/Cards/base_stg_card"
		elseif cardType == sun.CardType.SOLDIER then
			path = "Prefabs/Cards/base_soldier_card"
		elseif cardType == sun.CardType.FOOD then
			path = "Prefabs/Cards/base_food_card"
		end
	end
	local cardPrefab = self.cardPrefabsByTypes_[cardType]
	if not cardPrefab then
		path = path..".prefab"
		cardPrefab = sun.AssetsLoader.get():loadAsset(path)
	end
	return cardPrefab
end

function CardManager:getCardInstance(cardType)
	self.cardPool_[cardType] = self.cardPool_[cardType] or {}
	local resultGo
	if #self.cardPool_[cardType]<=0 then
		local prefab = self:loadCard(cardType)
		resultGo = CS.UnityEngine.GameObject.Instantiate(prefab)
	else
		resultGo = table.remove(self.cardPool_[cardType],#self.cardPool_[cardType])
	end
	return resultGo
end

-- recommand use setting like below:
-- local instance = RoleCardSettings.GetInstance()
-- print(instance.Count,"====Count==========")
-- local keys = instance:GetKeys()
-- for i,v in ipairsArray(keys) do
-- 	print(i,v,"=========key=========")
-- end
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

function CardManager:getCardModelClass(cardNumber,cardType)
	local setting = self:getCardsSetting(cardType)
	local modelRes = setting.Get(cardNumber).model_res
	local prefix,posfix,path
	prefix = "Model/"
	if cardType == sun.CardType.ROLE then
		posfix = "RoleCardModel"
	elseif cardType == sun.CardType.STG then
		posfix = "StgCardModel"
	elseif cardType == sun.CardType.SOLDIER then
		posfix = "SoldierCardModel"
	elseif cardType == sun.CardType.FOOD then
		posfix = "FoodCardModel"
	end
	if modelRes and modelRes ~= "" then
		path = prefix .. modelRes
	else
		path = prefix .. posfix
	end
	return import(path)
end

function CardManager:createCard(cardNumber,cardType,cardID)
	local class = self:getCardClass(cardNumber,cardType)
	local card = class.new(cardNumber,cardType,cardID)
	return card
end

return CardManager
