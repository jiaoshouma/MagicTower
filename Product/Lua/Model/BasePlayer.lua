local BasePlayer = class("BasePlayer",import("Model/BaseModel"))

function BasePlayer:ctor(...)
	BasePlayer.super.ctor(self,...)

	self:initDecks()
end

function BasePlayer:populate(params)
	params = params or {}
	self.id_ = params.player_id
	self.playerName_ = params.player_name

end

function BasePlayer:initDecks()
	self.decks_ = {}
	local deckInfo = {}
	deckInfo.name = "Default"
	deckInfo.cards = {}
	for i = 1,50 do
		local cardInfo = {}
		cardInfo.id = math.random(1,10)
		cardInfo.type = math.random(1,4)
		table.insert(deckInfo.cards,cardInfo)
	end
	self.decks_[1] = deckInfo	

	self:setUsingDeck(self.decks_[1])
end

function BasePlayer:registerEvents()
	BasePlayer.super.registerEvents(self)
end

function BasePlayer:setUsingDeck(deckData)
	self.usingDeck_ = deckData
end

function BasePlayer:getUsingDeck()
	return clone(self.usingDeck_)
end

function BasePlayer:dispose()
	
end

return BasePlayer