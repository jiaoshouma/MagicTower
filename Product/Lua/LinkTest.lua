local LinkTest = class("LinkTest")
print("===================LinkTestReloaded======================")

function LinkTest:ctor(...)
	UpdateBeat.Add(self.onUpdate,self)
end

function LinkTest:onUpdate()
	if Input.GetKeyDown(KeyCode.Keypad0) then
		print("Keypad0")
		-- local battleScene = sun.Game.get():getOpeningScene()
		-- local cardID = 1
		-- local cardType = 1
		-- local identity = 0
		-- local card = sun.CardManager.get():createCard(cardID,cardType,identity)
		-- battleScene:sendCard(true,card)
		print(sun.tables.misc:getMiscParams("first_key"))
	end  
	if Input.GetKeyDown(KeyCode.Keypad1) then
		print("Keypad1")
	end  
	if Input.GetKeyDown(KeyCode.Keypad2) then
		print("Keypad2")
	end   
	if Input.GetKeyDown(KeyCode.Keypad3) then
		print("Keypad3")
	end  
	if Input.GetKeyDown(KeyCode.Keypad4) then
		print("Keypad4")
	end  
	if Input.GetKeyDown(KeyCode.Keypad5) then
		print("Keypad5")
	end  
	if Input.GetKeyDown(KeyCode.Keypad6) then
		print("Keypad6")
	end  
	if Input.GetKeyDown(KeyCode.Keypad7) then
		print("Keypad7")
	end  
	if Input.GetKeyDown(KeyCode.Keypad8) then
		print("Keypad8")
	end  
	if Input.GetKeyDown(KeyCode.Keypad9) then
		print("Keypad9")
	end  
end

function LinkTest:dispose()
	UpdateBeat.Remove(self.onUpdate,self)
end

return LinkTest