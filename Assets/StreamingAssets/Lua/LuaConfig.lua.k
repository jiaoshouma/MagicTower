sun = sun or {}

sun.RunPlatform = UnityEngine.Application.platform

sun.IsDebug = function()
	if not sun.DebugResult then
		print(sun.RunPlatform,"===================")
		if sun.RunPlatform == UnityEngine.RuntimePlatform.WindowsEditor then
			-- return true
			sun.DebugResult = 1
		else
			sun.DebugResult = 0
		end
	end
	return sun.DebugResult == 1
end

sun.print = function(...)
	if sun.IsDebug() then
		print(...)
	end
end