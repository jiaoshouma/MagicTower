local BaseCard = class("BaseCard")

function BaseCard:ctor(cardNumber,cardType,idx)
	self.cardID_ = cardNumber
	self.cardType_ = cardType
	self.idx_ = idx
	self:instantiate()
	self:initInfo()
	self:initCommonComponents()
	self:initComponents()
	self:switchShow(sun.CardShowForm.SPECIFIC)
end

function BaseCard:getSetting()
	if not self.setting_ then
		local typeSettings = sun.CardManager.get():getCardsSetting(self.cardType_)
		self.setting_ = typeSettings.Get(self.cardID_)
	end
	return self.setting_
end

function BaseCard:getName()
	local name = string.format("%s_%s_%s",self.cardID_,self.cardType_,self.idx_)
	return name
end

function BaseCard:registerEvent(eventName,callback)
	if not self.eventProxy_ then
		local name = string.format("%s_%s_%s",self.cardID_,self.cardType_,self.idx_)
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
	local prefab = sun.CardManager.get():loadCard(self.cardType_,self:getCardPrefabPath())
	self.go_ = CS.UnityEngine.GameObject.Instantiate(prefab)
end

function BaseCard:initInfo()
	if not self.info_ then
		local class = sun.CardManager.get():getCardModelClass(self.cardID_,self.cardType_)
		self.info_ = class.new(self.cardID_,self.cardType_,self.idx_)
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

end

function BaseCard:initSimple()
	local content = self.cardContents_[sun.CardShowForm.SIMPLE]
	self.simpleBaseImg_ = content:ComponentByName("base","UnityEngine.UI.Image")

	sun.AssetsLoader.get():loadSprite(self:getCardBaseImg(true),function(isOK,sp)
		self.simpleBaseImg_.sprite = sp
	end)
end

function BaseCard:initSpecific()
	local content = self.cardContents_[sun.CardShowForm.SPECIFIC]
	local base = content:Find("base")
	local specificBaseImg = content:ComponentByName("base","UnityEngine.UI.Image")
	sun.setSprite(specificBaseImg,self:getCardBaseImg(false))
	-- sun.AssetsLoader.get():loadSprite(self:getCardBaseImg(false),function(isOK,sp)
	-- 	if isOK and not IsNil(specificBaseImg) then
	-- 		specificBaseImg.sprite = sp
	-- 	end
	-- end)

	self.mainTex_ = content:ComponentByName("main_tex","UnityEngine.UI.Image")
	sun.setSprite(self.mainTex_,self.info_:getTexRes())

	local name = content:ComponentByName("name","UnityEngine.UI.Text")
	name.text = __(self.info_:getNameKey())

	local desc = content:ComponentByName("desc","UnityEngine.UI.Text")
	desc.text = __(self.info_:getDescKey())
end

function BaseCard:switchShow(showForm)
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

--virtual,override in child(s)
function BaseCard:getCardPrefabPath()

end

function BaseCard:initComponents()

end
-------------------------------------

function BaseCard:onDispose()
	sun.EventDispatcher.inner():diposeProxy(self:getName())
end

return BaseCard