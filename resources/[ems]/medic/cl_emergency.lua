-- locations

local stationGarage = {
    { x = 327.592, y = -1471.510, z = 29.774 }, -- innocence
    { x = 1137.0216064453, y = -1612.1114501953, z = 34.692546844482 }, -- st fiacre
    { x = 283.66897338867, y = -603.87176757813, z = 43.188522338867 }, -- pillbox
    { x = -475.28688964844, y = -354.18936157227, z = 34.263506317139 }, -- Mt Zonah / Carcer Way
    { x = 1803.2822265625, y = 3679.9753417969, z = 34.224262237549 }, -- Sandy Shores
    { x = -260.55755615234, y = 6340.5366210938, z = 32.329204559326 }, -- The Bay
}

local hospitals = {
    { x = 306.249, y = -1452.525, z = 29.968 }, -- innocence
    { x = 1153.9791259766, y = -1597.701171875, z = 34.692581176758 }, -- st fiacre
    { x = 295.75259399414, y = -605.18725585938, z = 43.317520141602 }, -- pillbox
    { x = -449.11901855469, y = -341.37609863281, z = 34.363506317139 }, -- Mt Zonah
    { x = 1814.3696289063, y = 3679.2353515625, z = 34.276592254639 }, -- Sandy Shores
    { x = -247.01954650879, y = 6331.5268554688, z = 32.426181793213 }, -- The Bay
}

-- Spawn
local playerSpawned = false
local receivedRankCheck = false

-- Globals
local isMedic = false
local medicRank = nil
local isInService = false
local medicVehicle = nil
local allMedicsInService = {}
local medicBlips = {}
local patientBlip = nil
local patient = nil

-- Helpers --

function getMedics()
    return allMedicsInService
end

function getIsInService()
    return isInService
end

function getMedicCount()
    local count = 0
    
    if allMedicsInService then
        for _, medicIsInService in pairs(allMedicsInService) do 
            if medicIsInService then
                count = count + 1
            end
        end
    end

    return count
end

function isPlayerAMedic(id)
    if allMedicsInService[id] then
        return true
    end

    return false
end

function displayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function sendNotification(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(false, false)
end

function getPlayers()
    local players = {}

    for i = 0, 32 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function createEmergency(x, y, z, player)
    patient = GetPlayerPed(GetPlayerFromServerId(player))
    
    if patientBlip then
        RemoveBlip(patientBlip)
    end

    patientBlip = AddBlipForEntity(patient)
    
    SetBlipSprite(patientBlip, 1)
    SetBlipColour(patientBlip, 81)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Patient")
    EndTextCommandSetBlipName(patientBlip)
    SetBlipAsShortRange(patientBlip, true)
    SetBlipRoute(patientBlip, true)

    sendNotification('A GPS marker has been placed on the map.')

    TriggerServerEvent('ems:medicDispatchedTo', player)
end

function clearMedicBlips()
    for _, blip in pairs(medicBlips) do
        RemoveBlip(blip)
    end

    medicBlips = {}
end

function takeService()
    if isMedic and not isInService then
        local ped = GetPlayerPed(-1)

        sendNotification('You are now on duty!')

        TriggerServerEvent('ems:startService')
        TriggerServerEvent("player:serviceOn", "medic")
        TriggerServerEvent("jobssystem:jobs", 11)
        
        if exports.clothing:isMale() then
            model = "s_m_m_paramedic_01"
        else
            model = "s_f_y_scrubs_01"
        end

        TriggerEvent("clothes:changemodel", model)
        SetPedRandomProps(ped)
        
        RemoveAllPedWeapons(GetPlayerPed(-1))
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_Flashlight"), true, true)
        -- GiveWeaponToPed(ped, GetHashKey("WEAPON_FIREEXTINGUISHER"), 2000, true, true)
        
        TriggerEvent("medic:updateGarage")

        isInService = true
    end
end

function stopService()
    if isInService then
        local ped = GetPlayerPed(-1)
        RemoveAllPedWeapons(ped)

        sendNotification('You are no longer on duty.')

        TriggerServerEvent("clothes:spawn")
        TriggerServerEvent('ems:stopService')
        TriggerServerEvent("player:serviceOff", "medic")
        TriggerServerEvent("jobssystem:jobs", 1)

        clearMedicBlips()

        isInService = false
    end
end

function enableMedicBlips()
    for k, blip in pairs(medicBlips) do
        RemoveBlip(blip)
    end

    medicBlips = {}

    for id = 0, 32 do
        if NetworkIsPlayerActive(id) then
            local ped = GetPlayerPed(id)
            
            if ped ~= GetPlayerPed(-1) then
                if allMedicsInService and GetPlayerServerId(id) and allMedicsInService[GetPlayerServerId(id)] then
                    local blip = GetBlipFromEntity(ped)

                    if not DoesBlipExist(blip) then
                        local newBlip = AddBlipForEntity(ped)
                        SetBlipSprite(newBlip, 1)
                        SetBlipColour(newBlip, 2)
                        Citizen.InvokeNative(0x5FBCA48327B914DF, newBlip, true)
                        HideNumberOnBlip(newBlip)
                        SetBlipNameToPlayerName(newBlip, id)
                        SetBlipScale(newBlip, 0.85)
                        SetBlipAlpha(newBlip, 255)

                        table.insert(medicBlips, newBlip)
                    else
                        local blipSprite = GetBlipSprite(blip)

                        if blipSprite ~= 1 then
                            SetBlipSprite(blip, 1)
                            SetBlipColour(blip, 2)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                        end

                        HideNumberOnBlip(blip)
                        SetBlipNameToPlayerName(blip, id)
                        SetBlipScale(blip, 0.85)
                        SetBlipAlpha(blip, 255)

                        table.insert(medicBlips, blip)
                    end
                end
            end 
        end
    end
end

function getClosestPlayerToPed(ped)
    local pos = GetEntityCoords(ped, 0)
    
    local closestDistance = -1
    local closestPlayer = -1

    for id = 0, 32 do
        if NetworkIsPlayerActive(id) then
            local targetPed = GetPlayerPed(id)

            if targetPed ~= ped then
                local targetPos = GetEntityCoords(targetPed, 0)
                local distance = Vdist2(pos.x, pos.y, pos.z, targetPos.x, targetPos.y, targetPos.z)
                if closestDistance == -1 or closestDistance > distance then
                    closestPlayer = id
                    closestDistance = distance
                end
            end
        end
    end

    return closestPlayer, closestDistance
end

function takeNetworkControl(entity, cb)
    Citizen.CreateThread(function()
        SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)

        if not NetworkHasControlOfEntity(entity) then
            NetworkRequestControlOfEntity(entity)

            while not NetworkHasControlOfEntity(entity) do
                Citizen.Wait(1)
            end
        end

        if NetworkHasControlOfEntity(entity) then
            cb(entity)
        end
    end)
end

function getPlayerServerIdFromPed(ped)
    local playerServerId = nil
    
    local players = getPlayers()
    for _, id in pairs(players) do
        local target = GetPlayerPed(id)

        if target == ped then
            playerServerId = id
            break
        end
    end

    return playerServerId
end

-- Threads --

-- Start/Stop + Garage
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if isMedic then
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped, 0)

            for _, location in pairs(hospitals) do
                local distance = Vdist2(pos.x, pos.y, pos.z, location.x, location.y, location.z)

                if distance < 30 then
                    DrawMarker(1, location.x, location.y, location.z - 1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 165, 0, 165, 0, 0, 2, 0, 0, 0, 0)

                    if distance < 3 then
                        if isInService then
                            displayHelpText('Press ~g~E~s~ to go off duty.')

                            if IsControlJustPressed(1, 51) then
                                stopService()
                            end
                        else
                            displayHelpText('Press ~g~E~s~ to go on duty.')

                            if IsControlJustPressed(1, 51) then
                                takeService()
                            end
                        end
                    end
                end
            end

            if isInService then
                for _, location in pairs(stationGarage) do
                    local distance = Vdist2(pos.x, pos.y, pos.z, location.x, location.y, location.z)

                    if distance < 30 then
                        DrawMarker(1, location.x, location.y, location.z - 1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 165, 0, 165, 0, 0, 2, 0, 0, 0, 0)

                        if distance < 3 then
                            if not medicVehicle then
                                displayHelpText('Press ~g~E~s~ to pull out a vehicle.')
                            elseif DoesEntityExist(medicVehicle) then
                                displayHelpText('Press ~g~E~s~ to put this vehicle away or ~g~Y~s~ to repair it.')
                            end

                             if IsControlJustPressed(1, 51) then
                                if medicVehicle and DoesEntityExist(medicVehicle) then
                                    takeNetworkControl(medicVehicle, function(medicVehicle)
                                        SetEntityAsMissionEntity(medicVehicle, true, true)
                                        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(medicVehicle))
                                        medicVehicle = nil
                                    end)
                                else
                                    OpenMVeh()
                                end
                            elseif IsControlJustPressed(1, 246) then
                                SetVehicleEngineHealth(medicVehicle, 949)
                                SetVehicleFixed(medicVehicle)
                                SetVehicleUndriveable(medicVehicle, false)
                                SetVehicleDeformationFixed(medicVehicle)
                                SetVehicleEngineOn(medicVehicle, true, false, true)
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Revive + Treat
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if isMedic and isInService then
            local ped = GetPlayerPed(-1)

            if not IsPedFatallyInjured(ped, true) and not IsPedInAnyVehicle(ped, true) then -- can't do this while dead or in a vehicle
                local closestPlayer, closestDistance = getClosestPlayerToPed(ped)

                if closestPlayer >= 0 and closestDistance >= 0 then
                    local closestPed = GetPlayerPed(closestPlayer)

                    if closestDistance >= 3 and closestDistance <= 50  then
                        if IsPedFatallyInjured(closestPed, true) and not IsPedInAnyVehicle(ped, true) then
                            drawTxt('Press ~g~E~s~ to find the patient.', 0, 1, 0.5, 0.90, 0.6, 255, 255, 255, 255)

                            if IsControlJustPressed(1, 86) then
                                TriggerServerEvent('ems:find', GetPlayerServerId(closestPlayer))
                            end
                        end
                    end

                    if closestDistance <= 3 and IsPedFacingPed(ped, closestPed, 45.0) and not IsPedInAnyVehicle(closestPed) then
                        if not IsPedFatallyInjured(closestPed, true) and GetEntityHealth(closestPed) < GetPedMaxHealth(closestPed) then
                            drawTxt('Press ~g~E~s~ to apply bandages to the patient.', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)

                            if IsControlJustPressed(1, 86) then
                                TaskStartScenarioInPlace(ped, "CODE_HUMAN_MEDIC_KNEEL", 0, true);
                                Citizen.Wait(7000)
                                ClearPedTasksImmediately(ped)
                                TriggerServerEvent("ems:heal", GetPlayerServerId(closestPlayer))
                            end
                        elseif IsPedFatallyInjured(closestPed, true) then
                            local respawnTime = exports.emergency:getRespawnTime(closestPlayer)
                            if respawnTime and respawnTime > 0 then
                                drawTxt('Press ~g~Y~s~ to resuscitate the patient.', 0, 1, 0.5, 0.85, 0.6, 255, 255, 255, 255)
                                drawTxt('Press ~g~U~s~ to stabilize the patient.', 0, 1, 0.5, 0.90, 0.6, 255, 255, 255, 255)

                                if IsControlJustReleased(1, 246) then
                                    TriggerServerEvent('ems:beginRevive', GetPlayerServerId(closestPlayer))
                                    TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                                    Citizen.Wait(24000)
                                    ClearPedTasks(ped)

                                    if not IsPedFatallyInjured(ped, true) then -- prevent medics from reviving if killed during revive
                                        TriggerServerEvent('ems:revive', GetPlayerServerId(closestPlayer))
                                    end
                                end

                                if IsControlJustReleased(1, 303) then
                                    TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                                    Citizen.Wait(1000)
                                    ClearPedTasks(ped)
                                    TriggerServerEvent('ems:stabilize', GetPlayerServerId(closestPlayer), 300) -- medic stabilize adds 5 minutes
                                end
                            elseif not exports.emergency:hasMiracleBeenAttempted(closestPlayer) then
                                drawTxt('Press ~g~Y~s~ to attempt a miracle.', 0, 1, 0.5, 0.85, 0.6, 255, 255, 255, 255)

                                if IsControlJustReleased(1, 246) then
                                    TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                                    Citizen.Wait(1000)
                                    ClearPedTasks(ped)
                                    TriggerServerEvent('ems:miracle', GetPlayerServerId(closestPlayer))
                                end
                            end
                        end
                    end
                end
            end

            -- Clear patient if no longer dead
            if patient then
                if not IsPedFatallyInjured(patient, true) then
                    patient = nil
                    RemoveBlip(patientBlip)
                end
            end
        end
    end
end)

-- Helicopter Spawn
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if isMedic and isInService then
            DrawMarker(1, 313.304, -1465.152, 45.50952911377, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 0, 155, 255, 200, 0, 0, 0, 0)
            
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped, 0)

            if Vdist2(pos.x, pos.y, pos.z, 313.304, -1465.152, 46.50952911377) < 5 then
                if medicVehicle then
                    displayHelpText('Press ~INPUT_CONTEXT~ to store ~b~your ~b~helicopter', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
                else
                    displayHelpText('Press ~INPUT_CONTEXT~ to pull a helicopter out', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
                end

                if IsControlJustPressed(1, 51) then
                    if medicVehicle then
                        SetEntityAsMissionEntity(medicVehicle, true, true)
                        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(medicVehicle))
                        medicVehicle = nil
                    else
                        local helicopter = GetHashKey("polmav")

                        RequestModel(helicopter)
                        while not HasModelLoaded(helicopter) do
                            Citizen.Wait(0)
                        end

                        medicVehicle = CreateVehicle(helicopter, pos.x, pos.y, pos.z, 90.0, true, false)
                        
                        local id = NetworkGetNetworkIdFromEntity(medicVehicle)
                        SetNetworkIdCanMigrate(id, true)
                        TaskWarpPedIntoVehicle(ped, medicVehicle, -1)
                        exports.vehicleManager:giveVehicleKeys(GetVehicleNumberPlateText(medicVehicle), GetEntityModel(medicVehicle))
                        SetVehicleLivery(medicVehicle, 1) -- medic skin
                    end
                end
            end
        end
    end
end)

-- Pull From Vehicle
-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
        
--         if isMedic and isInService then
--             local ped = GetPlayerPed(-1)
--             local from = GetEntityCoords(ped, 0)
--             local to = GetOffsetFromEntityInWorldCoords(ped, 0.0, 3.0, 0.0)
--             local rayHandle = CastRayPointToPoint(from.x, from.y, from.z, to.x, to.y, to.z, 10, ped, 0)
--             local _, _, _, _, vehicle = GetRaycastResult(rayHandle)

--             if vehicle and DoesEntityExist(vehicle) then
--                 for seat = -1, GetVehicleMaxNumberOfPassengers(vehicle) do
--                     if not IsVehicleSeatFree(vehicle, seat) then
--                         local pedInSeat = GetPedInVehicleSeat(vehicle, seat)
--                         local pedInSeatServerId = getPlayerServerIdFromPed(pedInSeat)

--                         if pedInSeatServerId and pedInSeatServerId > 0 and IsPedFatallyInjured(pedInSeat, true) then
--                             drawTxt('Press ~g~E~s~ to pull this person out of the vehicle.', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)

--                             if IsControlJustPressed(1, 86) then
--                                 TriggerServerEvent('ems:unseat', pedInSeatServerId)
--                             end
--                         end
--                     end
--                 end
--             end
--         end
--     end
-- end)

-- Sync in service medics
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000) -- Let's run this every 30 seconds

        TriggerServerEvent('ems:getInServiceMedics')
    end
end)

RegisterNetEvent('ems:medivVehicle')
AddEventHandler('ems:medicVehicle', function(vehicle)
    medicVehicle = vehicle
end)

RegisterNetEvent('ems:hired')
AddEventHandler('ems:hired', function()
    isMedic = true
end)

RegisterNetEvent('ems:fired')
AddEventHandler('ems:fired', function()
    isMedic = false

    stopService()

    if medicVehicle and DoesEntityExist(medicVehicle) then
        takeNetworkControl(medicVehicle, function(medicVehicle)
            SetEntityAsMissionEntity(medicVehicle, true, true)
            Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(medicVehicle))
            medicVehicle = nil
        end)
    end
end)

RegisterNetEvent('ems:allMedicsInService')
AddEventHandler('ems:allMedicsInService', function(medics)
    allMedicsInService = medics

    if (isMedic and isInService) or exports.police:getIsInService() then
        enableMedicBlips()
    else
        clearMedicBlips()
    end
end)

RegisterNetEvent('ems:impound')
AddEventHandler('ems:impound', function()
    if isMedic and isInService then
        exports.police:RequestImpound()
    end
end)

RegisterNetEvent('ems:dispatch')
AddEventHandler('ems:dispatch', function(reason, idPlayerInComa, x, y, z, sourcePlayerInComa)
    local serverId = GetPlayerServerId(PlayerId())
    local inComa = false

    if idPlayerInComa == serverId then
        inComa = true
    end

    if isMedic and isInService and not inComa then -- can't answer your own calls silly
        Citizen.CreateThread(function()
            local receivedCallAt = GetGameTimer()
            local hasResponded = false

            sendNotification('<b>~r~EMERGENCY~s~ <br /><br />~b~Message~s~: </b>' .. reason)
            sendNotification('<b>Press ~g~Y~s~ to take the call</b>')

            while not hasResponded do
                Citizen.Wait(0)
                notificationInProgress = true

                if GetTimeDifference(GetGameTimer(), receivedCallAt) > 15000 then
                    sendNotification('<b>~r~EMERGENCY~s~ <br /><br />Warning, the previous call has expired.</b>')
                    break
                end

                if IsControlPressed(1, 246) then
                    TriggerServerEvent('ems:takeCall', idPlayerInComa, x, y, z, sourcePlayerInComa)
                    break
                end
            end
        end)
    end
end)

RegisterNetEvent('ems:callTaken')
AddEventHandler('ems:callTaken', function(medicServerId, idPlayerInComa, x, y, z, sourcePlayerInComa)
    local playerServerId = GetPlayerServerId(PlayerId())

    if isMedic and isInService then
        sendNotification('The call has been taken by ~b~' .. exports['character']:getCharacterName(medicServerId) .. '~s~')
    end

    if playerServerId == medicServerId then
        createEmergency(x, y, z, sourcePlayerInComa)
    end
end)

AddEventHandler("playerSpawned", function()
    playerSpawned = true
end)

RegisterNetEvent('ems:medicRank')
AddEventHandler('ems:medicRank', function(rank)
    receivedRankCheck = true

    if rank then
        isMedic = true
        medicRank = rank
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        
        if playerSpawned and not receivedRankCheck then
            Citizen.Trace("Checking for medic rank...")
            TriggerServerEvent("ems:medicCheck")
        elseif receivedRankCheck then
           break
        end
    end
end)