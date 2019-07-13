local KeyboardListener = class("KeyboardListener")

function KeyboardListener.get()
	if not KeyboardListener.instance_ then
		KeyboardListener.instance_ = KeyboardListener.new()
	end
	return KeyboardListener.instance_
end

function KeyboardListener:ctor(...)
	if sun.IsDebug() then
		UpdateBeat.Add(self.onUpdate,self)
	end
end

function KeyboardListener:onUpdate()
	if Input.GetKeyDown(KeyCode.R) then
		if self.linkTest_ then
			self.linkTest_:dispose()
			self.linkTest_ = nil
		end
		package.loaded["LinkTest"] = nil
		self.linkTest_ = import("LinkTest").new()
	end   
	if Input.GetKeyDown(KeyCode.DownArrow) then

	end    
end

function KeyboardListener:dispose()

end

return KeyboardListener