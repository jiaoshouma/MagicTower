Timer = class("Timer")

function Timer.RefreshNew(cb,interval,loop,scale)
	local timer = Timer.new(cb,interval,loop,scale)
	timer:Start()
	cb()
	return timer
end

function Timer:ctor(cb,interval,loop,scale)
	self.cb = cb
	self.interval = interval
	self.loop = loop
	self.scale = scale
	self:Reset()
end
	
function Timer:Start()
	UpdateBeat.Add(self.onCount,self)
end

function Timer:Stop()
	UpdateBeat.Remove(self.onCount,self)
end

function Timer:Pause()
	self.paused = true
end

function Timer:Resume()
	self.paused = false
end

function Timer:Reset()
	self.paused = false
	self.timeCount = self.interval
	if self.loop > 0 then
		self.loopCount = self.loop
	else
		self.loopCount = math.huge
	end
end

function Timer:onCount()
	if self.paused then
		return
	end
	local reduceTime = self.scale and CS.UnityEngine.Time.deltaTime or CS.UnityEngine.Time.unscaledDeltaTime
	self.timeCount = self.timeCount - reduceTime
	if self.timeCount <= 0 then
		self.loopCount = self.loopCount - 1
		self.timeCount = self.interval
		self.cb()
		if self.loopCount <= 0 then
			self:Stop()
		end
	end
end
