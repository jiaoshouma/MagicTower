--此单例对游戏操作作出响应--对应游戏中需要同步的状态变化
local GameOperator = class("GameOperator")
GameOperator.instances_ = {}

function GameOperator:ctor(playerID)
	self.playerID_ = playerID
	self:reset()
end

function GameOperator:reset()

end

function GameOperator.get(playerID)
	if not GameOperator.instances_[playerID] then
		GameOperator.instances_[playerID] = GameOperator.new(playerID)
	end
	return GameOperator.instances_[playerID]
end

function GameOperator:setPlayMode(mode)
	self.playMode_ = mode
end

function GameOperator:getPlayMode()
	return self.playMode_
end

function GameOperator:wrapParams(params)
	params = params or {}
	params.player_id = self.playerID_
	return params
end

function GameOperator:matchPlayer(params)
	if self.playMode_ == sun.PlayMode.NPC then
		params = self:wrapParams(params)
		sun.GameMatcher.get():matchPlayer(params)
	else
		
	end
end

function GameOperator:sendGuess(params)
	if self.playMode_ == sun.PlayMode.NPC then
		params = self:wrapParams(params)
		sun.GameMatcher.get():revieveGuess(params)
	else
		
	end
end

function GameOperator:chooseSide(params)
	if self.playMode_ == sun.PlayMode.NPC then
		params = self:wrapParams(params)
		sun.GameLogic.get():recieveChoose(params)
	else
		
	end
end

function GameOperator:passStage(params)
	if self.playMode_ == sun.PlayMode.NPC then
		params = self:wrapParams(params)
		sun.GameLogic.get():nextStage(params)
	else
		
	end

end

function GameOperator:isBattlePrepared()
	if self.playMode_ == sun.PlayMode.NPC then
		return true
	elseif self.playMode_ == sun.PlayMode.PLAYER then

	end
end

return GameOperator