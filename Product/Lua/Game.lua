local Game = class("Game")
--允许共存的Scene类型
-- local SceneCoexist = {
	
-- }
local SceneConf = {
	[sun.SceneType.TITLE] = {res = "Scene/SceneTitle/scene_title.unity",class = "Scene/TitleScene"},
	[sun.SceneType.MAIN] = {res = "Scene/SceneMain/scene_main.unity",class = "Scene/MainScene"},
	[sun.SceneType.BATTLE] = {res = "Scene/SceneBattle/scene_battle.unity",class = "Scene/BattleScene"},
}

function Game:ctor(...)
	self.openingScene_ = nil
	self.openingSceneType_ = nil
	self.coexistMap_ = {}
	-- self:genCoexistMap()
end

-- function Game:genCoexistMap()
-- 	for _,relation in ipairs(SceneCoexist) do
-- 		local sceneType1 = relation[1] or 0
-- 		local sceneType2 = relation[2] or 0
-- 		self.coexistMap_[sceneType1] = sceneType2
-- 		self.coexistMap_[sceneType2] = sceneType1
-- 	end
-- end

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

	self:enterScene(sun.SceneType.TITLE)
end

function Game:enterScene(sceneType)
	local conf = SceneConf[sceneType]
	if not conf then
		debug.trace("No such scene!")
		return
	end
	__TRACE(conf,"sss","=================")
	print_r(SceneConf)
	SceneLoader.Load(conf.res,function()
		local sceneClass = import(conf.class)
		self.openingScene_ = sceneClass.new()
		self.openingSceneType_ = sceneType
	end)

end

return Game
