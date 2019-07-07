local RoleCardModel = class("RoleCardModel",import("Model/BaseCardModel"))

function RoleCardModel:ctor(cardNumber,cardType,idx)
	RoleCardModel.super.ctor(self,cardNumber,cardType,idx)

end

return RoleCardModel