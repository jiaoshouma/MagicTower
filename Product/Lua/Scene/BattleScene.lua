local BattleScene = class("BattleScene",import("Scene/BaseScene"))

function BattleScene:ctor(...)
	BattleScene.super.ctor(self,...)
	self.rootGo_ = GameObject.FindWithTag("BattleRoot")
	self.battleCanvasGo_ = self.rootGo_.transform:Find("battle_canvas").gameObject
	self.battleRootGo_ = self.rootGo_.transform:Find("battle_root").gameObject
	self:initScene()
end

function BattleScene:registerEvents()
	BattleScene.super.registerEvents(self)
	-- self.eventProxy_:addEventListener(sun.Event.TEST_EVENT,handler(self,self.onTest))
end

-- function BattleScene:onTest(event)

-- end

function BattleScene:initScene()
	local battlefield = sun.AssetsLoader.get():loadAsset("Prefabs/Battle/battlefield.prefab")
	self.battleFieldGo_ = SunUtils.AddChild(self.battleRootGo_,battlefield)
	self:initBattleFieldInfo()

	self:initBattleController()
	-- local card = sun.CardManager.get():createCard(7,sun.CardType.ROLE)
	-- SunUtils.AddChild(self.battleCanvasGo_,card.go_)
end

function BattleScene:initBattleFieldInfo()
	local transBattleField = self.battleFieldGo_.transform
	local transLeftTop = transBattleField:Find("left_top")
	local transStageInfo = transLeftTop:Find("stage_info")
	self.battleStageInfo_ = import("Scene/BattleStageInfo").new(self,transStageInfo)


	local transRightBottom = transBattleField:Find("right_bottom")
	local stageBtnImg = transRightBottom:ComponentByName("stage_btn","UnityEngine.UI.Image")
	UIEventListener.Get(stageBtnImg.gameObject).onClick = handler(self,self.onClickStateBtn)
end

function BattleScene:onClickStateBtn()
	if not self.battleController_ then
		return
	end
	self.battleController_:nextStage()
end

function BattleScene:initBattleController()
	self.battleController_ = import("Behaviour/BattleController").new()

end

function BattleScene:getBattleController()
	return self.battleController_
end

function BattleScene:dispose()
	BattleScene.super.dispose()
	self.battleStageInfo_:dispose()
	self.battleController_:dispose()
end

return BattleScene