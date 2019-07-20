local BaseSoldierCard = class("BaseSoldierCard",import("Cards/BaseCard"))

function BaseSoldierCard:ctor(cardNumber,cardType,id)
	BaseSoldierCard.super.ctor(self,cardNumber,cardType,id)
	
end

function BaseSoldierCard:getCardPrefabPath()
	return "Prefabs/Cards/base_soldier_card"
end

function BaseSoldierCard:initComponents()
	
end

function BaseSoldierCard:getCardBaseImg(isSimple)
	if isSimple then
		return "UIAtlas/CardCommonUI/base_simple_soldier.png"
	else
		return "Images/cards/SoldierCards/base_soldier.png"
	end
end


return BaseSoldierCard