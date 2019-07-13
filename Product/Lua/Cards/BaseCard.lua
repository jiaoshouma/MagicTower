local BaseCard = class("BaseCard")

function BaseCard:ctor(cardNumber,cardType,idx)
	self.cardID_ = cardNumber
	self.cardType_ = cardType
	self.idx_ = idx
	self.backImgs_ = {}
	self:instantiate()
	self:initInfo()
	self:initCommonComponents()
	self:initComponents()

	self:switchShow(sun.CardShowForm.SPECIFIC)
	self:switchDirection(sun.CardDirection.FRONT)
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
	local simpleBaseImg = content:ComponentByName("base","UnityEngine.UI.Image")

	local backImg = content:ComponentByName("back","UnityEngine.UI.Image")
	self.backImgs_[sun.CardShowForm.SIMPLE] = backImg

	sun.setSprite(simpleBaseImg,self:getCardBaseImg(true))

end

function BaseCard:initSpecific()
	local content = self.cardContents_[sun.CardShowForm.SPECIFIC]
	local base = content:Find("base")
	local specificBaseImg = content:ComponentByName("base","UnityEngine.UI.Image")
	sun.setSprite(specificBaseImg,self:getCardBaseImg(false))

	local backImg = content:ComponentByName("back","UnityEngine.UI.Image")
	self.backImgs_[sun.CardShowForm.SPECIFIC] = backImg

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
		__TRACE(showForm,form,"11111111111")
		if showForm == form then
			print(content.gameObject.name,"nameeeee")
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
	self:refreshDirection()
end

function BaseCard:switchDirection(direction)
	self.showDirection_ = direction
	self:refreshDirection()
end

function BaseCard:refreshDirection()
	if not self.showDirection_ then
		return
	end
	local backImg = self.backImgs_[self.nowForm_]
	if backImg then
		if self.showDirection_ == sun.CardDirection.FRONT  then
			backImg:SetActive(false)
		else
			backImg:SetActive(true)
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