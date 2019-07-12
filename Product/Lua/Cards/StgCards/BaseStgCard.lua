local BaseStgCard = class("BaseStgCard",import("Cards/BaseCard"))

function BaseStgCard:ctor(cardNumber,cardType,idx)
	BaseStgCard.super.ctor(self,cardNumber,cardType,idx)
	
end

function BaseStgCard:getCardPrefabPath()
	return "Prefabs/Cards/base_stg_card"
end

function BaseStgCard:initComponents()
	
end

return BaseStgCard