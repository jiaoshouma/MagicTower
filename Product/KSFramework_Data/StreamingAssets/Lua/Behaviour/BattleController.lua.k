local BattleController = class("BattleController")

function BattleController:ctor(...)
	self.turn_ = 0
	self.stage_ = 0

	self:decideTurn()

	-- self:battleStart()
end

function BattleController:decideTurn()
	self.turn_ = sun.TurnType.PLAYER

	self:prepareDrawPhase()
end

function BattleController:prepareDrawPhase()
	self:battleStart()
end

function BattleController:battleStart()
	self:nextStage()
end

function BattleController:nextStage(params)
	params = params or {}
	self.stage_ = self.stage_ + 1
	if self.stage_ > sun.StageNum then
		self:nextTurn()
		self.stage_ = self.stage_ - sun.StageNum
	end

	if not params.ignoreEvent then
		local eventName = sun.Event.STAGE_CHANGE
		local params = {}
		params.turn = self.turn_
		params.stage = self.stage_
		sun.EventDispatcher.inner():dispatchEvent(eventName,params)
		sun.EventDispatcher.outer():dispatchEvent(eventName,params)
	end
end

function BattleController:nextTurn()
	self.turn_ = self.turn_ + 1
	if self.turn_ > sun.TurnNum then
		self.turn_ = self.turn_ - sun.TurnNum
	end
end

function BattleController:dispose()

end

return BattleController