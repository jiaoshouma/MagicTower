--暂不引入MainScene，直接把编辑做在TitleScene上
local MainScene = class("MainScene",import("Scene/BaseScene"))

function MainScene:ctor(...)
	MainScene.super.ctor(self,...)
		
end

return MainScene
