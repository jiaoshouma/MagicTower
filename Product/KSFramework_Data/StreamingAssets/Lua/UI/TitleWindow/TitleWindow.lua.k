local UIBase = import('UI/UIBase')

local UITitleWindow = class("UITitleWindow", UIBase)

-- create a ui instance
function UITitleWindow.New(controller)
    local newUI = new(UITitleWindow)
    newUI.Controller = controller
    return newUI
end

function UITitleWindow:ctor(...)
    --init params here.
    
end

function UITitleWindow:OnInit(controller)
    Log.Info('UITitleWindow OnInit, do controls binding')

end

function UITitleWindow:OnOpen()
    Log.Info('UITitleWindow OnOpen, do your logic')
    -- local titleImg = self:GetUIImage("title_img")
   	local ring1 = self:GetUIImage("ring_1")
   	local ring2 = self:GetUIImage("ring_2")
   	local tweenRing1 = ring1.transform:DOBlendableLocalRotateBy(Vector3(0, 0, 180), 10)
   	local tweenRing2 = ring2.transform:DOBlendableLocalRotateBy(Vector3(0, 0, -180), 20)
   	tweenRing1:SetLoops(-1)
   	tweenRing2:SetLoops(-1)

   	local titleTxt = self:GetUIText("start_label")
   	titleTxt.text = I18N.Str("START_GAME")
   	UIEventListener.Get(titleTxt.gameObject).onClick = handler(self,self.onClickStartGame)
end

function UITitleWindow:onClickStartGame()
	UIModule.Instance:DestroyWindow("TitleWindow")
  UIModule.Instance:OpenWindow("MainWindow")

end

return UITitleWindow
