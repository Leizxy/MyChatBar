--[[local locale = GetLocale()

local ShortChannels = {
    ["PARTY"]                = { zhTW="(隊)",   zhCN="(队)" },
    ["PARTY_LEADER"]         = { zhTW="(隊長)", zhCN="(队长)" },
    ["PARTY_GUIDE"]          = { zhTW="(隊領)", zhCN="(队领)" },
    ["RAID"]                 = { zhTW="(團)",   zhCN="(团)" },
    ["RAID_LEADER"]          = { zhTW="(團長)", zhCN="(团长)" },
    ["RAID_WARNING"]         = { zhTW="(團警)", zhCN="(团警)" },
    ["INSTANCE_CHAT"]        = { zhTW="(副)",   zhCN="(副)" },
    ["INSTANCE_CHAT_LEADER"] = { zhTW="(副領)", zhCN="(副领)" },
    ["GUILD"]                = { zhTW="(會)",   zhCN="(会)" },
    ["OFFICER"]              = { zhTW="(官)",   zhCN="(官)" },
}
for k, v in pairs(ShortChannels) do
    if (_G["CHAT_"..k.."_GET"] and v[locale]) then
        _G["CHAT_"..k.."_GET"] = _G["CHAT_"..k.."_GET"]:gsub("%[.-%]", v[locale])
    end
end
-- CHANNEL簡寫 (BLIZ會處理%s-%s.*,只要保證arg4長度大於arg9)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", function(self, event, msg, fullname, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, guid, ...)
    if (arg8 and arg8 > 0) then
        arg4 = arg9.." - "
    end
    return false, msg, fullname, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, guid, ...
end)
]]

--[[

_G["CHAT_OFFICER_GET"] = _G["CHAT_OFFICER_GET"]:gsub("%[.-%]", "[官]")
print(_G["CHAT_CHANNEL_GET"])
local function func(self,event,msg,sender,language,channelString,target,flags,unknown1,channelNumber,chnnelName,unknown2,counter)

	-- message 
		-- The message thats received (string)
	-- sender 
		-- The sender's username. (string)
	-- language 
		-- The language the message is in. (string)
	-- channelString 
		-- The full name of the channel, including number. (string)
	-- target 
		-- The username of the target of the action. Not used by all events. (string)
	-- flags 
		-- The various chat flags. Like, DND or AFK. (string)
	-- unknown 
		-- This variable has an unkown purpose, although it may be some sort of internal channel id. That however is not confirmed. (number)
	-- channelNumber 
		-- The numeric ID of the channel. (number)
	-- channelName 
		-- The full name of the channel, does not include the number. (string)
	-- unknown 
		-- This variable has an unkown purpose although it always seems to be 0. (number)
	-- counter 
		-- This variable appears to be a counter of chat events that the client recieves. (number)
	-- if sender == UnitName("player") then
		-- print("message:"..msg)
		-- print("sender:"..sender)
		-- print("language:"..language)
		-- print("channelString:"..channelString)
		-- channelString = string.sub(channelString,1,6)
		-- print("channelString:"..channelString)
		
		-- print("target:"..target)
		-- print("flags:"..flags)
		-- print("unknown1:"..unknown1)
		-- print("channelNumber:"..channelNumber)
		-- print("channelName:"..channelName)
		-- print("unknown2:"..unknown2)
		-- print("counter:"..counter)
	-- end
	if (channelNumber and channelNumber>0)then
		channelString = channelName.." - "
	end
	-- return false,msg,sender,language,channelString,target,flags,unknown1,channelNumber,chnnelName,unknown2,counter
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",func)

]]

--[[
--精简公共频道 (true/false) (精简/不精简)
local ShortChannel = true

----==============================精简聊天频道,可修改汉字自定义==========================----
if (GetLocale() == "zhTW") then 
 --公会
  CHAT_GUILD_GET = "|Hchannel:GUILD|h[公會]|h %s: "
  CHAT_OFFICER_GET = "|Hchannel:OFFICER|h[官員]|h %s: "
    
  --团队
  CHAT_RAID_GET = "|Hchannel:RAID|h[團隊]|h %s: "
  CHAT_RAID_WARNING_GET = "[通知] %s: "
  CHAT_RAID_LEADER_GET = "|Hchannel:RAID|h[團長]|h %s: "
  
  --队伍
  CHAT_PARTY_GET = "|Hchannel:PARTY|h[隊伍]|h %s: "
  CHAT_PARTY_LEADER_GET =  "|Hchannel:PARTY|h[隊長]|h %s: "
  CHAT_PARTY_GUIDE_GET =  "|Hchannel:PARTY|h[向導]|h %s: "

  --战场
  CHAT_BATTLEGROUND_GET = "|Hchannel:BATTLEGROUND|h[戰場]|h %s: "
  CHAT_BATTLEGROUND_LEADER_GET = "|Hchannel:BATTLEGROUND|h[領袖]|h %s: "
  
  --说 / 喊
  CHAT_SAY_GET = "%s: "
  CHAT_YELL_GET = "%s: "  

  --密语
  CHAT_WHISPER_INFORM_GET = "發送給%s: "
  CHAT_WHISPER_GET = "%s悄悄話: "

  CHAT_FLAG_AFK = "[暫離] "
  CHAT_FLAG_DND = "[勿擾] "
  CHAT_FLAG_GM = "[GM] "

elseif (GetLocale() == "zhCN") then

 --公会
  CHAT_GUILD_GET = "|Hchannel:GUILD|h[公会]|h %s: "
  CHAT_OFFICER_GET = "|Hchannel:OFFICER|h[官员]|h %s: "
    
  --团队
  CHAT_RAID_GET = "|Hchannel:RAID|h[团队]|h %s: "
  CHAT_RAID_WARNING_GET = "[通知] %s: "
  CHAT_RAID_LEADER_GET = "|Hchannel:RAID|h[团长]|h %s: "
  
  --队伍
  CHAT_PARTY_GET = "|Hchannel:PARTY|h[队伍]|h %s: "
  CHAT_PARTY_LEADER_GET =  "|Hchannel:PARTY|h[队长]|h %s: "
  CHAT_PARTY_GUIDE_GET =  "|Hchannel:PARTY|h[向导]:|h %s: "

  --战场
  CHAT_BATTLEGROUND_GET = "|Hchannel:BATTLEGROUND|h[副本]|h %s: "
  CHAT_BATTLEGROUND_LEADER_GET = "|Hchannel:BATTLEGROUND|h[领袖]|h %s: "
  
  --密语  
  CHAT_WHISPER_INFORM_GET = "发送给%s: "
  CHAT_WHISPER_GET = "%s悄悄的说: "
  CHAT_BN_WHISPER_INFORM_GET = "发送给%s "
  CHAT_BN_WHISPER_GET = "悄悄的说%s "
  
  --说 / 喊
  CHAT_SAY_GET = "%s: "
  CHAT_YELL_GET = "%s: "  

  --flags
  CHAT_FLAG_AFK = "[暂离] "
  CHAT_FLAG_DND = "[勿扰] "
  CHAT_FLAG_GM = "[GM] "

else
  CHAT_GUILD_GET = "|Hchannel:GUILD|hG|h %s "
  CHAT_OFFICER_GET = "|Hchannel:OFFICER|hO|h %s "
  CHAT_RAID_GET = "|Hchannel:RAID|hR|h %s "
  CHAT_RAID_WARNING_GET = "RW %s "
  CHAT_RAID_LEADER_GET = "|Hchannel:RAID|hRL|h %s "
  CHAT_PARTY_GET = "|Hchannel:PARTY|hP|h %s "
  CHAT_PARTY_LEADER_GET =  "|Hchannel:PARTY|hPL|h %s "
  CHAT_PARTY_GUIDE_GET =  "|Hchannel:PARTY|hPG|h %s "
  CHAT_BATTLEGROUND_GET = "|Hchannel:BATTLEGROUND|hB|h %s "
  CHAT_BATTLEGROUND_LEADER_GET = "|Hchannel:BATTLEGROUND|hBL|h %s "  
  CHAT_WHISPER_INFORM_GET = "to %s "
  CHAT_WHISPER_GET = "from %s "
  CHAT_BN_WHISPER_INFORM_GET = "to %s "
  CHAT_BN_WHISPER_GET = "from %s "
  CHAT_SAY_GET = "%s "
  CHAT_YELL_GET = "%s "
  CHAT_FLAG_AFK = "[AFK] "
  CHAT_FLAG_DND = "[DND] "
  CHAT_FLAG_GM = "[GM] "
end

--================================公共频道和自定义频道精简================================--
local gsub = _G.string.gsub
local newAddMsg = {}
local chn, rplc
  if (GetLocale() == "zhCN") then  ---国服
	rplc = {
		"[%1综]",  
		"[%1交]",   
		"[%1防]",   
		"[%1组]",   
		"[%1守]",   
		"[%1招]",
		"[%1世]", 
		"[%1自定义]",    -- 自定义频道缩写请自行修改
	}

   elseif (GetLocale() == "zhTW") then  ---台服
       rplc = {
		"[%1綜合]",          
		"[%1貿易]",             
		"[%1防務]",             
		"[%1組隊]",            
		"[%1世界]",           
		"[%1招募]",
                "[%1世]",  
                "[%1自定义]",   -- 自定义频道缩写请自行修改
        }
        else
        
	rplc = {
		"[GEN]", 
		"[TR]", 
		"[WD]", 
		"[LD]", 
		"[LFG]", 
		"[GR]",
                "[BFC]", 
                "[CL]",      -- 英文缩写
	}
        end

	chn = {
		"%[%d+%. General.-%]",
		"%[%d+%. Trade.-%]",
		"%[%d+%. LocalDefense.-%]",
		"%[%d+%. LookingForGroup%]",
		"%[%d+%. WorldDefense%]",
		"%[%d+%. GuildRecruitment.-%]",
                "%[%d+%. BigFootChannel.-%]",
                "%[%d+%. CustomChannel.-%]",       -- 自定义频道英文名随便填写
	}

---------------------------------------- 国服 ---------------------------------------------
	local L = GetLocale()
	if L == "zhCN" then
		chn[1] = "%[%d+%. 综合.-%]"
		chn[2] = "%[%d+%. 交易.-%]"
		chn[3] = "%[%d+%. 本地防务.-%]"
		chn[4] = "%[%d+%. 寻求组队%]"
		chn[5] = "%[%d+%. 世界防务%]"	
		chn[6] = "%[%d+%. 公会招募.-%]"
        chn[7] = "%[%d+%. 大脚世界频道.-%]"
        chn[8] = "%[%d+%. 自定义频道.-%]"   -- 请修改频道名对应你游戏里的频道

---------------------------------------- 台服 ---------------------------------------------
        elseif L == "zhTW" then
		chn[1] = "%[%d+%. 綜合.-%]"
		chn[2] = "%[%d+%. 貿易.-%]"
	        chn[3] = "%[%d+%. 本地防務.-%]"
		chn[4] = "%[%d+%. 尋求組隊%]"
		chn[5] = "%[%d+%. 世界防務%]"
		chn[6] = "%[%d+%. 公會招募.-%]"
                chn[7] = "%[%d+%. 大脚世界频道.-%]"
                chn[8] = "%[%d+%. 自定义频道.-%]"   -- 请修改频道名对应你游戏里的频道
	else 
---------------------------------------- 英文 ----------------------------------------------- 
		chn[1] = "%[%d+%. General.-%]"
		chn[2] = "%[%d+%. Trade.-%]"
		chn[3] = "%[%d+%. LocalDefense.-%]"
		chn[4] = "%[%d+%. LookingForGroup%]"
		chn[5] = "%[%d+%. WorldDefense%]"
		chn[6] = "%[%d+%. GuildRecruitment.-%]"
                chn[7] = "%[%d+%. BigFootChannel.-%]"
                chn[8] = "%[%d+%. CustomChannel.-%]"   -- 自定义频道英文名随便填写

	end
local i = 0
local function AddMessage(frame, text, ...)
	--[[
	for i = 1, 8 do	 -- 对应上面几个频道(如果有9个频道就for i = 1, 9 do)
		text = gsub(text, chn[i], rplc[i])
	end
	]]
	-- print(text)
	-- print(text)
	text = gsub(text, "%[%d+%. 大脚世界频道.-%]", "[%1世界]")
	text = gsub(text, "%[(%d0?)%..-%]", "%1.") 
	-- print(text)
	i = i+1
	if i<3 then
		print(newAddMsg[frame:GetName()])
		i = 0
	end
	return newAddMsg[frame:GetName()](frame, text, ...)
end

if ShortChannel then
	for i = 1, 5 do
		if i ~= 2 then 
			local f = _G[format("%s%d", "ChatFrame", i)]
			-- print(format("%s%d", "ChatFrame", i))
			newAddMsg[format("%s%d", "ChatFrame", i)] = f.AddMessage
			f.AddMessage = AddMessage
			print(f.AddMessage)
		end
	end
end
]]