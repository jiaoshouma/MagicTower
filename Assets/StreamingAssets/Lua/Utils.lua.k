sun = sun or {}

sun.getTime = function()
	return os.time()
end

sun.setSprite = function(sprite,path)
	sun.AssetsLoader.get():loadSprite(path,function(isOK,sp)
		if isOK and not IsNil(sprite) then
			sprite.sprite = sp
		end
	end)
end