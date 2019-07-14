--local game logic
local GameMatcher = class("GameMatcher")

function GameMatcher:ctor( ... )
	self.matchPlayers_ = {}
	self.selectionsOfPlayer_ = {}
end

function GameMatcher.get()
	if not GameMatcher.instance_ then
		GameMatcher.instance_ = GameMatcher.new()
	end
	return GameMatcher.instance_
end

function GameMatcher:matchPlayer(params)
	params = params or {}

	local playerModel = sun.getPlayer()
	local tmpOpIdx = playerModel:getTmpOpponentIndex()

	local playerID = params.player_id
	local matchPlayer = {}
	local robotID = 10002
	matchPlayer.player_id = robotID
	matchPlayer.player_name = "Robot0"..tmpOpIdx	
	matchPlayer.player_ai = "AI/BaseAI"

	table.insert(self.matchPlayers_,playerID)
	table.insert(self.matchPlayers_,robotID)

	local eventName = sun.Event.MATCH_PLAYER
	local eventParams = {}
	eventParams.player_info = matchPlayer
	sun.EventDispatcher.outer():dispatchEvent(eventName,eventParams)
	sun.EventDispatcher.inner():dispatchEvent(eventName,eventParams)

end

function GameMatcher:revieveGuess(params)
	params = params or {}

	local playerID = params.player_id
	local selection = params.selection
	self.selectionsOfPlayer_[playerID] = selection
	self:checkSelection()
end

function GameMatcher:checkSelection()
	local id,sel
	local winID 
	local selectInfo = {}
	for playerID,selection in pairs(self.selectionsOfPlayer_) do
		table.insert(selectInfo,{player_id = playerID,selection = selection})
	end
	if #selectInfo ~= 2 then
		return
	end
	local id1 = selectInfo[1].player_id
	local id2 = selectInfo[2].player_id
	local selection1 = selectInfo[1].selection
	local selection2 = selectInfo[2].selection
	if sun.guessAWinB(selection1,selection2) then
		winID = id1
	elseif sun.guessAWinB(selection2,selection1) then
		winID = id2
	else
		winID = 0
		self.selectionsOfPlayer_ = {}
	end
	-- print(id1,id2,winID,"=======================")
	-- test
	-- winID = 0
	-- self.selectionsOfPlayer_ = {}

	self.guessWinID_ = winID
	local eventParams = {}
	local eventName = sun.Event.GUESS_RESULT_PUSH
	eventParams.win_id = winID
	eventParams.selection_info = selectInfo
	sun.EventDispatcher.outer():dispatchEvent(eventName,eventParams)
	sun.EventDispatcher.inner():dispatchEvent(eventName,eventParams)
end

return GameMatcher