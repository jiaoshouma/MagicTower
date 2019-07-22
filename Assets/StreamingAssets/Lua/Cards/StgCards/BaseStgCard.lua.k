local BaseStgCard = class("BaseStgCard",import("Cards/BaseCard"))

function BaseStgCard:ctor(cardNumber,cardType,id)
	BaseStgCard.super.ctor(self,cardNumber,cardType,id)
	
end

function BaseStgCard:initComponents()
	
end

function BaseStgCard:getCardBaseImg(isSimple)
	if isSimple then
		return "UIAtlas/CardCommonUI/base_simple_stg.png"
	else
		return "Images/cards/StgCards/base_stg.png"
	end
end

return BaseStgCard