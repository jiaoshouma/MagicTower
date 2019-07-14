--此单例对游戏操作作出响应--对应游戏中需要同步的状态变化
local GameOperator = class("GameOperator")

function GameOperator:ctor( ... )
	-- body
	self:reset()
end

function GameOperator:reset()
	self.turn_ = 0
	self.stage_ = 0
end

function GameOperator.get()
	if not GameOperator.instance_ then
		GameOperator.instance_ = GameOperator.new()
	end
	return GameOperator.instance_
end

function GameOperator:setPlayMode(mode)
	self.playMode_ = mode
end

function GameOperator:getPlayMode()
	return self.playMode_
end

function GameOperator:matchPlayer(params)
	if self.playMode_ == sun.PlayMode.NPC then
		sun.GameMatcher.get():matchPlayer(params)
	else
		
	end
end

function GameOperator:sendGuess(params)
	if self.playMode_ == sun.PlayMode.NPC then
		params = params or {}
		params.player_id = sun.Global.playerID
		sun.GameMatcher.get():revieveGuess(params)
	else
		
	end
end

function GameOperator:passStage()
	if self.playMode_ == sun.PlayMode.NPC then
		local params = {player_id = sun.Global.playerID}
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