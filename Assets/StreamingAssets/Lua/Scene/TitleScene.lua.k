local TitleScene = class("TitleScene",import("Scene/BaseScene"))

function TitleScene:ctor(...)
	TitleScene.super.ctor(self,...)
	local bgContainer = GameObject.FindWithTag("TitleRoot")
	
end

return TitleScene
