sun = sun or {}

sun.getTime = function()
	return os.time()
end

sun.setImage = function(sprite,path)
	sun.AssetsLoader.get():loadImage(path,function(isOK,sp)
		if isOK and not IsNil(sprite) then
			sprite.sprite = sp
		end
	end)
end

sun.setSprite = function(sprite,atlasName,spriteName)
	sun.AssetsLoader.get():setSprite(sprite,atlasName,spriteName)
end

function sun.getBattleController()
	return sun.getPlayer():getBattleController()
end

function sun.getPlayer()
	return sun.ModelManager.get():loadModel(sun.ModelType.PLAYER)
end

function sun.myOperator()
	return sun.GameOperator.get(sun.Global.playerID)
end


------------------------backend include

--石头剪刀布判定
function sun.guessAWinB(a,b)
	if (a - b) == -1 or (a - (b + 3)) == -1 then
		return true
	end
end
