local BaseFoodCard = class("BaseFoodCard",import("Cards/BaseCard"))

function BaseFoodCard:ctor(cardNumber,cardType,id)
	BaseFoodCard.super.ctor(self,cardNumber,cardType,id)
	
end

function BaseFoodCard:getCardPrefabPath()
	return "Prefabs/Cards/base_food_card"
end

function BaseFoodCard:initComponents()
	
end

function BaseFoodCard:getCardBaseImg(isSimple)
	if isSimple then
		return "UIAtlas/CardCommonUI/base_simple_food.png"
	else
		return "Images/cards/FoodCards/base_food.png"
	end
end

return BaseFoodCard