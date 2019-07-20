local StgCardModel = class("StgCardModel",import("Model/BaseCardModel"))

function StgCardModel:ctor(cardNumber,cardType,id)
	StgCardModel.super.ctor(self,cardNumber,cardType,id)
end

function StgCardModel:getMainTexPrefix()
	return "Images/cards/StgCards/"
end

return StgCardModel