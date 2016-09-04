local AddonName, info = ...

info.emotes = {
--[[
	--原版暴雪提供的8个图标
	{"{rt1}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_1]=]},
	{"{rt2}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_2]=]},
	{"{rt3}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_3]=]},
	{"{rt4}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_4]=]},
	{"{rt5}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_5]=]},
	{"{rt6}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_6]=]},
	{"{rt7}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_7]=]},
	{"{rt8}",	[=[Interface\TargetingFrame\UI-RaidTargetingIcon_8]=]},
	]]
	{ text="{天使}", 	icon = "angel" },		{ text="{生气}", 	icon = "angry" },
	{ text="{大笑}", 	icon = "biglaugh" },	{ text="{鼓掌}", 	icon = "clap" },
	{ text="{酷}", 		icon = "cool" },		{ text="{哭}", 		icon = "cry" },
	{ text="{可爱}", 	icon = "cutie" },		{ text="{鄙视}", 	icon = "despise" },
	{ text="{美梦}", 	icon = "dreamsmile" },	{ text="{尴尬}", 	icon = "embarrass" },
	
	{ text="{邪恶}", 	icon = "evil" },		{ text="{兴奋}", 	icon = "excited" },
	{ text="{晕}", 		icon = "faint" },		{ text="{打架}", 	icon = "fight" },
	{ text="{流感}", 	icon = "flu" },			{ text="{呆}", 		icon = "freeze" },
	{ text="{皱眉}", 	icon = "frown" },		{ text="{致敬}", 	icon = "greet" },
	{ text="{鬼脸}", 	icon = "grimace" },		{ text="{龇牙}", 	icon = "growl" },

	{ text="{开心}", 	icon = "happy" },		{ text="{心}",	 	icon = "heart" },
	{ text="{恐惧}", 	icon = "horror" },		{ text="{生病}", 	icon = "ill" },
	{ text="{无辜}", 	icon = "innocent" },	{ text="{功夫}", 	icon = "kongfu" },
	{ text="{花痴}", 	icon = "love" },		{ text="{邮件}", 	icon = "mail" },
	{ text="{化妆}", 	icon = "makeup" },		{ text="{马里奥}", 	icon = "mario" },

	{ text="{沉思}", 	icon = "meditate" },	{ text="{可怜}", 	icon = "miserable" },
	{ text="{好}",	 	icon = "okay" },		{ text="{漂亮}", 	icon = "pretty" },
	{ text="{吐}", 		icon = "puke" },		{ text="{握手}", 	icon = "shake" },
	{ text="{喊}", 		icon = "shout" },		{ text="{闭嘴}", 	icon = "shuuuu" },
	{ text="{害羞}", 	icon = "shy" },			{ text="{睡觉}", 	icon = "sleep" },
	
	{ text="{微笑}", 	icon = "smile" },		{ text="{吃惊}", 	icon = "suprise" },	
	{ text="{失败}",	icon = "surrender" },	{ text="{流汗}", 	icon = "sweat" },
	{ text="{流泪}", 	icon = "tear" },		{ text="{悲剧}", 	icon = "tears" },
	{ text="{想}", 		icon = "think" },		{ text="{偷笑}", 	icon = "titter" },
	{ text="{猥琐}", 	icon = "ugly" },		{ text="{胜利}", 	icon = "victory" },

	{ text="{雷锋}", 	icon = "volunteer" },	{ text="{委屈}", 	icon = "wronged" }
	-- http://emojipedia.org/grinning-face/
	-- 1~10
	,{ text="😠",	icon = "emoji_angry"}				,{ text="😧",	icon = "emoji_anguished"}
	,{ text="😲",	icon = "emoji_astonished"}			,{ text="🤕",	icon = "emoji_bandage"}
	,{ text="😃",	icon = "emoji_bigsmile"}			,{ text="😚",	icon = "emoji_closedeyekiss"}
	,{ text="😓",	icon = "emoji_coldsweat"}			,{ text="😖",	icon = "emoji_confounded"}
	,{ text="😕",	icon = "emoji_confused"}			,{ text="😢",	icon = "emoji_crying"}
	-- 11~20
	,{ text="😋",	icon = "emoji_delicious"}			,{ text="😥",	icon = "emoji_disappointed"}
	,{ text="😞",	icon = "emoji_disappointed2"}		,{ text="😵",	icon = "emoji_dizzy"}
	,{ text="😨",	icon = "emoji_fearful"}				,{ text="😳",	icon = "emoji_flushed"}
	,{ text="😦",	icon = "emoji_frowning"}			,{ text="😎",	icon = "emoji_glassessmile"}
	,{ text="😬",	icon = "emoji_grimacing"}			,{ text="😀",	icon = "emoji_grinning"}
	-- 21~30
	,{ text="😁",	icon = "emoji_grinningsmile"}		,{ text="😇",	icon = "emoji_halosmile"}
	,{ text="😍",	icon = "emoji_heart_shaped"}		,{ text="🤗",	icon = "emoji_hugging"}
	,{ text="😯",	icon = "emoji_hushed"}				,{ text="👿",	icon = "emoji_imp"}
	,{ text="😗",	icon = "emoji_kissing"}				,{ text="😭",	icon = "emoji_loudlycry"}
	,{ text="😷",	icon = "emoji_medicalmask"}			,{ text="🤑",	icon = "emoji_money"}
	-- 31~40
	,{ text="🤓",	icon = "emoji_nerd"}				,{ text="😐",	icon = "emoji_neutral"}
	,{ text="😑",	icon = "emoji_noexpression"}		,{ text="😶",	icon = "emoji_nomouth"}
	,{ text="😮",	icon = "emoji_openmouth"}			,{ text="😔",	icon = "emoji_pensive"}
	,{ text="😣",	icon = "emoji_persevering"}			,{ text="😡",	icon = "emoji_pouting"}
	,{ text="😌",	icon = "emoji_relieved"}			,{ text="🙄",	icon = "emoji_rollingeyes"}
	-- 41~50
	,{ text="😱",	icon = "emoji_screaming"}			,{ text="😴",	icon = "emoji_sleep"}
	,{ text="😪",	icon = "emoji_sleepy"}				,{ text="🙁",	icon = "emoji_slightlyfrown"}
	,{ text="🙂",	icon = "emoji_slightlysmile"}		,{ text="😆",	icon = "emoji_smileclosedeye"}
	,{ text="😊",	icon = "emoji_smilefaceeye"}		,{ text="😄",	icon = "emoji_smilefaceeyeandmouth"}
	,{ text="😈",	icon = "emoji_smilehorn"}			,{ text="😙",	icon = "emoji_smilekiss"}
	-- 51~60
	,{ text="😏",	icon = "emoji_smirking"}			,{ text="😅",	icon = "emoji_sweatsmile"}
	,{ text="😰",	icon = "emoji_sweatwithmouth"}		,{ text="😂",	icon = "emoji_tearsofjoy"}
	,{ text="🤒",	icon = "emoji_thermometer"}			,{ text="🤔",	icon = "emoji_thinking"}
	,{ text="😘",	icon = "emoji_throwingkiss"}		,{ text="😫",	icon = "emoji_tired"}
	,{ text="😛",	icon = "emoji_tongue"}				,{ text="😝",	icon = "emoji_tongueclosedeye"}
	-- 61~70
	,{ text="😜",	icon = "emoji_tonguewinkingeye"}	,{ text="😤",	icon = "emoji_triumph"}
	,{ text="😒",	icon = "emoji_unamused"}			,{ text="🙃",	icon = "emoji_upsidedown"}
	,{ text="😩",	icon = "emoji_weary"}				,{ text="☹",	icon = "emoji_whitefrown"}
	,{ text="☺️",	icon = "emoji_whitesmile"}			,{ text="😉",	icon = "emoji_winking"}
	,{ text="😟",	icon = "emoji_worried"}				,{ text="🤐",	icon = "emoji_zippermouth"}
}
local emotes = info.emotes
local BASE_SITE = "Interface\\AddOns\\"..AddonName.."\\icon\\"

local iconSize = 24
local iconSpace = 2
local AllIcons = #emotes
local page -- emote 页数
local countdown = 5 -- 无操作时显示时间
local chatFrame1 = _G["ChatFrame1"]
local EmoteFrame = CreateFrame("Frame","EmoteFrame",UIParent)
local EmoteTable1,EmoteTable2
EmoteFrame:SetSize(24,24)
EmoteFrame:SetBackdrop({bgFile="Interface\\Buttons\\WHITE8X8", edgeFile="Interface\\Buttons\\WHITE8X8", tile = false, edgeSize=2})
EmoteFrame:SetBackdropColor(0,0,0,.8)
-- EmoteFrame:SetBackdropBorderColor(.63,.93,.26,1)
-- EmoteFrame:SetBackdropBorderColor(0,0,0,1)
EmoteFrame.text = EmoteFrame:CreateFontString(nil,"ARTWORK")
EmoteFrame.text:SetFont("Fonts\\ARHei.ttf",14,"OUTLINE")
EmoteFrame.text:SetShadowOffset(1, 0)
EmoteFrame.text:SetShadowColor(0, 0, 0, 0.5)
EmoteFrame.text:SetPoint("CENTER", EmoteFrame, "CENTER", 0, 0)
EmoteFrame.text:SetJustifyH("CENTER")
EmoteFrame.text:SetText("E")
EmoteFrame:SetPoint("BOTTOMLEFT",chatFrame1,"BOTTOMRIGHT",5,-5)

-- 图片解析
local function filter(self, event, msg, ...)
	for i = 1, #emotes do 
		if msg:find(emotes[i].text) then
			msg = msg:gsub(emotes[i].text,format("|T%s:20|t",BASE_SITE..emotes[i].icon))
		end
	end
	return false, msg, ...
end

local function addFilter(...)
	for i = 1, select("#", ...) do
		ChatFrame_AddMessageEventFilter(select(i,...),filter)
	end
end
addFilter("CHAT_MSG_SAY","CHAT_MSG_CHANNEL","CHAT_MSG_YELL","CHAT_MSG_OFFICER",
"CHAT_MSG_WHISPER","CHAT_MSG_BN_WHISPER","CHAT_MSG_WHISPER_INFORM",
"CHAT_MSG_RAID","CHAT_MSG_RAID_LEADER","CHAT_MSG_PARTY",
"CHAT_MSG_PARTY_LEADER","CHAT_MSG_GUILD","CHAT_MSG_BATTLEGROUND",
"CHAT_MSG_AFK","CHAT_MSG_DND"
)

-- 打开关闭表情选择界面
local function ToggleEmote(page)
	if page == 1 then
		if EmoteTable2:IsShown() then
			EmoteTable2:Hide()
			EmoteTable1:Show()
		elseif EmoteTable1:IsShown() then
			EmoteTable1:Hide()
		else
			EmoteTable1:Show()
		end
		
	elseif page == 2 then

		if EmoteTable1:IsShown() then
			EmoteTable1:Hide()
			EmoteTable2:Show()
		elseif EmoteTable2:IsShown() then
			EmoteTable2:Hide()
		else
			EmoteTable2:Show()
		end
	end

end

local function IconMouseUp(self,button)
	-- print(self.text)
	if button == "LeftButton" then
		local editBox = ChatEdit_ChooseBoxForSend()
		if (not editBox:IsShown()) then
			ChatEdit_ActivateChat(editBox)
		end
		editBox:Insert(self.text)
		ToggleEmote(page)
	elseif button == "RightButton" then
		local editBox = ChatEdit_ChooseBoxForSend()
		if (not editBox:IsShown()) then
			ChatEdit_ActivateChat(editBox)
		end
		editBox:Insert(self.text)
		countdown = 5
	end
end

local function CreateEmoteTable(frame,page)
	local row
	local index
	if page == 1 then
		row = 8
		iconNums = 52
		index = 1
		frame = CreateFrame("Frame","EmoteTable1",EmoteFrame)		
	elseif page == 2 then
		row = 10
		iconNums = 70
		index = 53
		frame = CreateFrame("Frame","EmoteTable2",EmoteFrame)
	end
	local col = ceil(iconNums / row)
	frame:SetSize(iconSize*row+iconSpace*(row+1), iconSize*col + iconSpace*(col+1))
	-- frame:SetBackdrop({bgFile="Interface\\Buttons\\WHITE8X8", edgeFile="Interface\\Buttons\\WHITE8X8", tile = false, edgeSize=2})
	frame:SetBackdrop({bgFile="Interface\\AddOns\\MyChatBar\\tga", edgeFile="Interface\\AddOns\\MyChatBar\\tga", tile = false, edgeSize=2})
	frame:SetBackdropColor(0,0,0,1)
	frame:SetBackdropBorderColor(1,1,1,.8)
	frame:SetPoint("BOTTOMLEFT",EmoteFrame,"TOPLEFT",0,5)
	for i = 1, iconNums do
		local icon
		local text = emotes[i+index-1].text
		local texture = BASE_SITE..emotes[i+index-1].icon
		if (not icon) then icon = CreateFrame("Frame",format("Icon%d",i),frame) end
		icon:SetSize(iconSize,iconSize)
		icon.text = text
		icon.texture = icon:CreateTexture(nil,"ARTWORK") 
		icon.texture:SetTexture("")
		icon.texture:SetTexture(texture)
		icon.texture:SetAllPoints(icon)
		icon:Show()
		local iconX = ((i%row==0 and row or i%row) -1)*(iconSize+iconSpace)+iconSpace
		local iconY = -(floor((i-1)/row)*(iconSize+iconSpace)+iconSpace)
		icon:SetPoint("TOPLEFT",frame,"TOPLEFT",iconX,iconY)
		icon:SetScript("OnMouseUp",IconMouseUp)
		-- icon:SetScript("OnEnter",function() countdown = 5 end)
		-- icon:SetScript("OnLeave",function() end)
	end
	return frame
end

EmoteFrame:SetScript("OnMouseDown",function(self,button)
	if (not EmoteTable1) then EmoteTable1 = CreateEmoteTable(EmoteTable1,1) end
	if (not EmoteTable2) then EmoteTable2 = CreateEmoteTable(EmoteTable2,2) end
	if button == "LeftButton" then
		page = 1
		countdown = 5
		ToggleEmote(page) 
	elseif button == "RightButton" then
		page = 2
		countdown = 5
		ToggleEmote(page) 		
	end
end)
EmoteFrame:SetScript("OnEnter",function() countdown = 5 end)
EmoteFrame:SetScript("OnLeave",function() end)
-- 聊天气泡
local MaxWidth = 240
local function BubbleEmote(frame, region)
	if not frame:IsShown() then
		region.cachedText = nil
		return
	end
	MaxWidth = math.max(frame:GetWidth(),MaxWidth)
	local text = region:GetText() or ""
	
	if text == region.cachedText then return end
	
	frame:SetBackdropBorderColor(region:GetTextColor())
	
	for tag in string.gmatch(text, "%b{}") do
		local temp = strlower(string.gsub(tag,"[{}]",""))
		if ICON_TAG_LIST[temp] and ICON_LIST[ICON_TAG_LIST[temp]] then
			text = string.gsub(text, tag, ICON_LIST[ICON_TAG_LIST[temp]].."0|t")
		end
	end
	
	for i = 1, AllIcons do
		if text:find(emotes[i].text) then
			text = text:gsub(emotes[i].text,format("|T%s:20|t",BASE_SITE..emotes[i].icon))
		end
	end
	region:SetText(text)
	-- print(text)
	region.cachedText = text
	region:SetWidth(math.min(region:GetStringWidth(),MaxWidth))
end
-- breathColor
local r,g,b = 0,0,0
local turn = false
local function breathColor(t)
	-- 目标颜色
	local endR = RAID_CLASS_COLORS[select(2,UnitClass("player"))].r
	local endG = RAID_CLASS_COLORS[select(2,UnitClass("player"))].g
	local endB = RAID_CLASS_COLORS[select(2,UnitClass("player"))].b
	-- local 
	
	local step = t/5
	-- r = r + step
	-- g = g + step
	-- b = b + step
	-- if r >= endR then
		-- r = endR
	-- end
	-- if g >= endG then
		-- g = endG
	-- end
	-- if b >= endB then 
		-- b = endB
	-- end
	if turn then 
		r = (r - step) <= 0 and 0 or (r - step)
		g = (g - step) <= 0 and 0 or (g - step)
		b = (b - step) <= 0 and 0 or (b - step)
	else
		r = min((r + step),endR)
		g = min((g + step),endG)
		b = min((b + step),endB)
	end
	if r == endR and g == endG and b == endB then
		turn = true
	elseif r == 0 and g == 0 and b == 0 then 
		turn = false
	end
	-- print(r..","..g..","..b)
	
	EmoteFrame:SetBackdropBorderColor(r,g,b,1)
	
end
local interval = 0.1
EmoteFrame:SetScript("OnUpdate",function(self, t)
	interval = interval - t
	countdown = countdown - t
	if interval < 0 then
		interval = 0.1
		for i = 1,WorldFrame:GetNumChildren() do
			local childFrame = select(i, WorldFrame:GetChildren())
			if childFrame:GetBackdrop() and 
			childFrame:GetBackdrop().bgFile == "Interface\\Tooltips\\ChatBubble-Background" then
				for j = 1, childFrame:GetNumRegions() do
					local region = select(j, childFrame:GetRegions())
					if region:GetObjectType() == "FontString" then
						BubbleEmote(childFrame, region)
					end
				end
			end
		end
	end
	if countdown < 0 then
		if EmoteTable1 ~= nil then EmoteTable1:Hide() end
		if EmoteTable2 ~= nil then EmoteTable2:Hide() end
		-- EmoteTable2:Hide()
	end
	breathColor(t)
end)
-- RAID_CLASS_COLORS[select(2,UnitClass("player"))]
