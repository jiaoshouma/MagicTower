local SoldierCardModel = class("SoldierCardModel",import("Model/BaseCardModel"))

function SoldierCardModel:ctor(cardNumber,cardType,id)
	SoldierCardModel.super.ctor(self,cardNumber,cardType,id)
end

function SoldierCardModel:getMainTexPrefix()
	return "Images/cards/SoldierCards/"
end

return SoldierCardModel