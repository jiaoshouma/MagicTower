local UIBase = import('UI/UIBase')

local UIBattleLoadingWindow = class("UIBattleLoadingWindow", UIBase)

-- create a ui instance
function UIBattleLoadingWindow.New(controller)
    local newUI = UIBattleLoadingWindow.new()
    newUI.Controller = controller
    return newUI
end

function UIBattleLoadingWindow:registerEvents()
	UIBattleLoadingWindow.super.registerEvents(self)
	self.eventProxy_:addEventListener(sun.Event.MATCH_PLAYER,handler(self,self.onMatchSuccess))
	self.eventProxy_:addEventListener(sun.Event.GUESS_RESULT_PUSH,handler(self,self.onGuessResultPush))
	self.eventProxy_:addEventListener(sun.Event.COLOR_CHOOSE_RESULT,handler(self,self.onColorChooseResult))
end

function UIBattleLoadingWindow:ctor(...)
	UIBattleLoadingWindow.super.ctor(self,...)
    --init params here.
end

function UIBattleLoadingWindow:onMatchSuccess(event)
	event = event or {}
	params = event.params or {}
	self:showLoading(false)

	self.guessPart_:SetActive(true)
	self.choosePart_:SetActive(false)
	self:initGuessPart()
end

function UIBattleLoadingWindow:initGuessPart()
	sun.EventDispatcher.inner():dispatchEvent(sun.Event.START_GUESS,{})

	local choosePart = self.choose_
	local opChoosePart = self.chooseOp_
	self.chooseGird_ = self.choose_.transform:GetComponent("UnityEngine.UI.GridLayoutGroup")
	self.chooseOpGird_ = self.chooseOp_.transform:GetComponent("UnityEngine.UI.GridLayoutGroup")
	self.selfSelections_ = {}
	self.opSelections_ = {}
	for i=1,3 do
		local opSelection = opChoosePart:NodeByName("guess_"..i)
		local guessSelection = choosePart:NodeByName("guess_"..i)
		UIEventListener.Get(guessSelection).onClick = function()
			self:selectGuess(i,true)
			sun.myOperator():sendGuess({selection = i})
			self:showLoading(true,__("WAITING_OP_SELECT"))
		end
		self.selfSelections_[i] = guessSelection
		self.opSelections_[i] = opSelection
	end
end

function UIBattleLoadingWindow:waitBattleScene()
	local co = StartCoroutine(function()
		while true do
			self.loadingCount_ = (self.loadingCount_ or 0) + 1
			local count = self.loadingCount_ % 5 + 1
			-- local countTable = {}
			-- for i=1,count do
			-- 	table.insert(countTable,".")
			-- end
			local loadingStr = self.loadingInfo_ or __("LOADING")
			self.loadingDesc_.text = loadingStr..string.rep(".",count)
	    	yield_return(WaitForSeconds(0.3))
			local scene = sun.Game.get():getOpeningScene()
			local battleController = sun.getBattleController()
			if self.chooseOver_ and scene:getType() == sun.SceneType.BATTLE then
				UIModule.Instance:CloseWindow("BattleLoadingWindow")
				local eventName = sun.Event.START_BATTLE
				sun.EventDispatcher.outer():dispatchEvent(eventName,{})
				sun.EventDispatcher.inner():dispatchEvent(eventName,{})
				break
			end

		end
	end)
end

function UIBattleLoadingWindow:OnInit(controller)
    Log.Info('UIBattleLoadingWindow OnInit, do controls binding')
end

function UIBattleLoadingWindow:OnOpen()
	UIBattleLoadingWindow.super.OnOpen(self)
    Log.Info('UIBattleLoadingWindow OnOpen, do your logic')

    self.guessPart_:SetActive(false)
    self.choosePart_:SetActive(false)

   	self:showLoading(true,__("WAITING"))
   	sun.myOperator():matchPlayer({player_id = sun.Global.playerID}) 

	--匹配对手和等待场景加载
	self:waitBattleScene()
end

function UIBattleLoadingWindow:showLoading(bool,info)
	self.loadingInfo_ = info
	if bool then
		self.loadingDesc_.text = ""
	end
	self.loadingDesc_:SetActive(bool)
end

function UIBattleLoadingWindow:showAllGuess(isSelf,bool)
	local grid = isSelf and self.chooseGird_ or self.chooseOpGird_
	grid.enabled = true
	local selectionTable = isSelf and self.selfSelections_ or self.opSelections_
	for i,selectionGo in ipairs(selectionTable) do
		selectionGo:SetActive(bool)
	end

end

function UIBattleLoadingWindow:selectGuess(idx,isSelf)
	local grid = isSelf and self.chooseGird_ or self.chooseOpGird_
	grid.enabled = false
	local selectionTable = isSelf and self.selfSelections_ or self.opSelections_
	for i,selectionGo in ipairs(selectionTable) do
		if i == idx then
			selectionGo:SetActive(true)
		else
			selectionGo:SetActive(false)
		end
	end
end

function UIBattleLoadingWindow:moveGuess(idx,isSelf)
	local selectionTable = isSelf and self.selfSelections_ or self.opSelections_
	local selectionGo = selectionTable[idx]
	if selectionGo then
		local selectionTarget = isSelf and self.chooseTarget_ or self.chooseTargetOp_
		selectionGo.transform:DOMove(selectionTarget.transform.position,0.5)
	end
end

function UIBattleLoadingWindow:onGuessResultPush(event)
	local params = event.params or {}
	local winID = params.win_id
	local selectionInfo = params.selection_info or {}
	for _,info in ipairs(selectionInfo) do
		local selection = info.selection
		if info.player_id == sun.Global.playerID then
			self:moveGuess(selection,true)
		else
			self:selectGuess(selection,false)
			self:moveGuess(selection,false)
		end
	end
	self:showLoading(false)
	local co = StartCoroutine(function()
	    yield_return(WaitForSeconds(1))
		if winID == 0 then
			self:showAllGuess(true,true)
			self:showAllGuess(false,true)
		else
			self.choosePart_:SetActive(true)
			self.guessPart_:SetActive(false)
			if winID == sun.Global.playerID then
				self:showLoading(true,"PLEASE_CHOOSE_ORDER")
				self:initChoosePart(true)
			else
				self:showLoading(true,"WAITING_OP_CHOOSE_ORDER")
				self:initChoosePart(false)
			end
		end
	end)
	self:showLoading(false)
end

function UIBattleLoadingWindow:initChoosePart(isWin)
	local trans = self.choosePart_.transform
	local firstBtn = trans:Find("first")
	local lastBtn = trans:Find("last")
	self.chooseBtns_ = {firstBtn,lastBtn}
	local firstBtnLabel = firstBtn:ComponentByName("text","UnityEngine.UI.Text")
	local lastBtnLabel = lastBtn:ComponentByName("text","UnityEngine.UI.Text")
	firstBtnLabel.text = __("FIRST_ATTACK_BLUE")
	lastBtnLabel.text = __("LAST_ATTACK_RED")
	if isWin then
		UIEventListener.Get(firstBtn.gameObject).onClick = function()
			self:chooseSide(1)
		end
		UIEventListener.Get(lastBtn.gameObject).onClick = function()
			self:chooseSide(2)
		end
	end
end

function UIBattleLoadingWindow:chooseSide(side)
	sun.myOperator():chooseSide({side = side})
	self:showLoading(true,__("WAITING"))
end

function UIBattleLoadingWindow:onColorChooseResult(event)
	local params = event.params or {}
	self:showLoading(true,__("LOADING"))

	local sideInfo = params.side_info or {}
	for _,info in ipairs(sideInfo) do
		local playerID = info.player_id
		local choose = info.choose
		local btn = self.chooseBtns_[choose]
		if playerID == sun.Global.playerID then
			btn.transform:DOLocalMove(Vector3(0,-200,0),0.5)
		else
			btn.transform:DOLocalMove(Vector3(0,200,0),0.5)
		end
	end
	local co = StartCoroutine(function()
	    yield_return(WaitForSeconds(1))
		self.chooseOver_ = true
	end)
end

function UIBattleLoadingWindow:OnClose()
	UIBattleLoadingWindow.super.OnClose(self)

end

return UIBattleLoadingWindow
