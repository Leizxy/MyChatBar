--[[
                            _ooOoo_    
                           88" . "88    
                           o8888888o    
                           (| -_- |)    
                            O\ = /O    
                        ____/`---'\____    
                      .   ' \\| |// `.    
                       / \\||| : |||// \    
                     / _||||| -:- |||||- \    
                       | | \\\ - /// | |    
                     | \_| ''\---/'' | |    
                      \ .-\__ `-` ___/-. /    
                   ___`. .' /--.--\ `. . __    
                ."" '< `.___\_<|>_/___.' >'"".    
               | | : `- \`.;`\ _ /`;.`/ - ` : | |    
                 \ \ `-. \_ __\ /__ _/ .-` / /    
         ======`-.____`-.___\_____/___.-`____.-'======    
                            `=---='    
    
         .............................................    
                  佛祖保佑             永无BUG   
          佛曰:    
                  写字楼里写字间，写字间里程序员；    
                  程序人员写程序，又拿程序换酒钱。    
                  酒醒只在网上坐，酒醉还来网下眠；    
                  酒醉酒醒日复日，网上网下年复年。    
                  但愿老死电脑间，不愿鞠躬老板前；    
                  奔驰宝马贵者趣，公交自行程序员。    
                  别人笑我忒疯癫，我笑自己命太贱；    
                  不见满街漂亮妹，哪个归得程序员？  
]]
local Addon = ...

local UIWidth,UIHeight = UIParent:GetWidth(),UIParent:GetHeight()
-- 各弹幕附着的Frame,其实可以考虑不需要这个,可以用来控制显示与否
local DanmuView = CreateFrame("Frame","DanmuView",UIParent)
DanmuView:SetSize(UIWidth,UIHeight/2)
DanmuView:SetPoint("BOTTOM",UIParent,"CENTER",0,0)
DanmuView:SetFrameStrata("BACKGROUND")

local DANMU_ALPHA = 0.8 -- 0 ~ 1.0
local DANMU_FONT_SIZE = 20
local FONT = {"Fonts\\ARHei.ttf",DANMU_FONT_SIZE,"OUTLINE"}
local DURATION = 25  -- 弹幕在显示区域划过的时间。建议20s以上
local COUNT_V = 10
local SHOW_DANMU = true -- 是否打开弹幕(再加上频道过滤？)
local MSG_FILTER = {
"大脚任务提示："
}

local function AddAnimToDanmu(frame)
	-- print("AddAnimToDanmu")
	frame.group = frame:CreateAnimationGroup(frame:GetName().."_group",nil)
	local translation = frame.group:CreateAnimation("Translation",frame:GetName().."_trans",nil)
	translation:SetDuration(DURATION)
	translation:SetOffset(-UIWidth-frame:GetWidth(),0)
	translation:SetTarget(frame.text)
	-- translation:SetStartDelay(0.5)
	translation:SetSmoothing("OUT")
	frame.group:SetLooping("NONE")
	frame.group:Play()
	frame:SetScript("OnUpdate",function(self,t)
		if translation:IsDone() then
			if frame ~= nil then
				table.remove(danmu,gsub(frame:GetName(),"danmu",""))
				table.remove(danmuText,gsub(frame:GetName(),"danmu",""))
			end
		end
	end)
end

local danmuText = {}
local danmu = {}

local function CreateDanmu(i,...)
	-- print("CreateDanmu")
	local r,g,b = select(1,...)
	danmu[i] = CreateFrame("Frame","danmu"..i,DanmuView)
	danmu[i]:SetFrameStrata("HIGH")
	danmu[i].text = danmu[i]:CreateFontString(nil,"OVERLAY")
	danmu[i].text:SetFont(unpack(FONT))
	danmu[i].text:SetText(danmuText[i])
	danmu[i].text:SetTextColor(r,g,b,DANMU_ALPHA)
	-- danmu[i].text:SetText("test")
	danmu[i]:SetAllPoints(danmu[i].text)
	danmu[i].text:SetPoint("TOPLEFT",DanmuView,"TOPRIGHT",0, -((i%COUNT_V == 0 and COUNT_V or i%COUNT_V)*40 + 50)) --坐标
	AddAnimToDanmu(danmu[i])
end
-- /dump _G["danmu1"]
-- /dump _G["GuildRosterContainerButton12String1"]:SetWidth(30)
-- OrderHallCommandBar
local function filter(text,tb)
	local boolean = true
	for i = 1, #tb do
		boolean = boolean and not strfind(text,tb[1])
	end
	return boolean
end

local ChatFrame1 = _G["ChatFrame1"]
local add = ChatFrame1.AddMessage
ChatFrame1.AddMessage = function(self,text,...)
	-- shortChannel
	if strfind(text, "大脚世界频道") then
		text = gsub(text, "%[%d+%. .?.?.?.?.?.?(.-).?.?.?.?.?.?%]","[%1]") -- [世界]
		-- text = gsub(text, "%[(.-)%. .?.?.?.?(.-).?.?.?.?%]","[%1.%2]") -- [1.世界]
	else
		text = gsub(text,"%d%. (.?.?.?).-%]","%1]")
		-- text = gsub(text, "%[%d+%. (.?.?.?).+%]","[%1]") -- [综]
		-- text = gsub(text, "%[%d+%. .+%]%[(.-)%]","[%1][%2]") -- [综]
		-- text = gsub(text, "%[(.-)%. (.?.?).+%]","[%1.%2]")) -- [1. 综]
	end
	if (select(1,...)) then
		if 
		strfind(text,"%[.-%].-说：") or -- SAY,WHISPER(from)
		strfind(text,"发送.-%[.-%]") or -- WHISPER(to)
		strfind(text,"%[.-%]喊：") or -- YELL
		strfind(text,"%[.-队.-%].-%[-.%]") or -- PARTY(LEADER),RAID(LEADER,WARNING)
		strfind(text,"%[公会%].-%[-.%]") or -- GUILD
		strfind(text,"%[官员%].-%[-.%]") -- OFFICER
		then
			if SHOW_DANMU 
			-- and not (strfind(text,"过滤条件"))
			-- and not (strfind(text,"大脚任务提示："))
			and filter(text,MSG_FILTER)
			then
				local i = 1
				-- i = i + 1
				-- test
				while danmu[i] == nil do
					i = i + 1
				end
				danmuText[i] = text
				CreateDanmu(i,...)
			end
		end
	end
	return add(self,text,...)
end


-- ChatFrame.lua
--[[

function Chat_GetColoredChatName(chatType, chatTarget)
	if ( chatType == "CHANNEL" ) then
		local info = ChatTypeInfo["CHANNEL"..chatTarget];
		local colorString = format("|cff%02x%02x%02x", info.r * 255, info.g * 255, info.b * 255);
		local chanNum, channelName = GetChannelName(chatTarget);
		return format("%s|Hchannel:channel:%d|h[%d. %s]|h|r", colorString, chanNum, chanNum, gsub(channelName, "%s%-%s.*", ""));
		--The gsub removes zone-specific markings (e.g. "General - Ironforge" to "General")
	elseif ( chatType == "WHISPER" ) then
		local info = ChatTypeInfo["WHISPER"];
		local colorString = format("|cff%02x%02x%02x", info.r * 255, info.g * 255, info.b * 255);
		return format("%s[%s] |Hplayer:%3$s|h[%3$s]|h|r", colorString, _G[chatType], chatTarget);
	else
		local info = ChatTypeInfo[chatType];
		local colorString = format("|cff%02x%02x%02x", info.r * 255, info.g * 255, info.b * 255);
		return format("%s|Hchannel:%s|h[%s]|h|r", colorString, chatType, _G[chatType]);
	end
end

]]