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