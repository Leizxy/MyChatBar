--[[local locale = GetLocale()

local ShortChannels = {
    ["PARTY"]                = { zhTW="(�)",   zhCN="(��)" },
    ["PARTY_LEADER"]         = { zhTW="(��L)", zhCN="(�ӳ�)" },
    ["PARTY_GUIDE"]          = { zhTW="(��I)", zhCN="(����)" },
    ["RAID"]                 = { zhTW="(�F)",   zhCN="(��)" },
    ["RAID_LEADER"]          = { zhTW="(�F�L)", zhCN="(�ų�)" },
    ["RAID_WARNING"]         = { zhTW="(�F��)", zhCN="(�ž�)" },
    ["INSTANCE_CHAT"]        = { zhTW="(��)",   zhCN="(��)" },
    ["INSTANCE_CHAT_LEADER"] = { zhTW="(���I)", zhCN="(����)" },
    ["GUILD"]                = { zhTW="(��)",   zhCN="(��)" },
    ["OFFICER"]              = { zhTW="(��)",   zhCN="(��)" },
}
for k, v in pairs(ShortChannels) do
    if (_G["CHAT_"..k.."_GET"] and v[locale]) then
        _G["CHAT_"..k.."_GET"] = _G["CHAT_"..k.."_GET"]:gsub("%[.-%]", v[locale])
    end
end
-- CHANNEL���� (BLIZ��̎��%s-%s.*,ֻҪ���Carg4�L�ȴ��arg9)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", function(self, event, msg, fullname, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, guid, ...)
    if (arg8 and arg8 > 0) then
        arg4 = arg9.." - "
    end
    return false, msg, fullname, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, guid, ...
end)
]]