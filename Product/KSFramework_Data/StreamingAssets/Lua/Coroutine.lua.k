local util = require 'xlua_util'
 
local gameobject = CS.UnityEngine.GameObject('CoroutineRunner')
CS.UnityEngine.Object.DontDestroyOnLoad(gameobject)
local cs_coroutine_runner = gameobject:AddComponent(typeof(CS.CoroutineRunner))

local function async_yield_return(to_yield, cb)
    cs_coroutine_runner:YieldAndCallback(to_yield, cb)
end
 
yield_return = util.async_to_sync(async_yield_return)

function StartCoroutine(func)
	local co = coroutine.create(func)
	coroutine.resume(co)
	return co
end

function WaitForSeconds(sec)
	return CS.UnityEngine.WaitForSeconds(sec)
end

--eg:
-- local co = StartCoroutine(function()
-- 	print('===================coroutine start!')
--     local s = os.time()
--     print("==========================",s)
--     yield_return(WaitForSeconds(3))
--     print('========================wait interval:', os.time() - s)
-- end)
