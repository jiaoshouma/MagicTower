--local game logic
local GameLogic = class("GameLogic")
local PrepareDrawNum = 5

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
	self.turn_ = sun.TurnType.BLUE
	self.stage_ = 0
	self.turnTypeByPlayerID_ = {}
	self.deckInfoByPlayerID_ = {}
	self.prepareDrawed_ = {}
	self.handInfos_ = {}
	self.drawCount_ = 0
end

function GameLogic:getTurnType()
	return self.turn_
end

function GameLogic:getTurnTypeByPlayerID(playerID)
	return self.turnTypeByPlayerID_[playerID]
end

function GameLogic:pushEvent(eventName,eventParams)
	sun.EventDispatcher.outer():dispatchEvent(eventName,eventParams)
	sun.EventDispatcher.inner():dispatchEvent(eventName,eventParams)
end

function GameLogic:recieveDeckData(params)
	params = params or {}
	local deckInfo = params.deck_info or {}
	local info = clone(deckInfo)
	self:randomizeDeck(info,params.player_id)
	self.deckInfoByPlayerID_[params.player_id] = info
	--直接洗牌
end

function GameLogic:randomizeDeck(deckInfo,playerID)
	for i = #deckInfo,1,-1 do
		if i == 1 then
			break
		end
		local randomIdx = math.random(1,i-1)
		local infoAtRandomIdx = deckInfo[randomIdx]
		deckInfo[randomIdx] = deckInfo[i]
		deckInfo[i] = infoAtRandomIdx
	end
	sun.print("Wash deck info finished!player_id:",playerID)
	print_r(deckInfo)
end

function GameLogic:recieveChoose(params)
	params = params or {}
	local guessWinID,guessLoaseID = sun.GameMatcher.get():getGuessWinID()
	if params.player_id ~= guessWinID then
		return
	end
	local choose = params.side
	self.turnTypeByPlayerID_[guessWinID] = choose
	local otherChoose = (choose == sun.TurnType.BLUE) and sun.TurnType.RED or sun.TurnType.BLUE
	self.turnTypeByPlayerID_[guessLoaseID] = otherChoose

	local eventName = sun.Event.COLOR_CHOOSE_RESULT
	local eventParams = {}
	eventParams.side_info = {
		{player_id = guessWinID,choose = choose},
		{player_id = guessLoaseID,choose = otherChoose},
	}
	self:pushEvent(eventName,eventParams)
end

function GameLogic:revievePrepareDraw(params)
	params = params or {}
	local playerID = params.player_id
	if self.prepareDrawed_[playerID] then
		return
	end
	self.prepareDrawed_[playerID] = true
	local deckInfo = self.deckInfoByPlayerID_[playerID] or {}
	local drawCardInfos = {}
	for i=1,PrepareDrawNum do
		local cardInfo = self:drawCard(playerID)
		if not cardInfo then
			break
		end
		table.insert(drawCardInfos,cardInfo)
	end

	local eventName = sun.Event.PREPARE_DRAW
	local eventParams = {}
	eventParams.cards_info = drawCardInfos
	eventParams.player_id = playerID
	self:pushEvent(eventName,eventParams)

	self:checkStartStage()
end

function GameLogic:drawCard(playerID)
	local deckInfo = self.deckInfoByPlayerID_[playerID] or {}
	if #deckInfo <= 0 then
		return nil
	end
	local cardInfo = table.remove(deckInfo,#deckInfo)
	self.drawCount_ = self.drawCount_ + 1
	cardInfo.identity = self.drawCount_
	self.handInfos_[playerID] = self.handInfos_[playerID] or {}
	table.insert(self.handInfos_[playerID],cardInfo)
	return cardInfo
end

function GameLogic:checkStartStage()
	local count = 0
	for playerID,drawed in pairs(self.prepareDrawed_) do
		if drawed then
			count = count + 1
		end
	end
	if count >= 2 then
		self:nextStage()
	end
end

function GameLogic:tryNextStage(params)
	params = params or {}
	local playerID = params.player_id
	local nowTurn = self:getTurnType()
	local playerBelongTurn = self:getTurnTypeByPlayerID(playerID)
	if playerBelongTurn ~= nowTurn then
		return
	end
	self:nextStage()
end

function GameLogic:nextStage(params)
	self.stage_ = self.stage_ + 1
	if self.stage_ > sun.StageNum then
		self:nextTurn()
		self.stage_ = self.stage_ - sun.StageNum
	end
	sun.print("----------StageChange-----------",self.turn_,self.stage_)
	local eventName = sun.Event.STAGE_CHANGE
	local eventParams = {}
	eventParams.turn = self.turn_
	eventParams.stage = self.stage_
	self:pushEvent(eventName,eventParams)
end

function GameLogic:nextTurn()
	self.turn_ = self.turn_ + 1
	if self.turn_ > sun.TurnNum then
		self.turn_ = self.turn_ - sun.TurnNum
	end
end

return GameLogic