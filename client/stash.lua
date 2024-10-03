local function createStashZones(stashData)
    local stashZones = {}
    for job, stashs in pairs(stashData) do
        for key, stash in ipairs(stashs) do
            local zoneName = generateZoneName('stash', job, key)
            local stashLabel = string.format("%s %s_%s", Lang:t('stash.open_stash'), job:gsub("^%l", string.upper), key)

            local zoneParams = {
                name = zoneName,
                heading = stash.heading,
                minZ = stash.minZ,
                maxZ = stash.maxZ,
                debugPoly = Config.debug
            }

            local options = {
                {
                    type = 'client',
                    event = 'togolo_lib:client:openStash',
                    icon = 'fas fa-ring',
                    label = stashLabel,
                    job = job,
                    args = {
                        stashName = zoneName,
                        stashOption = stash.option or nil
                    }
                }
            }

            local boxOptions = {
                options = options,
                distance = 1.5
            }

            local stashZone = exports['qb-target']:AddBoxZone(zoneName, stash.coords, stash.length, stash.width, zoneParams, boxOptions)
            table.insert(stashZones, stashZone.name)
        end
    end
    return stashZones
end

local function deleteStashZones(stashZonesName)
    for _, zoneName in ipairs(stashZonesName) do
        exports['qb-target']:RemoveZone(zoneName)
    end
end

RegisterNetEvent('togolo_lib:client:openStash', function(data)
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.args.stashName, data.args.stashOption)
    TriggerEvent('inventory:client:SetCurrentStash', data.args.stashName)
end)

exports('createStashZones', createStashZones)
exports('deleteStashZones', deleteStashZones)
