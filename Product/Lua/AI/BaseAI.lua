local BaseAI = class("BaseAI")

function BaseAI:ctor(playerInfo)
	playerInfo = playerInfo or {}
	self.id_ = playerInfo.player_id
	self.name_ = playerInfo.player_name
	self.eventProxy_ = sun.EventDispatcher.inner():newProxy(self)
    self:registerEvents()
    print("CreateBaseAI---------------")
end

function BaseAI:registerEvents()
	self.eventProxy_:addEventListener(sun.Event.START_GUESS,handler(self,self.onStartGuess))
	self.eventProxy_:addEventListener(sun.Event.GUESS_RESULT_PUSH,handler(self,self.onGuessResultPush))
end

function BaseAI:onStartGuess()
	local co = StartCoroutine(function()
    	yield_return(WaitForSeconds(math.random(1,3)))
    	local selectParams = {}
    	selectParams.player_id = self.id_
    	selectParams.selection = math.random(1,3)
		sun.GameMatcher.get():revieveGuess(selectParams)
		print("AIGuess--------------")
	end)
end

function BaseAI:onGuessResultPush(event)
	local params = event.params or {}
	local winID = params.win_id
	local co = StartCoroutine(function()
	    yield_return(WaitForSeconds(1))
		if winID == 0 then
			self:onStartGuess()
		elseif winID == self.id_ then

		end
	end)
end

function BaseAI:dispose()
	sun.EventDispatcher.inner():disposeProxy(self)
end

return BaseAI