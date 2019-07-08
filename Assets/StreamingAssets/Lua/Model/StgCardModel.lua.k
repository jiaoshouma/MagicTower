local StgCardModel = class("StgCardModel",import("Model/BaseCardModel"))

function StgCardModel:ctor(cardNumber,cardType,idx)
	StgCardModel.super.ctor(self,cardNumber,cardType,idx)
end

return StgCardModel