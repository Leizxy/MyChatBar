

local chatFrame1 = _G["ChatFrame1"]
local editBox = ChatEdit_ChooseBoxForSend()

local MyChatBarFrame = CreateFrame("Frame", "MyChatBarFrame", UIParent)
MyChatBarFrame:SetSize(24,24)
-- MyChatBarFrame:SetBackdrop({bgFile="Interface\\Buttons\\WHITE8X8", edgeFile="", tile = false, edgeSize=1})
-- MyChatBarFrame:SetBackdropColor(.5,.5,.5,.5)
MyChatBarFrame:SetPoint("TOPLEFT",chatFrame1,"BOTTOMLEFT",-5,-8) -- bar position

ChannelType = {
	["SAY"]		= {"说"},
	["YELL"]	= {"喊"},
	["GUILD"]	= {"会"},
	["PARTY"]	= {"队"},
	["RAID"]	= {"团"},
	["OFFICER"]	= {"官"},
	["INSTANCE_CHAT"] = {"副"}
}

local space = 20
local proxy = getmetatable(ChatTypeInfo).__index
for k,v in pairs(proxy) do
	if k == "INSTANCE_CHAT" then
		for a,b in pairs(v) do
			print(a..":"..tostring(b))
		end
	end
end
--[[
	ChatTypeInfo["SAY"] -- 一些说频道的属性
]]
-- print(chatFrame1:GetWidth()..","..chatFrame1:GetHeight())

-- print(editBox:GetName())
-- editBox:SetPoint("TOPLEFT", ChatFrame1,"BOTTOMLEFT",0 -20 )
-- TODO
local function ShowChannelButtons(channels)
	local cButton, cButtonName, text
	for i = 1,#channels do
		text = channels[i]
		-- print(text)
		cButtonName = "MyChatBarFrame"..i
		cButton = _G[cButtonName]
		-- 创建按钮
		if (not cButton) then
			-- print(cButtonName)
			cButton = CreateFrame("Frame", cButtonName, MyChatBarFrame)
			cButton:SetWidth(18)
			cButton:SetHeight(18)
			-- cButton:SetBackdrop({bgFile="Interface\\Buttons\\WHITE8X8", edgeFile="", tile = false, edgeSize=1})
			-- cButton:SetBackdropColor(1,1,0,.5)
			-- cButton:SetBackdropBorderColor(,0,1,1)
			-- print(cButton:GetWidth())
			-- print(space)
			cButton:SetScript("OnMouseDown",function(self,button)
				if button == "LeftButton" then
					print("click")
					editBox:SetAttribute("chatType", "CHANNEL4")
					ChatEdit_ActivateChat(editBox)
					editBox:SetText(editBox:GetText())
				else
				end
			end)
			cButton.text = cButton:CreateFontString(nil,"ARTWORK")
			cButton.text:SetFont(UNIT_NAME_FONT, 14, "THINOUTLINE")
			cButton.text:SetShadowOffset(1,0)
			cButton.text:SetPoint("CENTER", cButton, "CENTER", 0, 0)
			cButton.text:SetJustifyH("CENTER")
			cButton.text:SetText(text)
			
		end
		cButton:SetPoint("LEFT",cButton:GetParent(),"LEFT",(i-1)*(space + cButton:GetWidth()),0)
		
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
MyChatBarFrame:SetScript("OnEnter",function()
	print("MyChatBarFrame")
end)
MyChatBarFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
MyChatBarFrame:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
MyChatBarFrame:RegisterEvent("GROUP_ROSTER_UPDATE")


