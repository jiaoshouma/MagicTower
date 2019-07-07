local BattleScene = class("BattleScene")

function BattleScene:ctor(...)
	self.rootGo_ = GameObject.FindWithTag("BattleRoot")
	self.battleCanvasGo_ = self.rootGo_.transform:Find("battle_canvas").gameObject
	self.eventProxy_ = sun.EventDispatcher.inner():newProxy("BattleScene")
	self:registerEvents()
	self:initScene()
end

function BattleScene:registerEvents()
	-- self.eventProxy_:addEventListener(sun.Event.TEST_EVENT,handler(self,self.onTest))
end

-- function BattleScene:onTest(event)

-- end

function BattleScene:initScene()
	local card = sun.CardManager.get():createCard(7,sun.CardType.ROLE)
	SunUtils.AddChild(self.battleCanvasGo_,card.go_)
	UIModule.Instance:OpenWindow("LoadUISprite")
end

return BattleScene