-- Créer via xsound
-- [voice]\xsound\server\exports

xSound = exports.xsound
-- xSound:setVolume(musicId, data.volume)
RegisterNetEvent('togolo_lib:client:boomBoxPlay', function(source, boomBoxId, data)
    xSound:PlayUrlPos(boomBoxId, data.link, data.volume, data.position)
end)


RegisterNetEvent('togolo_lib:client:OpenBoomBoxMenu', function()
    -- shownGangMenu = true
    -- shownBoomBoxMenu = true

    local boomBoxMenu = {
        {
            header = 'Cabine DJ',
            icon = 'fa-solid fa-circle-info',
            isMenuHeader = true,
        },
        {
            txt = 'Lancer une musique',
            icon = 'fa-solid fa-music',
            params = {
                event = 'togolo_lib:client:boomBoxPlay',
            }
        },
        {
            txt = 'Mettre la musique sur pause',
            icon = 'fa-solid fa-pause',
            params = {
                event = 'qb-gangmenu:client:HireMembers',
            }
        },
        {
            txt = 'Reprendre la musique',
            icon = 'fa-solid fa-play',
            params = {
                event = 'qb-gangmenu:client:Stash',
            }
        },
        {
            txt = 'Changer le volume',
            icon = 'fa-solid fa-volume-high',
            params = {
                event = 'qb-gangmenu:client:Warbobe',
            }
        },
        {
            txt = 'Arrêter la musique',
            icon = 'fa-solid fa-stop',
            params = {
                event = 'qb-gangmenu:client:Warbobe',
            }
        }
    }

    -- for _, v in pairs(DynamicMenuItems) do
    --     boomBoxMenu[#boomBoxMenu + 1] = v
    -- end

    boomBoxMenu[#boomBoxMenu + 1] = {
        header = Lang:t('bodygang.exit'),
        icon = 'fa-solid fa-angle-left',
        params = {
            event = 'qb-menu:closeMenu',
        }
    }

    exports['qb-menu']:openMenu(boomBoxMenu)
end)


local function createBoomBox(boomBoxData)
    local zoneBoomBoxs = {}
    for job, boomBoxs in pairs(boomBoxData) do
        for key, boomBox in ipairs(boomBoxs) do
            local zoneName = generateZoneName('boomBox', job, key)
            local zoneParams = {
                name = zoneName,
                heading = boomBox.heading,
                minZ = boomBox.minZ,
                maxZ = boomBox.maxZ,
                debugPoly = Config.debug
            }
            local options = {
                {
                    type = 'client',
                    event = 'togolo_lib:client:OpenBoomBoxMenu',
                    icon = 'fas fa-hand-paper',
                    label = Lang:t('boomBox.play'),
                    job = job
                }
            }
            local boxOptions = {
                options = options,
                distance = 1.5
            }
            local zoneBoomBox = exports['qb-target']:AddBoxZone(zoneName, boomBox.coords, boomBox.length, boomBox.width, zoneParams, boxOptions)
            table.insert(zoneBoomBoxs, zoneBoomBox.name)
        end
    end
    return zoneBoomBoxs
end

local function deleteBoomBox(zoneBoomBoxName)
    for _, zoneName in ipairs(zoneBoomBoxName) do
        exports['qb-target']:RemoveZone(zoneName)
    end
end

exports('createBoomBox', createBoomBox)
exports('deleteBoomBox', deleteBoomBox)