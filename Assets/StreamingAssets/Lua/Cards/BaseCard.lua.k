local BaseCard = class("BaseCard")

function BaseCard:ctor(cardNumber,cardType)
	self.cardID_ = cardNumber
	self.cardType_ = cardType
	self:instantiate()
	self:initCommonComponents()
	self:initComponents()
	self:switchShow(sun.CardShowForm.SPECIFIC)
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
	self.simpleBaseImg_ = self.simple_:ComponentByName("base","UnityEngine.UI.Image")

	local img = sun.AssetsLoader.get():loadSprite(self:getCardBaseImg(true))
	self.simpleBaseImg_.overrideSprite = img
end

function BaseCard:initSpecific()
	self.specificBaseImg_ = self.simple_:ComponentByName("base","UnityEngine.UI.Image")
	local img = sun.AssetsLoader.get():loadSprite(self:getCardBaseImg(false))
	print(img,"=========================")
	self.specificBaseImg_.overrideSprite = img
	local path  = self:getCardBaseImg(false)
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

return BaseCard