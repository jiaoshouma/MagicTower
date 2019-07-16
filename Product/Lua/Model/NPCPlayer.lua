local NPCPlayer = class("NPCPlayer",import("Model/BasePlayer"))

function NPCPlayer:ctor(...)
	NPCPlayer.super.ctor(self,...)

end

function NPCPlayer:registerEvents()
	NPCPlayer.super.registerEvents(self)
	
end


return NPCPlayer