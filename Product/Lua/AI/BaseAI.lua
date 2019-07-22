local BaseAI = class("BaseAI")

function BaseAI:ctor(playerInfo,mode)
	playerInfo = playerInfo or {}
	mode = mode or sun.PlayMode.NPC
	self.id_ = playerInfo.player_id
	self.name_ = playerInfo.player_name
	self.eventProxy_ = sun.EventDispatcher.inner():newProxy(self)
	self.gameOperator_ = sun.GameOperator.get(self.id_)
	self.gameOperator_:setPlayMode(mode)
    self:registerEvents()
    sun.print("CreateBaseAI---------------")

    self.info_ = sun.getPlayer():getOtherPlayerInfo(self.id_)
    local deckData = self.info_:getUsingDeck()
    self:getOperator():sendDeckData({deck_info = deckData.cards})
end

function BaseAI:getOperator()
	return self.gameOperator_
end

function BaseAI:registerEvents()
	self.eventProxy_:addEventListener(sun.Event.START_GUESS,handler(self,self.onStartGuess))
	self.eventProxy_:addEventListener(sun.Event.GUESS_RESULT_PUSH,handler(self,self.onGuessResultPush))
	self.eventProxy_:addEventListener(sun.Event.START_BATTLE,handler(self,self.onBattleStart))
	self.eventProxy_:addEventListener(sun.Event.STAGE_CHANGE,handler(self,self.onStageChange))
end

function BaseAI:onStartGuess()
	local co = StartCoroutine(function()
    	yield_return(WaitForSeconds(math.random(1,2)))
    	local selection = math.random(1,3)
    	self:getOperator():sendGuess({selection = selection})
		sun.print(self.id_,"AIGuess--------------",selection)
	end)
end

function BaseAI:onGuessResultPush(event)
	local params = event.params or {}
	local winID = params.win_id
	local co = StartCoroutine(function()
	    yield_return(WaitForSeconds(1))
		if winID == 0 then
			self:onStartGuess()
		elseif winID == self.id_ then
			yield_return(WaitForSeconds(1))
			self:getOperator():chooseSide({side = math.random(1,2)})
		end
	end)
end

function BaseAI:isMyTurn(turnType)
	local myTurnType = sun.getBattleController():getTurnTypeByPlayerID(self.id_)
	return myTurnType == turnType
end

function BaseAI:onBattleStart(event)
	self:getOperator():prepareDraw({})
end

function BaseAI:onStageChange(event)
	local params = event.params or {}
	local turn  = params.turn 
	local stage = params.stage 
	if self:isMyTurn(turn) then
		local co = StartCoroutine(function()
		    yield_return(WaitForSeconds(1))
			self:getOperator():passStage({})
		end)
	end
end

function BaseAI:dispose()
	sun.EventDispatcher.inner():disposeProxy(self)
end

return BaseAI