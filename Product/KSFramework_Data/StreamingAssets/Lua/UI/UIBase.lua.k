local UIBase = class("UIBase")

function UIBase:ctor(...)

end

function UIBase:getWindow()
    return self.Controller:GetWindow()
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

return UIBase
