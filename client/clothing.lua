local function createClothingRoom(clothingRoomsZones, clothingRoomsOutfit)
    local zonesClothingRooms = {}
    for job, clothingRooms in pairs(clothingRoomsZones) do
        for key, room in ipairs(clothingRooms) do
            local zoneName = generateZoneName('clothingRoom', job, key)

            local zoneParams = {
                name = zoneName,
                heading = room.heading,
                minZ = room.minZ,
                maxZ = room.maxZ,
                debugPoly = Config.debug,
            }

            local options = {{
                action = function()
                    local playerPed = PlayerPedId()
                    local gradeLevel = PlayerData.job.grade.level
                    exports['qb-clothing']:getOutfits(gradeLevel, clothingRoomsOutfit[job])
                    SetEntityHeading(playerPed, GetEntityHeading(playerPed) + 180)
                end,
                icon = "fas fa-sign-in-alt",
                label = Lang:t("clothing.open_clothingRooms"),
                job = job
            }}

            local boxOptions = {
                options = options,
                distance = 1.5
            }

            local zoneClothingRoom = exports['qb-target']:AddBoxZone(zoneName, room.coords, room.length, room.width, zoneParams, boxOptions)
            table.insert(zonesClothingRooms, zoneClothingRoom.name)
        end
    end
    return zonesClothingRooms
end


local function deleteClothingRoom(zonesClothingRooms)
    for _, zoneName in ipairs(zonesClothingRooms) do
        exports['qb-target']:RemoveZone(zoneName)
    end
end

exports('createClothingRoom', createClothingRoom)
exports('deleteClothingRoom', deleteClothingRoom)

