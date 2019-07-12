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
	return ResLoader.Load(path,nil,CS.KEngine.LoaderMode.Sync).Asset
end

function AssetsLoader:loadAssetAsync(path,callback)
	ResLoader.Load(path,function()
		callback(isOK,res)
	end,CS.KEngine.LoaderMode.Async)
end

function AssetsLoader:loadSprite(path,callback)
	return CS.KEngine.SpriteLoader.Load(path,callback)
end

return AssetsLoader
