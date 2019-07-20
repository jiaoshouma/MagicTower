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
	self.eventProxy_:addEventListener(sun.Event.START_BATTLE,handler(self,self.onBattleStart))
	self.eventProxy_:addEventListener(sun.Event.PREPARE_DRAW,handler(self,self.onPrepareDraw))
end

function BattleScene:onPrepareDraw(event)
	local params = event.params or {}
	local playerID = params.player_id
	local isSelf = playerID == sun.Global.playerID

	local cardInfos = params.cards_info or {}
	local co = StartCoroutine(function()
		for _,info in ipairs(cardInfos) do
	    	yield_return(WaitForSeconds(0.3))
			local cardID = info.id
			local cardType = info.type
			local identity = info.identity
			local card = sun.CardManager.get():createCard(cardID,cardType,identity)
			self:sendCard(isSelf,card)
		end
	end)
end

function BattleScene:onBattleStart(event)
	sun.myOperator():prepareDraw({})
end

function BattleScene:initScene()
	local battlefield = sun.AssetsLoader.get():loadAsset("Prefabs/Battle/battlefield.prefab")
	self.battleFieldGo_ = SunUtils.AddChild(self.battleRootGo_,battlefield)
	self:initBattleFieldInfo()

	self:initBattleController()
end

function BattleScene:initBattleFieldInfo()
	local transBattleField = self.battleFieldGo_.transform
	-- local transLeftTop = transBattleField:Find("left_top")
	local transStageInfo = transBattleField:Find("stage_info")
	self.battleStageInfo_ = import("Scene/BattleStageInfo").new(self,transStageInfo)

	self.handSelf_ = transBattleField:ComponentByName("hand_self","UnityEngine.UI.HorizontalLayoutGroup")
	self.handOp_ = transBattleField:ComponentByName("hand_op","UnityEngine.UI.HorizontalLayoutGroup")

	self.deckSelf_ = transBattleField:Find("deck_self")
	self.deckOp_ = transBattleField:Find("deck_op")

	-- local transRightBottom = transBattleField:Find("right_bottom")
	local stageBtnImg = transBattleField:ComponentByName("stage_btn","UnityEngine.UI.Image")
	UIEventListener.Get(stageBtnImg.gameObject).onClick = handler(self,self.onClickStageBtn)
end

function BattleScene:onClickStageBtn()
	if not self.battleController_:isMyTurn() then

		return
	end
	sun.myOperator():passStage()
end

function BattleScene:initBattleController()
	self.battleController_ = sun.getPlayer():getBattleController()
end

function BattleScene:getBattleController()
	return sun.getPlayer():getBattleController()
end

function BattleScene:dispose()
	BattleScene.super.dispose()
	sun.getPlayer():disposeBattleController()
	self.battleStageInfo_:dispose()
end

function BattleScene:getFingerRes()
	if not self.fingerRes_ then
		self.fingerRes_ = sun.AssetsLoader.get():loadAsset("Prefabs/Cards/finger.prefab")
	end
	return self.fingerRes_
end

function BattleScene:sendCard(isSelf,card)
	card:switchDirection(sun.CardDirection.BACK,0)
	if isSelf then
		card:switchDirection(sun.CardDirection.FRONT,0.9)
	else
		card:switchDirection(sun.CardDirection.BACK,0)
	end
	local fromDeck = isSelf and self.deckSelf_ or self.deckOp_
	card:setPosition(fromDeck.transform.position)

	local targetHand = isSelf and self.handSelf_ or self.handOp_
	local fingerRes = self:getFingerRes()
	local finger = SunUtils.AddChild(targetHand.gameObject,fingerRes)
	local recTransform = finger:GetComponent("RectTransform")
	recTransform.sizeDelta  = card:getRectSize()
	recTransform.pivot = card:getPivot()
	card:setFinger(finger)
	card:localMove(Vector3(0,0,0),1)
end

return BattleScene