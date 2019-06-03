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
end

return UITitleWindow
