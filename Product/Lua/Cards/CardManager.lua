local CardManager = class("CardManager")

function CardManager:ctor(...)

end

function CardManager.get()
	if not CardManager.instance_ then
		local instance = CardManager.new()
		CardManager.instance_ = instance
	end
	return CardManager.instance_
end

function CardManager:loadCard(cardNumber,cardType)
	local prefabPath
	if cardType == sun.CardType.ROLE then
		prefabPath = "Prefabs/Cards/base_role_card"
	elseif cardType == sun.CardType.STG then
		prefabPath = "Prefabs/Cards/base_stg_card"
	elseif cardType == sun.CardType.SOLDIER then
		prefabPath = "Prefabs/Cards/base_soldier_card"
	elseif cardType == sun.CardType.FOOD then
		prefabPath = "Prefabs/Cards/base_food_card"
	end
	local cardPrefab = sun.AssetsLoader.get():loadAsset(prefabPath)
	
end

return CardManager
