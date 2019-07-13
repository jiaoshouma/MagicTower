local Player = class("Player",import("Model/BasePlayer"))

function Player:ctor(...)
	Player.super.ctor(self,...)

end

function Player:initDecks()
	Player.super.initDecks(self)
		
end

function Player:registerEvents()

end

return Player