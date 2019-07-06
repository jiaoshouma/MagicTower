local BattleScene = class("BattleScene")

function BattleScene:ctor(...)
	self.rootGo_ = GameObject.FindWithTag("BattleRoot")
	self.battleCanvasGo_ = self.rootGo_.transform:Find("battle_canvas").gameObject
	self:initScene()
end

function BattleScene:initScene()
	
end

return BattleScene