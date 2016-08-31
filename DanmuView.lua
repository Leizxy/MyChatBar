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
-- DanmuView:SetFrameStrata("HIGH")


local FONT = {"Fonts\\ARHei.ttf",28,"OUTLINE"}
local DURATION = 5
local COUNT_V = 10

local function AddAnimToDanmu(frame)
	frame.group = frame:CreateAnimationGroup(frame:GetName().."_group",nil)
	local translation = frame.group:CreateAnimation("Translation",frame:GetName().."_trans",nil)
	translation:SetDuration(DURATION)
	translation:SetOffset(-UIWidth-frame:GetWidth(),0)
	translation:SetTarget(frame)
	translation:SetStartDelay(0.5)
	translation:SetSmoothing("IN")
	frame.group:SetLooping("NONE")
	frame.group:Play()
	if frame.group:IsDone() then
		
	end
end

local danmuText = {}
local danmu = {}

local function CreateDanmu(i)
	danmu[i] = CreateFrame("Frame","danmu"..i,DanmuView)
	danmu[i].text = danmu[i]:CreateFontString(nil,"OVERLAY")
	danmu[i].text:SetFont(unpack(FONT))
	danmu[i].text:SetText(danmuText[i])
	danmu[i]:SetAllPoints(danmu[i].text)
	danmu[i].text:SetPoint("TOPLEFT",DanmuView,"TOPRIGHT",0, (i%COUNT_V == 0 and 10 or i%COUNT_V)*40 + 50) --坐标
	AddAnimToDanmu(danmu[i])
end

local i = 1
local ChatFrame1 = _G["ChatFrame1"]
local add = ChatFrame1.AddMessage
ChatFrame1.AddMessage = function(self,text,...)
	if strfind(text,"说") then
		danmuText[i] = text
		CreateDanmu(i)
		i = i + 1
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
		return format("%s|Hchannel:channel:%d|h[%d. %s]|h|r", colorString, chanNum, chanNum, gsub(channelName, "%s%-%s.*", ""));	--The gsub removes zone-specific markings (e.g. "General - Ironforge" to "General")
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