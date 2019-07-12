local FoodCardModel = class("FoodCardModel",import("Model/BaseCardModel"))

function FoodCardModel:ctor(cardNumber,cardType,idx)
	FoodCardModel.super.ctor(self,cardNumber,cardType,idx)
end

function FoodCardModel:getMainTexPrefix()
	return "Images/cards/FoodCards/"
end

return FoodCardModel