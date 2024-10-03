local function createBossMenu(bossMenuData)
    local zoneBossMenus = {}

    for job, bossMenus in pairs(bossMenuData) do

        for key, bossMenu in ipairs(bossMenus) do
            local zoneName = generateZoneName('bossMenu', job, key)
            local zoneParams = {
                name = zoneName,
                heading = bossMenu.heading,
                minZ = bossMenu.minZ,
                maxZ = bossMenu.maxZ,
                debugPoly = Config.debug
            }
            local options = {
                {
                    type = 'client',
                    event = 'qb-bossmenu:client:OpenMenu',
                    icon = 'fas fa-ring',
                    label = Lang:t('bossMenu.open_bossMenu'),
                    job = job
                }
            }
            local boxOptions = {
                options = options,
                distance = 1.5
            }
            local zoneBossMenu = exports['qb-target']:AddBoxZone(zoneName, bossMenu.coords, bossMenu.length, bossMenu.width, zoneParams, boxOptions)
            table.insert(zoneBossMenus, zoneBossMenu.name)
        end
    end
    return zoneBossMenus
end

local function deleteBossMenu(zoneBossMenusName)
    for _, zoneName in ipairs(zoneBossMenusName) do
        exports['qb-target']:RemoveZone(zoneName)
    end
end

exports('createBossMenu', createBossMenu)
exports('deleteBossMenu', deleteBossMenu)
