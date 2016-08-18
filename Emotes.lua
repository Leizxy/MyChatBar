local MyChatBar, info = ...
-- print(MyChatBar.. "?")
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
	{ text="{委屈}", 	icon = "wronged" },
	
	{ text="{汗}",		icon = "emoji"}
}
-- print(info.emotes[1].text)
local emotes = info.emotes
local function filter(self, event, msg, ...)
	for i = 1,#emotes do --每条msg都会跑#emotes次，看看能否优化
		if msg:find(emotes[i].text) then
			msg = msg:gsub(emotes[i].text,format("|T%s:16|t","Interface\\AddOns\\"..MyChatBar.."\\icon\\"..emotes[i].icon),1)
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

-- ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",filter)