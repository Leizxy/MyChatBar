
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
		-- ������ť
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
	tinsert(channels,"˵")
	tinsert(channels,"��")
	if (IsInGuild()) then
		tinsert(channels,"��")
		if (CanEditOfficerNote()) then
			tinsert(channels, "��")
		end
	end
	if self.inParty then
		tinsert(channels, "��")
	end
	if self.inRaid then
		tinsert(channels, "��")
	end
	if self.inInstance then
		tinsert(channels, "��")
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


