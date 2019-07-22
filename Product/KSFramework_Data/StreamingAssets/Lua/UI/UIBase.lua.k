local UIBase = class("UIBase")

function UIBase:ctor(...)
end

function UIBase:OnOpen(params)
    params = params or {}
    self.eventProxy_ = sun.EventDispatcher.inner():newProxy(self)
    self:registerEvents()
    if params.callback then
        params.callback()
    end
end

function UIBase:registerEvents()

end

function UIBase:getWindow()
    return self.Controller:GetWindow()
end

function UIBase:getUICanvas()
    local window = self:getWindow()
    return window:GetComponent("UnityEngine.UI.Canvas")
end

function UIBase:GetControl(typeName, uri,trans)
	uri = uri or ""
	if trans then
		return self.Controller:GetControl(typeName, uri ,trans)
	else
    	return self.Controller:GetControl(typeName, uri)
	end
end

function UIBase:GetUIText(uri)
    local text = self:GetControl("UnityEngine.UI.Text", uri)
    return text
end

function UIBase:GetUIButton(uri)
    local btn = self:GetControl("UnityEngine.UI.Button", uri)
    return btn
end

function UIBase:GetUIImage(uri)
    local img = self:GetControl("UnityEngine.UI.Image", uri)
    return img
end

function UIBase:OnClose()
    sun.EventDispatcher.inner():disposeProxy(self)
end

return UIBase
