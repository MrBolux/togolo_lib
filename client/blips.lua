local function createBlips(blipData, options)
    local createdBlips = {}

    if options then
        if options.job == PlayerData.job.name:lower() or options.gang == PlayerData.gang.name:lower() or options.player == PlayerData.source then
            for name, data in pairs(blipData) do
                local blip = AddBlipForCoord(data.coords)
                SetBlipSprite(blip, data.sprite)
                SetBlipAsShortRange(blip, true)
                SetBlipScale(blip, data.scale)
                SetBlipColour(blip, data.color)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName(name)
                EndTextCommandSetBlipName(blip)

                table.insert(createdBlips, blip)
            end
        end
    else
        for name, data in pairs(blipData) do
            local blip = AddBlipForCoord(data.coords)
            SetBlipSprite(blip, data.sprite)
            SetBlipAsShortRange(blip, true)
            SetBlipScale(blip, data.scale)
            SetBlipColour(blip, data.color)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(name)
            EndTextCommandSetBlipName(blip)

            table.insert(createdBlips, blip)
        end
    end

    return createdBlips
end

local function createBlip(blipData, options)
    local blip = nil
    if options then
        if options.job == PlayerData.job.name:lower() or options.gang == PlayerData.gang.name:lower() or options.player == PlayerData.source then
            blip = AddBlipForCoord(blipData.coords)
            SetBlipSprite(blip, blipData.sprite)
            SetBlipAsShortRange(blip, true)
            SetBlipScale(blip, blipData.scale)
            SetBlipColour(blip, blipData.color)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(blipData.label)
            EndTextCommandSetBlipName(blip)
        end
        if options.route then
            SetBlipRoute(blip, true)
            if options.routeColor then
                SetBlipRouteColour(blip, options.routeColor)
            end
        end
    else
        blip = AddBlipForCoord(blipData.coords)
        SetBlipSprite(blip, blipData.sprite)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, blipData.scale)
        SetBlipColour(blip, blipData.color)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(blipData.label)
        EndTextCommandSetBlipName(blip)
    end
    return blip
end

local function deleteBlips(blipData)
    for _, blip in ipairs(blipData) do
        RemoveBlip(blip)
    end
end

local function deleteBlip(blip)
    RemoveBlip(blip)
end

exports('createBlips', createBlips)
exports('createBlip', createBlip)

exports('deleteBlips', deleteBlips)
exports('deleteBlip', deleteBlip)
