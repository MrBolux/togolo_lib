RegisterNetEvent('togolo_lib:server:showAdvancedNotification', function (data)
    TriggerClientEvent('togolo_lib:client:showAdvancedNotification', -1, data)
end)
