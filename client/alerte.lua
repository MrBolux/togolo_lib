RegisterNetEvent('togolo_lib:client:showAdvancedNotification', function (data)
    local params = data.params
    if params.global then
        params.global = nil
        TriggerServerEvent('togolo_lib:server:showAdvancedNotification', data)
        return
    end
    showAdvancedNotification(params.message, params.sender, params.subject, params.textureDict, params.iconType, params.color)
end)

-- iconTypes:  
-- 1 : Chat Box  
-- 2 : Email  
-- 3 : Add Friend Request  
-- 4 : Nothing  
-- 5 : Nothing  
-- 6 : Nothing  
-- 7 : Right Jumping Arrow  
-- 8 : RP Icon  
-- 9 : $ Icon 

function showAdvancedNotification(message, sender, subject, textureDict, iconType, color)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedNextPostBackgroundColor(color)
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, true, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(false, false)
end
exports('showAdvancedNotification', showAdvancedNotification)