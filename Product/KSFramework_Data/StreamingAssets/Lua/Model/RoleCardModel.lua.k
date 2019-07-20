local RoleCardModel = class("RoleCardModel",import("Model/BaseCardModel"))

function RoleCardModel:ctor(cardNumber,cardType,id)
	RoleCardModel.super.ctor(self,cardNumber,cardType,id)
	
end

function RoleCardModel:initAttributes()
	RoleCardModel.super.initAttributes(self)
	local setting = self:getSetting()
	self.belong_ = setting.belong
	self.force_ = setting.force
	self.command_ = setting.command
	self.moral_ = setting.moral
end

function RoleCardModel:getMainTexPrefix()
	return "Images/cards/RoleCards/"
end

function RoleCardModel:getBelong()
	return self.belong_ or 4
end

function RoleCardModel:getForce()
	return self.force_ or 1
end

function RoleCardModel:getCommand()
	return self.command_ or 1
end

function RoleCardModel:getMoral()
	return self.moral_ or 1
end

return RoleCardModel