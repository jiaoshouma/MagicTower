local BaseSoldierCard = class("BaseSoldierCard",import("Cards/BaseCard"))

function BaseSoldierCard:ctor(cardNumber,cardType,idx)
	BaseSoldierCard.super.ctor(self,cardNumber,cardType,idx)
	
end

function BaseSoldierCard:getCardPrefabPath()
	return "Prefabs/Cards/base_soldier_card"
end

function BaseSoldierCard:initComponents()
	
end

return BaseSoldierCard