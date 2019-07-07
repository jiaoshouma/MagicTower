local AssetsLoader = class("AssetsLoader")

function AssetsLoader:ctor(...)

end

function AssetsLoader.get()
	if not AssetsLoader.instance_ then
		local instance = AssetsLoader.new()
		AssetsLoader.instance_ = instance
	end
	return AssetsLoader.instance_
end

function AssetsLoader:loadAsset(path)
	return ResLoader.Load(path).Asset
end

function AssetsLoader:loadAssetAsync(path,callback)
	ResLoader.Load(path,function()
		callback(isOK,res)
	end,CS.KEngine.LoaderMode.Async)
end

function AssetsLoader:loadSprite(path)
	return CS.KEngine.SpriteLoader.Load(path).Asset
end

return AssetsLoader
