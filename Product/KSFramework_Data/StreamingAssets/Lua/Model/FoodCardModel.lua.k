local FoodCardModel = class("FoodCardModel",import("Model/BaseCardModel"))

function FoodCardModel:ctor(cardNumber,cardType,id)
	FoodCardModel.super.ctor(self,cardNumber,cardType,id)
end

function FoodCardModel:getMainTexPrefix()
	return "Images/cards/FoodCards/"
end

return FoodCardModel