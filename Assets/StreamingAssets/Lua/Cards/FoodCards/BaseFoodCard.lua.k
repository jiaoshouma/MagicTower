local BaseFoodCard = class("BaseFoodCard",import("Cards/BaseCard"))

function BaseFoodCard:ctor(cardNumber,cardType)
	BaseFoodCard.super.ctor(self,cardNumber,cardType)
	
end

function BaseFoodCard:getCardPrefabPath()
	return "Prefabs/Cards/base_food_card"
end

function BaseFoodCard:initComponents()
	
end

return BaseFoodCard