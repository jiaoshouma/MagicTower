local UIBase = import('UI/UIBase')

local UIOpponentSelectWindow = class("UIOpponentSelectWindow", UIBase)

-- create a ui instance
function UIOpponentSelectWindow.New(controller)
    local newUI = UIOpponentSelectWindow.new()
    newUI.Controller = controller
    return newUI
end

function UIOpponentSelectWindow:ctor(...)
    
end

function UIOpponentSelectWindow:OnInit(controller)
    Log.Info('UIOpponentSelectWindow OnInit, do controls binding')
end

function UIOpponentSelectWindow:OnOpen()
    UIOpponentSelectWindow.super.OnOpen(self)
    Log.Info('UIOpponentSelectWindow OnOpen, do your logic')
    self.titleLabel_.text = __("SELECT_OPPONENT_TITLE")
    self.confirmBtnLabel_.text = __("OK")

    UIEventListener.Get(self.closeBtn_.gameObject).onClick = function()
		UIModule.Instance:CloseWindow("OpponentSelectWindow")
	end

	UIEventListener.Get(self.confirmBtn_.gameObject).onClick = handler(self,self.onClickConfirm)
    self:layoutOpponents()
end

function UIOpponentSelectWindow:onClickConfirm()
	if not self.selectIndex_ then
		return
	end
	local playerModel = sun.ModelManager.get():loadModel(sun.ModelType.PLAYER)
	playerModel:setTmpOpponentIndex(self.selectIndex_)

	sun.myOperator():setPlayMode(sun.PlayMode.NPC)
	sun.Game.get():enterScene(sun.SceneType.BATTLE)

	UIModule.Instance:CloseAllWindows()
	-- UIModule.Instance:CloseWindow("OpponentSelectWindow")
	UIModule.Instance:OpenWindow("BattleLoadingWindow")
end

function UIOpponentSelectWindow:layoutOpponents()
	self.gridItem_:SetActive(false)
	self.selectBorder_:SetActive(false)
	self.items_ = {}
	for i = 1,15 do
		local item = SunUtils.AddChild(self.grid_.gameObject,self.gridItem_.gameObject)
		item:SetActive(true)
		local transItem = item.transform
		local nameLabel = transItem:ComponentByName("name","UnityEngine.UI.Text")
		local descLabel = transItem:ComponentByName("desc","UnityEngine.UI.Text")
		nameLabel.text = __("ROBOT0"..i)
		descLabel.text = "选我选我选我"
		local bg = transItem:Find("bg")
		self.items_[i] = item
		UIEventListener.Get(bg.gameObject).onClick = function()
			self:selectIndex(i)
		end
	end
end

function UIOpponentSelectWindow:selectIndex(idx)
	self.selectIndex_ = idx
	self.selectBorder_.transform.parent = self.items_[idx].transform
	self.selectBorder_.transform.localPosition = Vector3(0,0,0)
	self.selectBorder_:SetActive(true)
end

function UIOpponentSelectWindow:OnClose()
	UIOpponentSelectWindow.super.OnClose(self)
	
end

return UIOpponentSelectWindow
