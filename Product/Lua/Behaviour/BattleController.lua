local BattleController = class("BattleController")

function BattleController:ctor(...)
	self.turn_ = 0
	self.stage_ = 0
	self.eventProxy_ = sun.EventDispatcher.inner():newProxy(self)
	self:registerEvents()

	-- self:decideTurn()

	-- self:battleStart()
end

function BattleController:registerEvents()
	self.eventProxy_:addEventListener(sun.Event.MATCH_PLAYER,handler(self,self.onMatchSuccess))
	self.eventProxy_:addEventListener(sun.Event.START_BATTLE,handler(self,self.onBattleStart))
	self.eventProxy_:addEventListener(sun.Event.STAGE_CHANGE,handler(self,self.onStageChange))
end

function BattleController:onMatchSuccess(event)
	
end

function BattleController:isTurnDecided()
	return false
end

function BattleController:onBattleStart(event)

end

function BattleController:onStageChange(event)
	event = event or {}
	local params = event.params or {}
	self.turn_  = params.turn 
	self.stage_ = params.stage 
end

function BattleController:getTurnType()
	sun.getTurnType(self.turn_)
end

function BattleController:isMyTurn()

end

function BattleController:createAI()
	
end

function BattleController:dispose()
	self.eventProxy_ = sun.EventDispatcher.inner():disposeProxy(self)
end

return BattleController