local Game = class("Game")

function Game:ctor(...)

end

function Game.get()
	if not Game.instance_ then
		local instance = Game.new()
		Game.instance_ = instance
	end
	return Game.instance_
end

function Game:startGame()
	--determin open which window / scene
	UIModule.Instance:OpenWindow("TitleWindow")
	SceneLoader.Load("Scene/SceneTitle/scene_title.unity")

end

function Game:OnBeat()

end

return Game
