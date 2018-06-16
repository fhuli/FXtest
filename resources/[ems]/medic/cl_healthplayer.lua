-- v2

-- Globals

local causesOfDeath = {
    ['WEAPON_BAT'] = 'DM_TK_MELEE1',
    ['WEAPON_GOLFCLUB'] = 'DM_TK_MELEE1',
    ['WEAPON_NIGHTSTICK'] = 'DM_TK_MELEE1',
    ['WEAPON_MOLOTOV'] = 'DM_TK_TORCH1',
    ['WEAPON_KNIFE'] = 'DM_TK_TORCH1',
    ['WEAPON_HATCHET'] = 'DM_TK_TORCH1',
    ['WEAPON_BOTTLE'] = 'DM_TK_TORCH1',
    ['WEAPON_HEAVYPISTOL'] = 'DM_TK_PISTOL1',
    ['WEAPON_PISTOL'] = 'DM_TK_PISTOL1',
    ['WEAPON_COMBATPISTOL'] = 'DM_TK_PISTOL1',
    ['WEAPON_SMG'] = 'DM_TK_SUB1',
    ['WEAPON_MUSKET'] = 'DM_TK_ARIFLE1',
    ['WEAPON_ASSAULTRIFLE'] = 'DM_TK_ARIFLE1',
    ['WEAPON_COMPACTRIFLE'] = 'DM_TK_ARIFLE1',
    ['WEAPON_BULLPUPRIFLE'] = 'DM_TK_ARIFLE1',
    ['WEAPON_COMBATMG'] = 'DM_TK_LIGHT1',
    ['WEAPON_ASSAULTSHOTGUN'] = 'DM_TK_SHOT1',
    ['WEAPON_PUMPSHOTGUN'] = 'DM_TK_SHOT1',
    ['WEAPON_SAWNOFFSHOTGUN'] = 'DM_TK_SHOT1',
    ['WEAPON_SNIPERRIFLE'] = 'DM_TK_SNIPE1',
    ['WEAPON_ASSAULTSNIPER'] = 'DM_TK_SNIPE1',
    ['WEAPON_REMOTESNIPER'] = 'DM_TK_SNIPE1',
    ['WEAPON_RPG'] = 'DM_TK_HEAVY1',
    ['WEAPON_HOMINGLAUNCHER'] = 'DM_TK_HEAVY1',
    ['WEAPON_FIREWORK'] = 'DM_TK_HEAVY1',
    ['WEAPON_MINIGUN'] = 'DM_TK_BOMB1',
    ['WEAPON_PROXMINE'] = 'DM_TK_BOMB1',
    ['WEAPON_STICKYBOMB'] = 'DM_TK_BOMB1',
    ['WEAPON_BZGAS'] = 'DM_TK_GAS1',
    ['VEHICLE_WEAPON_TANK'] = 'DM_TK_HEAVY1',
    ['VEHICLE_WEAPON_ROTORS'] = 'DM_TK_VEH1',
    ['WEAPON_RAMMED_BY_CAR'] = 'DM_TK_VK1',
}

local hospitals = {
    { 
        ['name'] = '', 
        ['location'] = {
            ['x'] = -496.06771850586, 
            ['y'] = -336.32788085938, 
            ['z'] = 34.501586900063
        }
    },
    { 
        ['name'] = '', 
        ['location'] = {
            ['x'] = 1839.7213134766, 
            ['y'] = 3672.633789000, 
            ['z'] = 34.276714324951 
        }
    },
    { 
        ['name'] = '', 
        ['location'] = {
            ['x'] = -242.03105163574, 
            ['y'] = 6326.5434570313, 
            ['z'] = 32.42618560791
        }
    },
    { 
        ['name'] = '', 
        ['location'] = {
            ['x'] = 359.5255737304, 
            ['y'] = -589.81384277344, 
            ['z'] = 28.803533554077
        }
    },
    { 
        ['name'] = '', 
        ['location'] = {
            ['x'] = 339.17660522461, 
            ['y'] = -1395.8211669922, 
            ['z'] = 32.509265899658
        }
    }
}

-- Globals --

-- Prices
local healPrice = 300
local reviveBasePrice = 2500
local revivePricePerMedic = 2500

-- Respawn
local respawnTime = nil
local respawnTimes = {}
local deathReason = 'DM_TICK1'

-- Bone
local healthCache = 200
local boneDamageCache = {}

-- Flags
local isDead = false
local medicCalled = false

-- Cache
local positionCache = nil

-- Other
local scaleform = nil

-- Helpers --

function getRespawnTime(id)
    if respawnTimes[GetPlayerServerId(id)] then
        return respawnTimes[GetPlayerServerId(id)].timeLeft
    end
end

function getLimboTime(id)
    if respawnTimes[GetPlayerServerId(id)] and respawnTimes[GetPlayerServerId(id)].limbo then
        return respawnTimes[GetPlayerServerId(id)].limbo
    end
end

function hasMiracleBeenAttempted(id)
    if respawnTimes[GetPlayerServerId(id)] and respawnTimes[GetPlayerServerId(id)].miracleAttempted then
        return respawnTimes[GetPlayerServerId(id)].miracleAttempted
    end

    return false
end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function sendNotification(msg)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(msg)
    DrawNotification(false, false)
end

function setPlayerKnockedOut(ped)
    sendNotification('You are knocked out!')
    SetPedToRagdoll(ped, 6000, 6000, 0, 0, 0, 0)
end

function getClosestMedicDistance()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped, 0)

    local closestMedic = nil

    for id = 0, 32 do
        if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= ped then
            for i, _ in pairs(exports.emergency:getMedics()) do
                local medicPed = GetPlayerPed(id)
                local medicPos = GetEntityCoords(medicPed, 0)
                local distanceToMedic = Vdist2(pos.x, pos.y, pos.z, medicPos.x, medicPos.y, medicPos.z)

                if not closestMedicDistance then
                    closestMedic = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, medicPos.x, medicPos.y, medicPos.z, true)
                elseif distanceToMedic < closestMedicDistance then
                    closestMedic = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, medicPos.x, medicPos.y, medicPos.z, true)
                end
            end
        end
    end

    return round(closestMedic, 1)
end

function getClosestHospital()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped, 0)

    local distanceToClosestHospital = nil
    local closestHospital = nil

    for _, hospital in pairs(hospitals) do
        local distanceToHospital = Vdist2(pos.x, pos.y, pos.z, hospital.location.x, hospital.location.y, hospital.location.z)
        
        if not closestHospital then
            closestHospital = hospital
            distanceToClosestHospital = distanceToHospital
        elseif distanceToHospital < distanceToClosestHospital then
            closestHospital = hospital
            distanceToHospital = distanceToHospital
        end
    end

    return closestHospital
end

function resurrectPlayer()
    healthCache = GetPedMaxHealth(GetPlayerPed(-1))
    boneDamageCache = {}
    isDead = false

    TriggerServerEvent("item:reset")
    TriggerServerEvent("clothes:spawn")
    TriggerServerEvent("jail:clearDirtyMoney")
    TriggerServerEvent('bank:withdrawAmende', 650)

    sendNotification('You paid $650 in medical charges.')

    -- Do not remove weapons from on duty medics and police officers.
    if not exports.police:getIsInService() and not exports.emergency:getIsInService() then
        RemoveAllPedWeapons(GetPlayerPed(-1), true)
        TriggerServerEvent("weaponshop:RemoveWeaponsFromPlayer")
    end

    exports.STRP:safeTeleport()

    local closestHospital = getClosestHospital()
    NetworkResurrectLocalPlayer(closestHospital.location.x, closestHospital.location.y, closestHospital.location.z, true, true, false)

    if IsEntityPlayingAnim(GetPlayerPed(-1), "mp_arresting", "idle", 3) then
        TriggerEvent("police:cuffGranted", GetPlayerServerId(PlayerId()), false)
    end
end

function onDeath(reason)
    Citizen.CreateThread(function()
        sendNotification('Press ~g~E~s~ to call a medic.')

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped, 0)
        local pedCauseOfDeath = GetPedCauseOfDeath(ped)

        local killer = nil
        local killerPed = GetPedKiller(ped)

        medicCalled = false -- reset state

        -- check if killed by player
        if IsPedAPlayer(killerPed) then
            killer = NetworkGetPlayerIndexFromPed(killerPed)
        end

        if killer == PlayerId() then
            deathReason = GetLabelText('DM_U_SUIC')
        elseif not killer then
            deathReason = GetLabelText('DM_TK_YD1')
        else 
            for weapon, reason in pairs(causesOfDeath) do
                if GetHashKey(weapon) == pedCauseOfDeath then
                    if killer then
                        deathReason = GetLabelText(reason):gsub("~a~", GetPlayerName(killer))
                    else
                        deathReason = GetLabelText(reason)
                    end
                    break
                end
            end
        end

        PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
        ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
        StartScreenEffect("DeathFailOut", 0, 0)

        while isDead do
            Citizen.Wait(0)

            local respawnTime = getRespawnTime(PlayerId())
            if respawnTime then
                if respawnTime > 0 then
                    local minutes = math.floor(tonumber(respawnTime) / 60)
                    local seconds = math.floor(tonumber(respawnTime) - (60 * minutes))

                    local timeLeft = minutes .. ':' .. seconds
                    if seconds < 10 and minutes < 10 then
                        timeLeft = '0' .. minutes .. ':0' .. seconds
                    elseif seconds < 10 then
                        timeLeft = minutes .. ':0' .. seconds
                    elseif minutes < 10 then
                        timeLeft = '0' .. minutes .. ':' .. seconds
                    end

                    drawTxt("You will bleed out in ~r~" .. timeLeft .. "~s~", 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)

                    local medicCount = exports.emergency:getMedicCount()
                    if medicCount > 0 then
                        drawTxt("There are ~r~" .. medicCount .. "~s~ medics on duty. (" .. getClosestMedicDistance() .. "m)", 0, 1, 0.5, 0.85, 0.6, 255, 255, 255, 255)
                    else
                        drawTxt("There are ~r~no~s~ medics on duty.", 0, 1, 0.5, 0.85, 0.6, 255, 255, 255, 255)
                    end
                else
                    local limboTime = getLimboTime(PlayerId())
                    if limboTime then
                        drawTxt("You have bled out. You will respawn at the nearest hospital in ~r~" .. limboTime .. "~s~ seconds.", 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
                    end
                end
            end

            if IsControlJustReleased(1, 38) and not medicCalled then
                if medicCount == 0 then
                     sendNotification("There are currently no medics available.")
                else
                    medicCalled = true
                    sendNotification("Medic dispatch has been notified.")
                    TriggerServerEvent('ems:call', reason, GetPlayerServerId(PlayerId()), pos.x, pos.y, pos.z)
                end
            end
        end

        StopScreenEffect("DeathFailOut")
    end)
end

-- Preload these.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if isDead then
            if not HasThisAdditionalTextLoaded("global", 100) then
                ClearAdditionalText(100, true)
                RequestAdditionalText("global", 100)
                while not HasThisAdditionalTextLoaded("global", 100) do
                    Citizen.Wait(0)
                end
            end
            
            if not HasNamedScaleformMovieLoaded("MP_BIG_MESSAGE_FREEMODE") then
                scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
                while not HasNamedScaleformMovieLoaded("MP_BIG_MESSAGE_FREEMODE") do
                    Citizen.Wait(0)
                end
            end

            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
            PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
            PushScaleformMovieFunctionParameterString(GetLabelText("RESPAWN_W"))
            PopScaleformMovieFunctionVoid()
        end
    end
end)

-- Event Handlers --

AddEventHandler('baseevents:onPlayerDied', function(killerType, coords)
    onDeath('An accident happened.')
end)

AddEventHandler('baseevents:onPlayerKilled', function(killerId, killerDetails)
    onDeath('A murder.')
end)

RegisterNetEvent('ems:syncRespawnTimes')
AddEventHandler('ems:syncRespawnTimes', function(payload)
    respawnTimes = payload

    if respawnTimes[GetPlayerServerId(PlayerId())] then
        respawnTime = respawnTimes[GetPlayerServerId(PlayerId())].timeLeft
    end
end)

RegisterNetEvent('ems:respawn')
AddEventHandler('ems:respawn', function()
    resurrectPlayer()
end)

RegisterNetEvent('ems:heal')
AddEventHandler('ems:heal', function()
    local ped = GetPlayerPed(-1)

    healthCache = GetPedMaxHealth(ped)
    boneDamageCache = {}

    SetEntityHealth(ped, GetPedMaxHealth(ped))
end)

RegisterNetEvent('ems:revive')
AddEventHandler('ems:revive', function()
    Citizen.CreateThread(function()
        local ped = GetPlayerPed(-1)

        if isDead then
            ResurrectPed(ped)
            SetEntityHealth(ped, GetPedMaxHealth(ped) / 3)
            ClearPedTasksImmediately(ped)
            
            healthCache = GetPedMaxHealth(ped)
            boneDamageCache = {}
            isDead = false

            StopScreenEffect('DeathFailOut')

            TriggerServerEvent('ems:clearDeath')
        end
    end)
end)


RegisterNetEvent('ems:medicDispatched')
AddEventHandler('ems:medicDispatched', function()
    if isDead then
        sendNotification("A medic has been dispatched to your location!")
    end
end)

-- Threads --

-- Hospital
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped, true)

        for _, hospital in pairs(hospitals) do
            local distanceFromHospital = Vdist2(pos.x, pos.y, pos.z, hospital.location.x, hospital.location.y, hospital.location.z)
            
            if distanceFromHospital < 100.0 then
                DrawMarker(1, hospital.location.x, hospital.location.y, hospital.location.z - 1, 0, 0, 0, 0, 0, 0, 3.0001, 3.0001, 1.5001, 255, 165, 0, 165, 0, 0, 0, 0)
            end

            if distanceFromHospital < 3.0 then
                if IsPedFatallyInjured(ped, true) or IsEntityDead(ped) then
                    local price = reviveBasePrice

                    if exports.emergency:getMedicCount() > 0 then
                        price = price + (exports.emergency:getMedicCount() * revivePricePerMedic)
                    end

                    drawTxt("Press ~r~E~s~ to receive emergency medical attention. The charge is $" .. price, 0, 1, 0.5, 0.74, 0.6, 255, 255, 255, 255)
                    
                    if IsControlJustReleased(1, 38) then
                        TriggerServerEvent('bank:withdrawAmende', price)
                        TriggerEvent('ems:revive')
                    end
                elseif GetEntityHealth(ped) < GetPedMaxHealth(ped) then
                    drawTxt("Press ~r~E~s~ to receive medical attention. The charge is $500.", 0, 1, 0.5, 0.74, 0.6, 255, 255, 255, 255)

                    if IsControlJustReleased(1, 38) then
                        boneDamageCache = {} -- reset bone damage
                        TriggerServerEvent('bank:withdrawAmende', 500)
                        SetEntityHealth(ped, GetPedMaxHealth(ped))
                    end
                end
            end
        end
    end
end)

-- Damage Handler
Citizen.CreateThread(function()
    local isKnockedOut = false

    while true do
        Citizen.Wait(0)

        local ped = GetPlayerPed(-1)

        if (healthCache > GetEntityHealth(ped)) then
            local _, bone = GetPedLastDamageBone(ped, 0);
            local damage = healthCache - GetEntityHealth(ped)
            healthCache = GetEntityHealth(ped)

            if bone then
                local entry = {
                    ['bone'] = bone,
                    ['damage'] = damage
                }

                table.insert(boneDamageCache, entry)
            end
        end

        if not isDead then
            if IsPedFatallyInjured(ped, true) then -- Player died
                isDead = true
                TriggerServerEvent('ems:playerDied', boneDamageCache)
            elseif not isKnockedOut and GetEntityHealth(ped) < 120 then -- Knocked out
                isKnockedOut = true
                setPlayerKnockedOut(ped)
            elseif isKnockedOut and (previousPos ~= currentPos or not IsPedRagdoll(ped)) then -- No longer knocked out
                isKnockedOut = false
            end
        end
    end
end)
