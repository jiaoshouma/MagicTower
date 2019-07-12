local SoldierCardModel = class("SoldierCardModel",import("Model/BaseCardModel"))

function SoldierCardModel:ctor(cardNumber,cardType,idx)
	SoldierCardModel.super.ctor(self,cardNumber,cardType,idx)
end

function SoldierCardModel:getMainTexPrefix()
	return "Images/cards/SoldierCards/"
end

return SoldierCardModel