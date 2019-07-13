--此单例对游戏操作作出响应--对应游戏中需要同步的状态变化
local GameOperator = class("GameOperator")

function GameOperator:ctor( ... )
	-- body
end

function GameOperator.get()
	if not GameOperator.instance_ then
		GameOperator.instance_ = GameOperator.new()
	end
	return GameOperator.instance_
end



return GameOperator