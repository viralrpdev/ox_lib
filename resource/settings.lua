-- Some users have locale set from ox_lib v2
if GetResourceKvpInt('reset_locale') ~= 1 then
    DeleteResourceKvp('locale')
    SetResourceKvpInt('reset_locale', 1)
end

---@generic T
---@param fn fun(key): unknown
---@param key string
---@param default? T
---@return T
local function safeGetKvp(fn, key, default)
    local ok, result = pcall(fn, key)

    if not ok then
        return DeleteResourceKvp(key)
    end

    return result or default
end

local settings = {
    notification_position = safeGetKvp(GetResourceKvpString, 'notification_position', 'top-right'),
    notification_audio = safeGetKvp(GetResourceKvpInt, 'notification_audio') == 1,
    locale = safeGetKvp(GetResourceKvpString, 'locale', 'en')
}

function settings.getNotificationSettings()
    return {
        notification_audio = settings.notification_audio,
        notification_position = settings.notification_position
    }
end

function settings.setNotificationAudio(value)
    if type(value) == 'boolean' then
        settings.notification_audio = value
        SetResourceKvpInt('notification_audio', value and 1 or 0)
    end
end

function settings.setNotificationPosition(value)
    if type(value) == 'string' then
        settings.notification_position = value
        SetResourceKvp('notification_position', value)
    end
end

exports('getNotificationSettings', settings.getNotificationSettings)
exports('setNotificationAudio', settings.setNotificationAudio)
exports('setNotificationPosition', settings.setNotificationPosition)

return settings
