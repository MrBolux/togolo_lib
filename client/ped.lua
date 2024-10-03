local function createInteractPed(pedData)
    local pedModel = pedData.pedModel
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(0)
    end
    local ped = CreatePed(0, pedModel, pedData.coords.x, pedData.coords.y, pedData.coords.z - 1, pedData.coords.w, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    if pedData.animation then
        TaskStartScenarioInPlace(ped, pedData.animation, 0, true)
    end

    if pedData.options then
        local targetOptions = {
            options = pedData.options,
            distance = 1.5,
        }

        exports['qb-target']:AddTargetEntity(ped, targetOptions)
    end


    return ped
end

local function deleteInteractPed(ped)
    DeletePed(ped)
end

exports('createInteractPed', createInteractPed)
exports('deleteInteractPed', deleteInteractPed)