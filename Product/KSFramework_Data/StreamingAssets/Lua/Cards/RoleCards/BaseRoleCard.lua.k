local BaseRoleCard = class("BaseRoleCard",import("Cards/BaseCard"))

function BaseRoleCard:ctor(cardNumber,cardType,id)
	BaseRoleCard.super.ctor(self,cardNumber,cardType,id)
	
end

function BaseRoleCard:getCardPrefabPath()
	return "Prefabs/Cards/base_role_card"
end

function BaseRoleCard:getCardBaseImg(isSimple)
	if isSimple then
		return "UIAtlas/CardCommonUI/base_simple_role.png"
	else
		return "Images/cards/RoleCards/base_role.png"
	end
end

function BaseRoleCard:initComponents()
	
end

function BaseRoleCard:initSpecific()
	BaseRoleCard.super.initSpecific(self)

	local content = self.cardContents_[sun.CardShowForm.SPECIFIC]

	local belong = content:Find("belong")
	local belongImg = belong:ComponentByName("belong_img","UnityEngine.UI.Image")
	sun.setSprite(belongImg,"UIAtlas/CardCommonUI/ball_"..self.info_:getBelong()..".png")
	local belongTxt = belong:ComponentByName("belong_txt","UnityEngine.UI.Text")
	belongTxt.text = __("BELONG_"..self.info_:getBelong())

	local heartGird = content:Find("heart_grid")
	local heartItem = content:Find("heart_item")
	self.heartItems_ = {}
	for i = 1,self:getSetting().command do
		local item = SunUtils.AddChild(heartGird.gameObject,heartItem.gameObject)
		local heart = item.transform:Find("heart")
		self.heartItems_[i] = heart
	end
	heartItem:SetActive(false)

	local force = content:ComponentByName("force","UnityEngine.UI.Text")
	local command = content:ComponentByName("command","UnityEngine.UI.Text")
	local moral = content:ComponentByName("moral","UnityEngine.UI.Text")
	force.text = __("FORCE")
	command.text = __("COMMAND")
	moral.text = __("MORAL")

	self.forceNum_  = content:ComponentByName("force/num","UnityEngine.UI.Text")
	self.commandNum_  = content:ComponentByName("command/num","UnityEngine.UI.Text")
	self.moralNum_  = content:ComponentByName("moral/num","UnityEngine.UI.Text")

	self:refreshAttributeLabels()
	self:refreshHeart()
end

function BaseRoleCard:refreshHeart()
	local command = self.info_:getCommand()
	for i,heart in ipairs(self.heartItems_) do
		if i > command then
			heart:SetActive(false)
		else
			heart:SetActive(true)
		end
	end
end

function BaseRoleCard:refreshAttributeLabels()
	local force = self.info_:getForce()
	local command = self.info_:getCommand()
	local moral = self.info_:getMoral()
	self.forceNum_.text = force
	self.commandNum_.text = command
	self.moralNum_.text = moral
end

return BaseRoleCard