local function createDutyPed(pedsData)
    local dutyPeds = {}

    for job, pedData in pairs(pedsData) do
        local pedModel = pedData.pedModel
        RequestModel(pedModel)
        while not HasModelLoaded(pedModel) do
            Wait(0)
        end
        local ped = CreatePed(0, pedModel, pedData.coords.x, pedData.coords.y, pedData.coords.z - 1, pedData.coords.w, false, false)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

        local options = {
            {
                type = 'client',
                event = 'togolo_lib:client:ToggleDuty',
                icon = 'fas fa-sign-in-alt',
                label = Lang:t('duty.sign_in'),
                job = job,
            }
        }

        local targetOptions = {
            options = options,
            distance = 1.5,
        }

        exports['qb-target']:AddTargetEntity(ped, targetOptions)
        table.insert(dutyPeds, ped)
    end

    return dutyPeds
end

local function deleteDutyPed(peds)
    for _, pedId in ipairs(peds) do
        DeletePed(pedId)
    end
end

RegisterNetEvent('togolo_lib:client:ToggleDuty', function()
    TriggerServerEvent('QBCore:ToggleDuty')
end)

exports('createDutyPed', createDutyPed)
exports('deleteDutyPed', deleteDutyPed)

-- Use SpawnPed next update
-- CreateThread(function()
--     for job, duty in pairs(Config.duty) do
--         local pedId = exports['qb-target']:SpawnPed({
--             model = duty.pedModel, 
--             coords = duty.coords, 
--             minusOne = true, 
--             freeze = true,
--             invincible = true, 
--             blockevents = true, 
--             target = {
--                 useModel = true,
--                 options = {
--                     {                    
--                         type = 'server',
--                         event = 'QBCore:ToggleDuty',
--                         icon = 'fas fa-sign-in-alt',
--                         label = Lang:t('duty.sign_in'),
--                         job = job,
--                     }
--                 },
--                 distance = 2.5, 
--             },
--             spawnNow = true,
--         })

--         print(json.encode(pedId))
--         table.insert(dutyPed, pedId)
--     end
-- end)