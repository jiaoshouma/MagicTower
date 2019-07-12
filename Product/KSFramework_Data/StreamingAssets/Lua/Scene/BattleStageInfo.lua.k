local WholeStageConf = {
	[1] = {pos = Vector3(12.5,-12.5,0)},
	[2] = {pos = Vector3(47.5,-12.5,0)},
	[3] = {pos = Vector3(82.5,-12.5,0)},
	[4] = {pos = Vector3(82.5,-47.5,0)},
	[5] = {pos = Vector3(82.5,-82.5,0)},
	[6] = {pos = Vector3(47.5,-82.5,0)},
	[7] = {pos = Vector3(12.5,-82.5,0)},
	[8] = {pos = Vector3(12.5,-47.5,0)},
}
local StageConf = {
	[sun.TurnStages.DRAW] = {txt = "D"},
	[sun.TurnStages.MAIN] = {txt = "M"},
	[sun.TurnStages.BATTLE] = {txt = "B"},
	[sun.TurnStages.TAIL] = {txt = "T"},
}

local TurnConf = {
	[sun.TurnType.PLAYER] = {disableColor = Color(170/255,194/255,1,1),enableColor = Color(0,75/255,1,1)},
	[sun.TurnType.ENEMY] = {disableColor = Color(255/255,155/255,135/255,1),enableColor = Color(1,3/255,0,1)},
}

local BattleStageInfo = class("BattleStageInfo")

function BattleStageInfo:ctor(parent,trans)
	self.parent_ = parent
	self.trans_ = trans
	self:initSelfComponents()
end

function BattleStageInfo:initSelfComponents()
	local transGo = self.trans_
	local stageItemGo = transGo:NodeByName("stage_item")
	stageItemGo:SetActive(false)
	self.bgByTurn_ = {}
	self.txtByTurn_ = {}
	for i,conf in ipairs(WholeStageConf) do
		local itemInstance = SunUtils.AddChild(transGo.gameObject,stageItemGo)
		itemInstance:SetActive(true)
		itemInstance.transform.localPosition = conf.pos or Vector3(0,0,0)
		local step = #WholeStageConf/2
		local turn = math.floor((i - 1) / step) + 1
		local trueIdx = i - (turn - 1) * step
		self.bgByTurn_[turn] = self.bgByTurn_[turn] or {}
		self.txtByTurn_[turn] = self.txtByTurn_[turn] or {}

		local bgImg = itemInstance:ComponentByName("bg","UnityEngine.UI.Image")
		local descTxt = itemInstance:ComponentByName("desc","UnityEngine.UI.Text")
		descTxt.color = Color(1,1,1,1)
		descTxt.text = StageConf[trueIdx].txt

		local turnConf = TurnConf[turn]
		bgImg.color = turnConf.disableColor

		table.insert(self.bgByTurn_[turn],bgImg)
		table.insert(self.txtByTurn_[turn],descTxt)
	end

	self:setTurnStageInfo(2,3)
end

function BattleStageInfo:setTurnStageInfo(turnType,stage)
	for t,bgs in ipairs(self.bgByTurn_) do
		for s,bg in ipairs(bgs) do
			local turnConf = TurnConf[t]
			if t == turnType and s == stage then
				bg.color = turnConf.enableColor
			else
				bg.color = turnConf.disableColor
			end
		end
	end
end

return BattleStageInfo