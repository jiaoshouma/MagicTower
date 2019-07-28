local BattleController = class("BattleController")

function BattleController:ctor(...)
	self.turn_ = 0
	self.stage_ = 0
	self.turnTypeByPlayerID_ = {}
	self.eventProxy_ = sun.EventDispatcher.outer():newProxy(self)
	self:registerEvents()

	-- self:decideTurn()

	-- self:battleStart()
	-- transform.SetAsLastSibling

	-- transform.SetAsFirstSibling

	-- transform.SetSiblingIndex
end

function BattleController:registerEvents()
	self.eventProxy_:addEventListener(sun.Event.MATCH_PLAYER,handler(self,self.onMatchSuccess))
	self.eventProxy_:addEventListener(sun.Event.START_BATTLE,handler(self,self.onBattleStart))
	self.eventProxy_:addEventListener(sun.Event.STAGE_CHANGE,handler(self,self.onStageChange))
	self.eventProxy_:addEventListener(sun.Event.COLOR_CHOOSE_RESULT,handler(self,self.onColorChooseResult))
end

function BattleController:onColorChooseResult(event)
	local params = event.params or {}
	local sideInfo = params.side_info or {}
	for _,info in ipairs(sideInfo) do
		self.turnTypeByPlayerID_[info.player_id] = info.choose
	end
end

function BattleController:onMatchSuccess(event)
	local params = event.params or {}
	self.opPlayerID_ = params.player_id
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
	return self.turn_
end

function BattleController:getTurnTypeByPlayerID(playerID)
	return self.turnTypeByPlayerID_[playerID]
end

function BattleController:getMyTurnType()
	return self:getTurnTypeByPlayerID(sun.Global.playerID)
end

function BattleController:isMyTurn()
	-- print(self:getTurnType(),self:getMyTurnType(),self.turn_,self.stage_)
	return self:getTurnType() == self:getMyTurnType()
end

function BattleController:dispose()
	self.eventProxy_ = sun.EventDispatcher.inner():disposeProxy(self)
end

return BattleController