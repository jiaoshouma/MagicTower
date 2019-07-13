local Player = import("Model/Player")

local ModelMap = {
	[sun.ModelType.PLAYER] = Player,
}

local ModelManager = class("ModelManager")

function ModelManager.get()
	if not ModelManager.instance_ then
		ModelManager.instance_ = ModelManager.new()
	end
	return ModelManager.instance_
end

function ModelManager:ctor(...)
	self.models_ = {}
end

function ModelManager:loadModel(modelType)
	if not self.models_[modelType] then
		local class = ModelMap[modelType]
		if not class then
			print("No such model!")
			return
		end
		self.models_[modelType] = class.new()
	end
	return self.models_[modelType]
end

return ModelManager