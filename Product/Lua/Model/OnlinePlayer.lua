local OnlinePlayer = class("OnlinePlayer",import("Model/BasePlayer"))

function OnlinePlayer:ctor(...)
	OnlinePlayer.super.ctor(self,...)

end

function OnlinePlayer:registerEvents()
	OnlinePlayer.super.registerEvents(self)
	
end


return OnlinePlayer