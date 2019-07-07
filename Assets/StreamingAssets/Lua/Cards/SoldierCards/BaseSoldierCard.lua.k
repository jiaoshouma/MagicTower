local BaseSoldierCard = class("BaseSoldierCard",import("Cards/BaseCard"))

function BaseSoldierCard:ctor(cardNumber,cardType)
	BaseSoldierCard.super.ctor(self,cardNumber,cardType)
	
end

function BaseSoldierCard:getCardPrefabPath()
	return "Prefabs/Cards/base_soldier_card"
end

function BaseSoldierCard:initComponents()
	
end

return BaseSoldierCard