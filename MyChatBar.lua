
local MyChatBarFrame = CreateFrame("Frame", "MyChatBarFrame", UIParent)
MyChatBarFrame:SetSize(24,24)
MyChatBarFrame:SetPoint("TOPLEFT",_G["ChatFrame1"],"BOTTOMLEFT",10,24)


-- TODO
local function ShowChannelButtons(channels)
	local cButton, cButtonName, text
	for i = 1,#channels do
		text = channels[i]
		cButtonName = "MyChatBarFrame"..i
		cButton = _G[cButtonName]
		-- 创建按钮
		if (not cButton) then
			cButton = CreateFrame("Frame", cButtonName, MyChatBarFrame)
			cButton:SetWidth(18)
			cButton:SetHeight(18)
			cButton:SetPoint("LEFT",cButton:GetParent(),"RIGHT",5,0)
		end
	end
end

local function addChannels(self)
	local channels = {}
	tinsert(channels,"说")
	tinsert(channels,"喊")
	if (IsInGuild()) then
		tinsert(channels,"会")
		if (CanEditOfficerNote()) then
			tinsert(channels, "官")
		end
	end
	if self.inParty then
		tinsert(channels, "队")
	end
	if self.inRaid then
		tinsert(channels, "团")
	end
	if self.inInstance then
		tinsert(channels, "副")
	end
	
	ShowChannelButtons(channels)
end

MyChatBarFrame:SetScript("OnEvent",function(self,event,...)
	local inRaid = IsInRaid()
	local inParty = IsInGroup(LE_PARTY_CATEGORY_HOME)
	local inInstance = IsInGroup(LE_PARTY_CATEGORY_INSTANCE)
	self.inRaid = inRaid
	self.inParty = inParty
	self.inInstance = inInstance
	addChannels(self)
end)
MyChatBarFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
MyChatBarFrame:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
MyChatBarFrame:RegisterEvent("GROUP_ROSTER_UPDATE")


