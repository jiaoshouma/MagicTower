local BaseCard = class("BaseCard")

function BaseCard:ctor(cardNumber,cardType,id)
	params = params or {}
	self.cardID_ = cardNumber
	self.cardType_ = cardType
	self.id_ = id
	self.backImgs_ = {}
	self:instantiate()
	self:initInfo()
	self:initCommonComponents()
	self:initComponents()

	--低性能模式使用SIMPLE作卡面
	--卡背从程序切改为靠UI正反面区分
	self:switchShow(sun.CardShowForm.SPECIFIC)
	-- self:switchDirection(sun.CardDirection.FRONT,0)
end

function BaseCard:setFinger(fingerGo)
	self.finger_ = fingerGo
	self.go_.transform.parent = fingerGo.transform
end

function BaseCard:getSetting()
	if not self.setting_ then
		local typeSettings = sun.CardManager.get():getCardsSetting(self.cardType_)
		self.setting_ = typeSettings.Get(self.cardID_)
	end
	return self.setting_
end

function BaseCard:getName()
	local name = string.format("%s_%s_%s",self.cardID_,self.cardType_,self.id_)
	return name
end

function BaseCard:registerEvent(eventName,callback)
	if not self.eventProxy_ then
		local name = string.format("%s_%s_%s",self.cardID_,self.cardType_,self.id_)
		self.eventProxy_ = sun.EventDispatcher.inner():newProxy(self:getName())
	end
	self.eventProxy_:addEventListener(eventName,callback)
end


function BaseCard:getCarType()
	return self.cardType_
end

function BaseCard:getID()
	return self.cardID_
end


function BaseCard:instantiate()
	local prefabPath = self:getCardPrefabPath()
	local prefab = sun.CardManager.get():loadCard(self.cardType_,prefabPath)
	self.go_ = CS.UnityEngine.GameObject.Instantiate(prefab)
end

function BaseCard:initInfo()
	if not self.info_ then
		local class = sun.CardManager.get():getCardModelClass(self.cardID_,self.cardType_)
		self.info_ = class.new(self.cardID_,self.cardType_,self.id_)
	end
end

function BaseCard:initCommonComponents()
	local transGo = self.go_.transform
	self.simple_ = transGo:Find("simple")
	self.specific_ = transGo:Find("specific")
	self.cardContents_ = {
		[sun.CardShowForm.SIMPLE] = self.simple_,
		[sun.CardShowForm.SPECIFIC] = self.specific_,
	}
	self.cardInitFuncs_ = {
		[sun.CardShowForm.SIMPLE] = handler(self,self.initSimple),
		[sun.CardShowForm.SPECIFIC] = handler(self,self.initSpecific),
	}
	self.cardInits_ = {}

	self.rect_ = transGo:GetComponent("RectTransform")
end

function BaseCard:initSimple()
	local form = sun.CardShowForm.SIMPLE
	local content = self.cardContents_[form]
	local simpleBaseImg = content:ComponentByName("base","UnityEngine.UI.Image")

	local backImg = content:ComponentByName("back","UnityEngine.UI.Image")
	self.backImgs_[form] = backImg

	sun.setSprite(simpleBaseImg,self:getCardBaseImg(true))

end

function BaseCard:initSpecific()
	local form = sun.CardShowForm.SPECIFIC
	local content = self.cardContents_[form]
	local base = content:Find("base")
	local specificBaseImg = content:ComponentByName("base","UnityEngine.UI.Image")
	sun.setSprite(specificBaseImg,self:getCardBaseImg(false))

	local backImg = content:ComponentByName("back","UnityEngine.UI.Image")
	self.backImgs_[form] = backImg

	self.mainTex_ = content:ComponentByName("main_tex","UnityEngine.UI.Image")
	sun.setSprite(self.mainTex_,self.info_:getTexRes())

	local name = content:ComponentByName("name","UnityEngine.UI.Text")
	name.text = __(self.info_:getNameKey())

	local desc = content:ComponentByName("desc","UnityEngine.UI.Text")
	desc.text = __(self.info_:getDescKey())

end

function BaseCard:switchShow(showForm)
	self.nowForm_ = showForm
	for form,content in pairs(self.cardContents_) do
		if showForm == form then
			content:SetActive(true)
			if not self.cardInits_[form] then
				local initFunc = self.cardInitFuncs_[form]
				initFunc()
				self.cardInits_[form] = true
			end
		else
			content:SetActive(false)
		end
	end
end

function BaseCard:getRectSize()
	return self.rect_.sizeDelta 
end

function BaseCard:getPivot()
	return self.rect_.pivot 
end

function BaseCard:getDirection()
	return self.showDirection_
end

function BaseCard:switchDirection(direction,duration)
	if self.showDirection_ == direction then
		return
	end
	self.showDirection_ = direction
	local targetRotation = direction == sun.CardDirection.FRONT and Vector3(0,0,0) or Vector3(0,180,0)
	if not duration or duration == 0 then
		self.go_.transform.localEulerAngles = targetRotation
	else
		self.go_.transform:DOLocalRotate(targetRotation,duration)
	end
end

function BaseCard:setPosition(pos)
	self.go_.transform.position = pos
end

function BaseCard:localMove(localPos,duration)
	if duration == 0 then
		self.go_.transform.localPosition = localPos
	else
		self.go_.transform:DOLocalMove(localPos,duration)
	end
end

--virtual,override in child(s)
function BaseCard:getCardPrefabPath()

end

function BaseCard:initComponents()

end
-------------------------------------

function BaseCard:onDispose()
	sun.EventDispatcher.inner():disposeProxy(self:getName())
end

return BaseCard