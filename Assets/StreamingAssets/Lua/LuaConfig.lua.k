sun = sun or {}

sun.RunPlatform = UnityEngine.Application.platform

sun.IsDebug = function()
	print(sun.RunPlatform,"===================")
	if sun.RunPlatform == UnityEngine.RuntimePlatform.WindowsEditor then
		return true
	end
end