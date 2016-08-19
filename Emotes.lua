local MyChatBar, info = ...

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
	{ text="{天使}", 	icon = "angel" },
	{ text="{生气}", 	icon = "angry" },
	{ text="{大笑}", 	icon = "biglaugh" },
	{ text="{鼓掌}", 	icon = "clap" },
	{ text="{酷}", 		icon = "cool" },
	{ text="{哭}", 		icon = "cry" },
	{ text="{可爱}", 	icon = "cutie" },
	{ text="{鄙视}", 	icon = "despise" },
	{ text="{美梦}", 	icon = "dreamsmile" },
	{ text="{尴尬}", 	icon = "embarrass" },
	{ text="{邪恶}", 	icon = "evil" },
	{ text="{兴奋}", 	icon = "excited" },
	
	{ text="{晕}", 		icon = "faint" },
	{ text="{打架}", 	icon = "fight" },
	{ text="{流感}", 	icon = "flu" },
	{ text="{呆}", 		icon = "freeze" },
	{ text="{皱眉}", 	icon = "frown" },
	{ text="{致敬}", 	icon = "greet" },
	{ text="{鬼脸}", 	icon = "grimace" },
	{ text="{龇牙}", 	icon = "growl" },
	{ text="{开心}", 	icon = "happy" },
	{ text="{心}",	 	icon = "heart" },
	
	{ text="{恐惧}", 	icon = "horror" },
	{ text="{生病}", 	icon = "ill" },
	{ text="{无辜}", 	icon = "innocent" },
	{ text="{功夫}", 	icon = "kongfu" },
	{ text="{花痴}", 	icon = "love" },	
	{ text="{邮件}", 	icon = "mail" },
	{ text="{化妆}", 	icon = "makeup" },
	{ text="{马里奥}", 	icon = "mario" },
	{ text="{沉思}", 	icon = "meditate" },
	{ text="{可怜}", 	icon = "miserable" },
	
	{ text="{好}",	 	icon = "okay" },
	{ text="{漂亮}", 	icon = "pretty" },
	{ text="{吐}", 		icon = "puke" },
	{ text="{握手}", 	icon = "shake" },
	{ text="{喊}", 		icon = "shout" },	
	{ text="{闭嘴}", 	icon = "shuuuu" },
	{ text="{害羞}", 	icon = "shy" },
	{ text="{睡觉}", 	icon = "sleep" },
	{ text="{微笑}", 	icon = "smile" },
	{ text="{吃惊}", 	icon = "suprise" },
	
	{ text="{失败}",	icon = "surrender" },
	{ text="{流汗}", 	icon = "sweat" },
	{ text="{流泪}", 	icon = "tear" },
	{ text="{悲剧}", 	icon = "tears" },
	{ text="{想}", 		icon = "think" },	
	{ text="{偷笑}", 	icon = "titter" },
	{ text="{猥琐}", 	icon = "ugly" },
	{ text="{胜利}", 	icon = "victory" },
	{ text="{雷锋}", 	icon = "volunteer" },
	{ text="{委屈}", 	icon = "wronged" }
	-- http://emojipedia.org/grinning-face/
	-- 1~10
	,{ text="{angry}",		icon = "emoji_angry"}
	,{ text="{anguish}",	icon = "emoji_anguished"}
	,{ text="{astonish}",	icon = "emoji_astonished"}
	,{ text="{bandage}",	icon = "emoji_bandage"}
	,{ text="{smile}",		icon = "emoji_bigsmile"}
	,{ text="{kiss}",		icon = "emoji_closedeyekiss"}
	,{ text="{coldsweat}",	icon = "emoji_coldsweat"}
	,{ text="{confound}",	icon = "emoji_confounded"}
	,{ text="{confuse}",	icon = "emoji_confused"}
	,{ text="{cry}",		icon = "emoji_crying"}
	-- 11~20
	,{ text="{delicious}",		icon = "emoji_delicious"}
	,{ text="{disappoint}",		icon = "emoji_disappointed"}
	,{ text="{disappointed}",	icon = "emoji_disappointed2"}
	,{ text="{dizzy}",			icon = "emoji_dizzy"}
	,{ text="{fearful}",		icon = "emoji_fearful"}
	,{ text="{flushed}",		icon = "emoji_flushed"}
	,{ text="{frowning}",		icon = "emoji_frowning"}
	,{ text="{smile2}",			icon = "emoji_glassessmile"}
	,{ text="{grimace}",		icon = "emoji_grimacing"}
	,{ text="{😀}",			icon = "emoji_grinning"}
	-- 21~30
	,{ text="{grinsmile}",		icon = "emoji_grinningsmile"}
	,{ text="{halosmile}",		icon = "emoji_halosmile"}
	,{ text="{heartshaped}",	icon = "emoji_heart_shaped"}
	,{ text="{hug}",			icon = "emoji_hugging"}
	,{ text="{hush}",			icon = "emoji_hushed"}
	,{ text="{imp}",			icon = "emoji_imp"}
	,{ text="{kiss2}",			icon = "emoji_kissing"}
	,{ text="{loudcry}",		icon = "emoji_loudlycry"}
	,{ text="{mask}",			icon = "emoji_medicalmask"}
	,{ text="{money}",			icon = "emoji_money"}
	-- 31~40
	,{ text="{nerd}",			icon = "emoji_nerd"}
	,{ text="{neutral}",		icon = "emoji_neutral"}
	,{ text="{noexpression}",	icon = "emoji_noexpression"}
	,{ text="{nomouth}",		icon = "emoji_nomouth"}
	,{ text="{openmouth}",		icon = "emoji_openmouth"}
	,{ text="{pensive}",		icon = "emoji_pensive"}
	,{ text="{persever}",		icon = "emoji_persevering"}
	,{ text="{pout}",			icon = "emoji_pouting"}
	,{ text="{relieved}",		icon = "emoji_relieved"}
	,{ text="{rolleye}",		icon = "emoji_rollingeyes"}
	-- 41~50
	,{ text="{scream}",		icon = "emoji_screaming"}
	,{ text="{sleep}",		icon = "emoji_sleep"}
	,{ text="{sleepy}",		icon = "emoji_sleepy"}
	,{ text="{frown}",		icon = "emoji_slightlyfrown"}
	,{ text="{smile3}",		icon = "emoji_slightlysmile"}
	,{ text="{smile4}",		icon = "emoji_smileclosedeye"}
	,{ text="{smile5}",		icon = "emoji_smilefaceeye"}
	,{ text="{smile6}",		icon = "emoji_smilefaceeyeandmouth"}
	,{ text="{horn}",		icon = "emoji_smilehorn"}
	,{ text="{kiss}",		icon = "emoji_smilekiss"}
	-- 51~60
	,{ text="{smirk}",			icon = "emoji_smirking"}
	,{ text="{smile7}",			icon = "emoji_sweatsmile"}
	,{ text="{sweat2}",			icon = "emoji_sweatwithmouth"}
	,{ text="{笑哭}",			icon = "emoji_tearsofjoy"}
	,{ text="{thermometer}",	icon = "emoji_thermometer"}
	,{ text="{think}",			icon = "emoji_thinking"}
	,{ text="{飞吻}",			icon = "emoji_throwingkiss"}
	,{ text="{tired}",			icon = "emoji_tired"}
	,{ text="{tongue}",			icon = "emoji_tongue"}
	,{ text="{tongue2}",		icon = "emoji_tongueclosedeye"}
	-- 61~70
	,{ text="{tongue3}",		icon = "emoji_tonguewinkingeye"}
	,{ text="{triumph}",		icon = "emoji_triumph"}
	,{ text="{unamused}",		icon = "emoji_unamused"}
	,{ text="{upsidedown}",		icon = "emoji_upsidedown"}
	,{ text="{weary}",			icon = "emoji_weary"}
	,{ text="{frown2}",			icon = "emoji_whitefrown"}
	,{ text="{smile8}",			icon = "emoji_whitesmile"}
	,{ text="{wink}",			icon = "emoji_winking"}
	,{ text="{worry}",			icon = "emoji_worried"}
	,{ text="{zipper}",			icon = "emoji_zippermouth"}
}
local emotes = info.emotes
local BASE_SITE = "Interface\\AddOns\\"..MyChatBar.."\\icon\\"

local iconSize = 24
local iconSpace = 2
local iconNums = #emotes
-- print(MyChatBar.. "?")
local chatFrame1 = _G["ChatFrame1"]
local EmoteFrame = CreateFrame("Frame","EmoteFrame",UIParent)
local EmoteTable

EmoteFrame:SetSize(24,24)
EmoteFrame:SetBackdrop({bgFile="Interface\\Buttons\\WHITE8X8", edgeFile="Interface\\Buttons\\WHITE8X8", tile = false, edgeSize=1})
EmoteFrame:SetBackdropColor(.5,.5,.5,.5)
EmoteFrame:SetPoint("BOTTOMLEFT",chatFrame1,"BOTTOMRIGHT",0,0)

-- 图片解析
local function filter(self, event, msg, ...)
	for i = 1, iconNums do --每条msg都会跑#emotes次，看看能否优化
		-- print(msg:find(emotes[i].text))
		if msg:find(emotes[i].text) then
			-- print(msg)
			msg = msg:gsub(emotes[i].text,format("|T%s:20|t",BASE_SITE..emotes[i].icon),1)
			-- print(msg)
		end
	end
	return false, msg, ...
end
local function addFilter(...)
	for i = 1, select("#", ...) do
		ChatFrame_AddMessageEventFilter(select(i,...),filter)
	end
end
addFilter("CHAT_MSG_CHANNEL","CHAT_MSG_SAY","CHAT_MSG_YELL",
"CHAT_MSG_WHISPER","CHAT_MSG_BN_WHISPER","CHAT_MSG_WHISPER_INFORM",
"CHAT_MSG_RAID","CHAT_MSG_RAID_LEADER","CHAT_MSG_PARTY",
"CHAT_MSG_PARTY_LEADER","CHAT_MSG_GUILD","CHAT_MSG_BATTLEGROUND",
"CHAT_MSG_AFK","CHAT_MSG_DND")

--[[
for i = 1, #emotes do
	local text = emotes[i].text
	local icon = emotes[i].icon
	ICON_TAG_LIST[icon] = text
	print(ICON_TAG_LIST[icon])
	ICON_LIST[icon] = "|TInterface\\AddOns\\"..MyChatBar.."\\emotes\\"..icon..":20|t"
	print(ICON_LIST[icon])
end
]]
local function ToggleEmote()
	if EmoteTable:IsShown() then
		EmoteTable:Hide()
	else
		EmoteTable:Show()
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
		ToggleEmote()
	elseif button == "RightButton" then
		local editBox = ChatEdit_ChooseBoxForSend()
		if (not editBox:IsShown()) then
			ChatEdit_ActivateChat(editBox)
		end
		editBox:Insert(self.text)
	end
end

local function CreateEmoteTable()
	local row = 8
	local col = ceil(iconNums / row)
	EmoteTable = CreateFrame("Frame","EmoteTable",EmoteFrame)
	EmoteTable:SetSize(iconSize*row+iconSpace*(row+1), iconSize*col + iconSpace*(col+1))
	EmoteTable:SetBackdrop({bgFile="Interface\\Buttons\\WHITE8X8", edgeFile="Interface\\Buttons\\WHITE8X8", tile = false, edgeSize=1})
	EmoteTable:SetBackdropColor(0,0,0,.5)
	EmoteTable:SetBackdropBorderColor(.5,.5,.5,.5)
	EmoteTable:SetPoint("BOTTOMLEFT",EmoteFrame,"TOPLEFT",0,5)
	-- framestrata
	
	for i = 1, iconNums do
		local text = emotes[i].text
		local texture = BASE_SITE..emotes[i].icon
		local icon = CreateFrame("Frame",format("Icon%d",i),EmoteTable)
		icon:SetSize(iconSize,iconSize)
		icon.text = text
		icon.texture = icon:CreateTexture(nil,"ARTWORK")
		icon.texture:SetTexture(texture)
		icon.texture:SetAllPoints(icon)
		-- icon:Show()
		local iconX = ((i%row==0 and row or i%row) -1)*(iconSize+iconSpace)+iconSpace
		local iconY = -floor((i-1)/8)*(iconSize+iconSpace)+iconSpace
		icon:SetPoint("TOPLEFT",EmoteTable,"TOPLEFT",iconX,iconY)
		icon:SetScript("OnMouseUp",IconMouseUp)
		
	end
end

EmoteFrame:SetScript("OnMouseDown",function(self,button)
	if button == "LeftButton" then
		print("EmoteFrame up")
		if (not EmoteTable) then CreateEmoteTable() 
		else ToggleEmote() end
	else
	end
end)

-- 聊天气泡
local function BubbleEmote(frame, region)
	if not frame:IsShown() then
		region.cachedText = nil
		return
	end
	
	local text = region:GetText() or ""
	
	if text == region.cachedText then return end
	
	frame:SetBackdropBorderColor(region:GetTextColor())
	
	for tag in string.gmatch(text, "%b{}") do
		local temp = strlower(string.gsub(tag,"[{}]",""))
		if ICON_TAG_LIST[temp] and ICON_LIST[ICON_TAG_LIST[temp]] then
			text = string.gsub(text, tag, ICON_LIST[ICON_TAG_LIST[temp]].."0|t")
		end
	end
	
	for i = 1, iconNums do
		if text:find(emotes[i].text) then
			text = text:gsub(emotes[i].text,format("|T%s:20|t",BASE_SITE..emotes[i].icon),1)
			-- break
		end
	end
	region:SetText(text)
	region.cachedText = text

end

local interval = 0.1
EmoteFrame:SetScript("OnUpdate",function(self, t)
	interval = interval - t
	if interval < 0 then
		interval = 0.1
		for i = 1,WorldFrame:GetNumChildren() do
			local childFrame = select(i, WorldFrame:GetChildren())
			if childFrame:GetBackdrop() and 
			childFrame:GetBackdrop().bgFile == "Interface\\Tooltips\\ChatBubble-Background" then
				for j = 1, childFrame:GetNumRegions() do
					local region = select(j, childFrame:GetRegions())
					-- print(region)
					if region:GetObjectType() == "FontString" then
						BubbleEmote(childFrame, region)
					end
				end
			end
		end
	end
end)