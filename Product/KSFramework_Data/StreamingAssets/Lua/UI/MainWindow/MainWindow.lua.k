local UIBase = import('UI/UIBase')

local UIMainWindow = class("UIMainWindow", UIBase)

-- create a ui instance
function UIMainWindow.New(controller)
    local newUI = new(UIMainWindow)
    newUI.Controller = controller
    return newUI
end

function UIMainWindow:ctor(...)
    --init params here.
end

function UIMainWindow:OnInit(controller)
    Log.Info('UIMainWindow OnInit, do controls binding')
end

function UIMainWindow:OnOpen()
    Log.Info('UIMainWindow OnOpen, do your logic')
	local MenuConf = {
		{desc = __("START_GAME"),click = handler(self,self.onClickStartGame)},
		{desc = __("EDIT_DECK"),click = handler(self,self.onClickEditDeck)},
		{desc = __("SHOP"),click = handler(self,self.onClickShop)},
		{desc = __("ABOUT"),click = handler(self,self.onClickAbout)},
		{desc = __("QUIT"),click = handler(self,self.onClickQuit)},
	}

	self.menuItem_:SetActive(false)
	for _,conf in ipairs(MenuConf) do
		local menuItem = SunUtils.AddChild(self.menuGrid_.gameObject,self.menuItem_.gameObject)
		menuItem:SetActive(true)

		local transItem = menuItem.transform
		local desc = transItem:ComponentByName("desc","UnityEngine.UI.Text")
		local bg = transItem:Find("bg")
		desc.text = conf.desc
		UIEventListener.Get(bg.gameObject).onClick = conf.click
	end

end

function UIMainWindow:onClickStartGame()
	UIModule.Instance:CloseAllWindows()
	
	sun.Game.get():enterScene(sun.SceneType.BATTLE)
end

function UIMainWindow:onClickEditDeck()

end

function UIMainWindow:onClickShop()

end

function UIMainWindow:onClickAbout()

end

function UIMainWindow:onClickQuit()
	local params = {}
	params.desc = __("GAME_QUIT_CONFIRM")
	params.confirmCallback = function()
		print("-------------QuitGame------------")
		UnityEngine.Application.Quit();
	end
	UIModule.Instance:OpenWindow("CommonConfirmWindow",params)
end

return UIMainWindow
