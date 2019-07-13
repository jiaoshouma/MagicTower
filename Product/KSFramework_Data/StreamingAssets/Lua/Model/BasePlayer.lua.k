local BasePlayer = class("BasePlayer",import("Model/BaseModel"))

function BasePlayer:ctor(...)
	BasePlayer.super.ctor(self,...)

	self:initDecks()
end

function BasePlayer:initDecks()
	self.decks_ = {}
	local deckInfo = {}
	deckInfo.name = "Default"
	deckInfo.cards = {}
	for i = 1,50 do
		local cardInfo = {}
		cardInfo.id = 7
		cardInfo.type = 1
		table.insert(deckInfo.cards,cardInfo)
	end
	self.decks_[1] = deckInfo	
	self.usingDeck_ = deckInfo
end

function BasePlayer:registerEvents()

end

function BasePlayer:setUsingDesc(deckData)
	self.usingDeck_ = deckData
end

function BasePlayer:getUsingDeck()
	return self.usingDeck_
end

function BasePlayer:dispose()
	
end

return BasePlayer