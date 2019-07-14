--local game logic
local GameLogic = class("GameLogic")

function GameLogic:ctor( ... )
	self:reset()
end

function GameLogic.get()
	if not GameLogic.instance_ then
		GameLogic.instance_ = GameLogic.new()
	end
	return GameLogic.instance_
end

function GameLogic:reset()
	self.turn_ = 0
	self.stage_ = 0

end

function GameLogic:getTurnType()
	return sun.getTurnType(self.turn_)
end

function GameLogic:getTurnTypeByPlayerID(playerID)
	return sun.TurnType.BLUE
end

function GameLogic:nextStage(params)
	params = params or {}
	local playerID = params.player_id
	local nowTurn = self:getTurnType()
	local playerBelongTurn = self:getTurnTypeByPlayerID(playerID)
	if playerBelongTurn ~= nowTurn then
		return
	end

	self.stage_ = self.stage_ + 1
	if self.stage_ > sun.StageNum then
		self:nextTurn()
		self.stage_ = self.stage_ - sun.StageNum
	end

	local eventName = sun.Event.STAGE_CHANGE
	local eventParams = {}
	eventParams.turn = self.turn_
	eventParams.stage = self.stage_
	sun.EventDispatcher.outer():dispatchEvent(eventName,eventParams)
	sun.EventDispatcher.inner():dispatchEvent(eventName,eventParams)
end

function GameLogic:nextTurn()
	self.turn_ = self.turn_ + 1
	if self.turn_ > sun.TurnNum then
		self.turn_ = self.turn_ - sun.TurnNum
	end
end

return GameLogic