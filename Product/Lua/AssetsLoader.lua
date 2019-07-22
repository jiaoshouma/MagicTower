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

--single image
--return the loader 
--use sun.setImage recommended
function AssetsLoader:loadImage(path,callback)
	return CS.KEngine.SpriteLoader.Load(path,callback)
end

--atlas cache
--use sun.setSprite recommended
function AssetsLoader:setSprite(img,atlasName,iconName)
	local uiAtlas = img.transform:GetComponent("UIAtlas")
	local atlasPath = string.format("UIAtlas/%s/%s.prefab",atlasName,string.lower(atlasName))
	local atlasPrefab = self:loadAsset(atlasPath)
	uiAtlas.atlas = atlasPrefab
	uiAtlas.spriteName = iconName
end

return AssetsLoader
