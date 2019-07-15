local Player = class("Player",import("Model/BasePlayer"))

function Player:ctor(...)
	Player.super.ctor(self,...)

end

function Player:initDecks()
	Player.super.initDecks(self)
		
end

function Player:registerEvents()
	self.eventProxy_:addEventListener(sun.Event.MATCH_PLAYER,handler(self,self.onMatchSuccess))
end

function Player:setTmpOpponentIndex(opIdx)
	self.tmpOpIdx_ = opIdx
	self:disposeBattleController()
	self.battleController_ = import("Behaviour/BattleController").new()
end

function Player:getTmpOpponentIndex()
	return self.tmpOpIdx_ or 1
end

function Player:onMatchSuccess(event)
	event = event or {}
	local params = event.params or {}
	local playerInfo = params.player_info
	self.opPlayerID_ = playerInfo.player_id
	self.opName_ = playerInfo.player_name
	if playerInfo.player_ai then
		local aiName = playerInfo.player_ai
		self.opAI_ = import(aiName).new(playerInfo)
	end
end

function Player:getBattleController()
	return self.battleController_
end

function Player:onLeaveBattle()
	self:disposeBattleController()
	self.opAI_:dispose()
end

function Player:disposeBattleController()
	if self.battleController_ then
		self.battleController_:dispose()
		self.battleController_ = nil
	end
end

return Player