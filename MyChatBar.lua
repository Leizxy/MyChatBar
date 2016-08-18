

local chatFrame1 = _G["ChatFrame1"]
local editBox = ChatEdit_ChooseBoxForSend()
editBox:SetPoint("TOPLEFT", ChatFrame1, "BOTTOMLEFT",-15,-25)

local MyChatBarFrame = CreateFrame("Frame", "MyChatBarFrame", UIParent)
MyChatBarFrame:SetSize(24,24)
-- MyChatBarFrame:SetBackdrop({bgFile="Interface\\Buttons\\WHITE8X8", edgeFile="", tile = false, edgeSize=1})
-- MyChatBarFrame:SetBackdropColor(.5,.5,.5,.5)
MyChatBarFrame:SetPoint("TOPLEFT",chatFrame1,"BOTTOMLEFT",-5,-6) -- bar position
-- 频道信息
AllChannels = {
	{channel = "SAY", 				text = "说", 		input = "/s ", 	currentChannel = false},
	{channel = "YELL", 				text = "喊", 		input = "/y ", 	currentChannel = false},
	{channel = "GUILD", 			text = "公会", 		input = "/g ", 	currentChannel = false},
	{channel = "OFFICER",			text = "官员", 		input = "/o ", 	currentChannel = false},
	{channel = "PARTY", 			text = "队伍", 		input = "/p ", 	currentChannel = false},
	{channel = "RAID", 				text = "团队", 		input = "/ra ", currentChannel = false},
	{channel = "RAIDWARNING", 		text = "团队通知", 	input = "/rw ", currentChannel = false},
	{channel = "INSTANCE_CHAT", 	text = "副本", 		input = "/i ", 	currentChannel = false},
	{channel = "WHISPER", 			text = "密语", 		input = "/w ", 	currentChannel = false},
	
--	{channel = "", 			text = "世界", 		input = "/大脚世界频道 ", 	currentChannel = false}
	
}

local space = 7
local function getChannelColor(channelType)
	if (ChatTypeInfo[channelType]) then
		return ChatTypeInfo[channelType]
	else
		local proxy = getmetatable(ChatTypeInfo).__index
        return proxy[key] or NORMAL_FONT_COLOR
	end
end
	
-- local proxy = getmetatable(ChatTypeInfo).__index
-- for k,v in pairs(proxy) do
	-- if k == "INSTANCE_CHAT" then
		-- for a,b in pairs(v) do
			-- print(a..":"..tostring(b))
		-- end
	-- end
-- end
--[[
	ChatTypeInfo["SAY"] -- 一些说频道的属性
	{colorNameByClass=true,
	flashTab=false,
	b=1,r=1,g=1,
	id=2,sticky=1,flashTabOnGeneral=false}
]]
-- print(chatFrame1:GetWidth()..","..chatFrame1:GetHeight())

-- print(editBox:GetName())

-- TODO


local function ShowChannelButtons(channels)
	local cButton, cButtonName, textString
	-- editBox:IsVisible() and channels[j].currentChannel = true or channels[j].currentChannel = false
	-- print(#channels)
	local i = 1
	while i <= #channels do
		-- print(channels[i].channel)
		-- print(tbChannel)
		textString = channels[i].text
		-- print(textString)
		cButtonName = "Channel"..i
		cButton = _G[cButtonName]
		local color = getChannelColor(channels[i].channel)
		-- 创建按钮
		if (not cButton) then
			-- print(cButtonName)
			cButton = CreateFrame("Frame", cButtonName, MyChatBarFrame)
			
			-- cButton:SetWidth(18)
			cButton:SetHeight(18)
			-- TODO
			--[[
			-- cButton:SetBackdrop({bgFile="Interface\\Buttons\\WHITE8X8", edgeFile="Interface\\Buttons\\WHITE8X8", tile = false, edgeSize=1})
			for k = 1,#channels do
				if channels[k].currentChannel and editBox:isVisible() and k==i then
					-- cButton:SetBackdropColor(color.r,color.g,color.b,.6)
					-- cButton:SetBackdropBorderColor(1-color.r,1-color.g,1-color.b,1)
				else
					-- cButton:SetBackdropColor(1-color.r,1-color.g,1-color.b,.6)
					-- cButton:SetBackdropBorderColor(color.r,color.g,color.b,1)					
				end
			end
			]]

			cButton:SetScript("OnMouseDown",function(self,button)
				local context = editBox:GetText()
				local tbChannel = self.tbChannel
				-- for j = 1,#channels do
					-- i == j and channels[j].currentChannel = true or channels[j].currentChannel = false
				-- end
				if button == "LeftButton" then
					if (tbChannel.channel == "WHISPER") then
						if UnitExists("target") and UnitName("target") and UnitIsPlayer("target")
							and GetDefaultLanguage("player") == GetDefaultLanguage("target")then
							local name, realm = UnitName("target")
							if realm~= "" then
								ChatFrame_OpenChat("/w "..name.."-"..realm.." ",editBox.chatFrame)
							else
								ChatFrame_OpenChat("/w "..name.." ",editBox.chatFrame)
							end
						else
							ChatFrame_ReplyTell(editBox.chatFrame)
						end
					elseif (tbChannel.channel == "ROLL") then
						-- print("ROLL")
						RandomRoll(1,100)
					else
						ChatFrame_OpenChat(tbChannel.input..context, editBox.chatFrame)
					end
				else
					-- ChatFrame_OpenChat("/1 ",editBox.chatFrame)
				end
			end)
			cButton.text = cButton:CreateFontString(nil,"ARTWORK")
			cButton.text:SetFont(UNIT_NAME_FONT, 14, "THINOUTLINE")
			cButton.text:SetShadowOffset(1,-1)
			cButton.text:SetPoint("CENTER", cButton, "CENTER", 0, 0)
			cButton.text:SetJustifyH("CENTER")
			
			
		end
		cButton.tbChannel = channels[i]
		if (channels[i].text == "大脚世界频道") then
			cButton.text:SetText(string.sub(textString,7,9))
		else
			cButton.text:SetText(string.sub(textString,1,3))
		end
		cButton:SetWidth(ceil(cButton.text:GetWidth())+4)

		--position
		cButton.text:SetTextColor(color.r,color.g,color.b)
		if i == 1 then 
			cButton:SetPoint("LEFT", cButton:GetParent(), "LEFT", 0, 0)
		else
			cButton:SetPoint("LEFT", _G["Channel"..(i-1)], "RIGHT", space, 0)
		end
		
		cButton:Show()
		i = i + 1
	end
	
	while (_G["Channel"..i]) do
		_G["Channel"..i]:Hide()
		i = i + 1
	end
end

local function addOtherChannels(channels) --大脚世界频道，综合等等
	for i = 1, select("#", GetChannelList()), 2 do
		channelID, channelName = select(i, GetChannelList())
		tinsert(channels, {channel = "CHANNEL"..channelID, input="/"..channelID.." ",currentChannel = false,text = channelName} )
	end
	return channels
end
local function addChannels(self)
	local channels = {}
	tinsert(channels,AllChannels[1])			--说
	tinsert(channels,AllChannels[2])			--喊
	if (IsInGuild()) then
		tinsert(channels,AllChannels[3])		--公会
		if (CanEditOfficerNote()) then
			tinsert(channels, AllChannels[4])	--官员
		end
	end
	if self.inParty then
		tinsert(channels, AllChannels[5])		--队伍
	end
	if self.inRaid then
		tinsert(channels, AllChannels[6])		--团队
		tinsert(channels, AllChannels[7])		--通知
	end
	if self.inInstance then
		tinsert(channels, AllChannels[8])		--副本
	end
	addOtherChannels(channels)
	tinsert(channels, AllChannels[9])			--密语
	tinsert(channels, {channel = "ROLL", input = "",text = "R"})
	ShowChannelButtons(channels)
end

MyChatBarFrame:SetScript("OnEvent",function(self,event,...)
	local inRaid = IsInRaid()
	local inParty = IsInGroup(LE_PARTY_CATEGORY_HOME)
	local inInstance = IsInGroup(LE_PARTY_CATEGORY_INSTANCE)
	if event == "GROUP_ROSTER_UPDATE" or 
	event == "PLAYER_ENTERING_WORLD" or event == "CHAT_MSG_CHANNEL_NOTICE" then		
		self.inRaid = inRaid
		self.inParty = inParty
		self.inInstance = inInstance
		addChannels(self)
	end
end)

MyChatBarFrame:SetScript("OnEnter",function()
	-- print("MyChatBarFrame")
end)

MyChatBarFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
MyChatBarFrame:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
MyChatBarFrame:RegisterEvent("GROUP_ROSTER_UPDATE")


