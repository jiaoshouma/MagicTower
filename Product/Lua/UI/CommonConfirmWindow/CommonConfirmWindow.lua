
local UIBase = import('UI/UIBase')

local UICommonConfirmWindow = class("UICommonConfirmWindow", UIBase)

-- create a ui instance
function UICommonConfirmWindow.New(controller)
    local newUI = UICommonConfirmWindow.new()
    newUI.Controller = controller
    return newUI
end

function UICommonConfirmWindow:ctor(...)
    --init params here.
end

function UICommonConfirmWindow:OnInit(controller)
    Log.Info('UICommonConfirmWindow OnInit, do controls binding')
end

function UICommonConfirmWindow:OnOpen(params)
	UICommonConfirmWindow.super.OnOpen(self,params)
    Log.Info('UICommonConfirmWindow OnOpen, do your logic')
	params = params or {}
	self.params_ = params

	self.desc_.text = params.desc or ""

	self.confirmBtnTxt_.text = params.confirmDesc or __("OK")

	UIEventListener.Get(self.confirmBtn_.gameObject).onClick = function()
		if params.confirmCallback then
			params.confirmCallback()
		end
		self:closeWindow()
	end

	UIEventListener.Get(self.closeBtn_.gameObject).onClick = function()
		self:closeWindow()
	end
end

function UICommonConfirmWindow:OnClose()
	UICommonConfirmWindow.super.OnClose(self)
	
end

function UICommonConfirmWindow:closeWindow()
	local params = self.params_
	if params.closeCallback then
		params.closeCallback()
	end
	UIModule.Instance:CloseWindow("CommonConfirmWindow")
end

return UICommonConfirmWindow
