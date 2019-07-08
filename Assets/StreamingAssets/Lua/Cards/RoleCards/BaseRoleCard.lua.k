local BaseRoleCard = class("BaseRoleCard",import("Cards/BaseCard"))

function BaseRoleCard:ctor(cardNumber,cardType,idx)
	BaseRoleCard.super.ctor(self,cardNumber,cardType,idx)
	
end

function BaseRoleCard:getCardPrefabPath()
	return "Prefabs/Cards/base_role_card"
end

function BaseRoleCard:getCardBaseImg(isSimple)
	if isSimple then
		return "UIAtlas/CardCommonUI/base_simple_role.png"
	else
		return "Images/cards/RoleCards/base.png"
	end
end

function BaseRoleCard:initComponents()
	
end

return BaseRoleCard