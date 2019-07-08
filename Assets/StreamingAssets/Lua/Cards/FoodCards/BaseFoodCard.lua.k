local BaseFoodCard = class("BaseFoodCard",import("Cards/BaseCard"))

function BaseFoodCard:ctor(cardNumber,cardType,idx)
	BaseFoodCard.super.ctor(self,cardNumber,cardType,idx)
	
end

function BaseFoodCard:getCardPrefabPath()
	return "Prefabs/Cards/base_food_card"
end

function BaseFoodCard:initComponents()
	
end

return BaseFoodCard