-- Regions!
local regions = {
    ['head'] = {
        ['impact'] = 0.50,
        ['text'] = 'Head',
    },
    ['chest'] = {
        ['impact'] = 0.075,
        ['text'] = 'Chest',
    },
     ['arm'] = {
        ['impact'] = 0.05,
        ['text'] = 'Arm',
    },
    ['leg'] = {
        ['impact'] = 0.05,
        ['text'] = 'Leg',
    },
}

-- Bones!
local bones = {
    [0] = {
        ['name'] = 'SKEL_ROOT',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = '',
    },
    [11816] = {
        ['name'] = 'SKEL_Pelvis',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [58271] = {
        ['name'] = 'SKEL_L_Thigh',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [63931] = {
        ['name'] = 'SKEL_L_Calf',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [14201] = {
        ['name'] = 'SKEL_L_Foot',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [2108] = {
        ['name'] = 'SKEL_L_Toe0',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [65245] = {
        ['name'] = 'IK_L_Foot',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [57717] = {
        ['name'] = 'PH_L_Foot',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [46078] = {
        ['name'] = 'MH_L_Knee',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [51826] = {
        ['name'] = 'SKEL_R_Thigh',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [36864] = {
        ['name'] = 'SKEL_R_Calf',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [52301] = {
        ['name'] = 'SKEL_R_Foot',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [20781] = {
        ['name'] = 'SKEL_R_Toe0',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [35502] = {
        ['name'] = 'IK_R_Foot',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [24806] = {
        ['name'] = 'PH_R_Foot',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [16335] = {
        ['name'] = 'MH_R_Knee',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [23639] = {
        ['name'] = 'RB_L_ThighRoll',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [6442] = {
        ['name'] = 'RB_R_ThighRoll',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'leg',
    },
    [57597] = {
        ['name'] = 'SKEL_Spine_Root',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'chest',
    },
    [23553] = {
        ['name'] = 'SKEL_Spine0',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'chest',
    },
    [24816] = {
        ['name'] = 'SKEL_Spine1',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'chest',
    },
    [24817] = {
        ['name'] = 'SKEL_Spine2',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'chest',
    },
    [24818] = {
        ['name'] = 'SKEL_Spine3',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'chest',
    },
    [64729] = {
        ['name'] = 'SKEL_L_Clavicle',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'chest',
    },
    [45509] = {
        ['name'] = 'SKEL_L_UpperArm',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [61163] = {
        ['name'] = 'SKEL_L_Forearm',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [18905] = {
        ['name'] = 'SKEL_L_Hand',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [26610] = {
        ['name'] = 'SKEL_L_Finger00',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [4089] = {
        ['name'] = 'SKEL_L_Finger01',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [4090] = {
        ['name'] = 'SKEL_L_Finger02',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [26611] = {
        ['name'] = 'SKEL_L_Finger10',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [4169] = {
        ['name'] = 'SKEL_L_Finger11',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [4170] = {
        ['name'] = 'SKEL_L_Finger12',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [26612] = {
        ['name'] = 'SKEL_L_Finger20',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [4185] = {
        ['name'] = 'SKEL_L_Finger21',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [4186] = {
        ['name'] = 'SKEL_L_Finger22',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [26613] = {
        ['name'] = 'SKEL_L_Finger30',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [4137] = {
        ['name'] = 'SKEL_L_Finger31',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [4138] = {
        ['name'] = 'SKEL_L_Finger32',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [26614] = {
        ['name'] = 'SKEL_L_Finger40',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [4153] = {
        ['name'] = 'SKEL_L_Finger41',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [4154] = {
        ['name'] = 'SKEL_L_Finger42',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [60309] = {
        ['name'] = 'PH_L_Hand',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [36029] = {
        ['name'] = 'IK_L_Hand',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [61007] = {
        ['name'] = 'RB_L_ForeArmRoll',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [5232] = {
        ['name'] = 'RB_L_ArmRoll',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [22711] = {
        ['name'] = 'MH_L_Elbow',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [10706] = {
        ['name'] = 'SKEL_R_Clavicle',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'chest',
    },
    [40269] = {
        ['name'] = 'SKEL_R_UpperArm',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [28252] = {
        ['name'] = 'SKEL_R_Forearm',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [57005] = {
        ['name'] = 'SKEL_R_Hand',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [58866] = {
        ['name'] = 'SKEL_R_Finger00',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [64016] = {
        ['name'] = 'SKEL_R_Finger01',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [64017] = {
        ['name'] = 'SKEL_R_Finger02',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [58867] = {
        ['name'] = 'SKEL_R_Finger10',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [64096] = {
        ['name'] = 'SKEL_R_Finger11',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [64097] = {
        ['name'] = 'SKEL_R_Finger12',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [58868] = {
        ['name'] = 'SKEL_R_Finger20',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [64112] = {
        ['name'] = 'SKEL_R_Finger21',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [64113] = {
        ['name'] = 'SKEL_R_Finger22',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [58869] = {
        ['name'] = 'SKEL_R_Finger30',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [64064] = {
        ['name'] = 'SKEL_R_Finger31',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [64065] = {
        ['name'] = 'SKEL_R_Finger32',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [58870] = {
        ['name'] = 'SKEL_R_Finger40',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [64080] = {
        ['name'] = 'SKEL_R_Finger41',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [64081] = {
        ['name'] = 'SKEL_R_Finger42',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [28422] = {
        ['name'] = 'PH_R_Hand',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [6286] = {
        ['name'] = 'IK_R_Hand',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [43810] = {
        ['name'] = 'RB_R_ForeArmRoll',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [37119] = {
        ['name'] = 'RB_R_ArmRoll',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [2992] = {
        ['name'] = 'MH_R_Elbow',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'arm',
    },
    [39317] = {
        ['name'] = 'SKEL_Neck_1',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [31086] = {
        ['name'] = 'SKEL_Head',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [12844] = {
        ['name'] = 'IK_Head',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [65068] = {
        ['name'] = 'FACIAL_facialRoot',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [58331] = {
        ['name'] = 'FB_L_Brow_Out_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [45750] = {
        ['name'] = 'FB_L_Lid_Upper_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [25260] = {
        ['name'] = 'FB_L_Eye_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [21550] = {
        ['name'] = 'FB_L_CheekBone_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [29868] = {
        ['name'] = 'FB_L_Lip_Corner_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [43536] = {
        ['name'] = 'FB_R_Lid_Upper_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [27474] = {
        ['name'] = 'FB_R_Eye_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [19336] = {
        ['name'] = 'FB_R_CheekBone_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [1356] = {
        ['name'] = 'FB_R_Brow_Out_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [11174] = {
        ['name'] = 'FB_R_Lip_Corner_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [37193] = {
        ['name'] = 'FB_Brow_Centre_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [20178] = {
        ['name'] = 'FB_UpperLipRoot_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [61839] = {
        ['name'] = 'FB_UpperLip_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [20279] = {
        ['name'] = 'FB_L_Lip_Top_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [17719] = {
        ['name'] = 'FB_R_Lip_Top_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [46240] = {
        ['name'] = 'FB_Jaw_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [17188] = {
        ['name'] = 'FB_LowerLipRoot_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [20623] = {
        ['name'] = 'FB_LowerLip_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [47419] = {
        ['name'] = 'FB_L_Lip_Bot_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [49979] = {
        ['name'] = 'FB_R_Lip_Bot_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [47495] = {
        ['name'] = 'FB_Tongue_000',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [35731] = {
        ['name'] = 'RB_Neck_1',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
    [56604] = {
        ['name'] = 'IK_Root',
        ['text'] = '',
        ['impact'] = 0.00,
        ['region'] = 'head',
    },
}

local baseRespawnTime = 600
local baseMedicPay = 750
local playerBoneDamage = {}
local playerRespawnTimes = {}
local inServiceMedics = {}

function round(num, numDecimalPlaces)
    if num then
        local mult = 10 ^ (numDecimalPlaces or 0)
        return math.abs(math.floor(num * mult + 0.5) / mult)
    else
        return nil
    end
end

TriggerEvent('commands:add', 'impound', 'user', function(source, args, user)
    if inServiceMedics[source] then
        TriggerClientEvent('ems:impound', source)
    end
end)

RegisterServerEvent('ems:medicCheck')
AddEventHandler('ems:medicCheck', function()
    local player = source
    local characterId = exports['character']:serverIdToCharacterId(source)

    if characterId then
        MySQL.Async.fetchScalar('SELECT rank FROM medic WHERE identifier = @characterId', { ['@characterId'] = characterId }, function(rank) 
            TriggerClientEvent('ems:medicRank', player, rank)
        end)
    end
end)

RegisterServerEvent('ems:call')
AddEventHandler('ems:call', function(reason, idPlayerInComa, x, y, z)
    TriggerClientEvent('ems:dispatch', -1, reason, idPlayerInComa, x, y, z, source)
end)

RegisterServerEvent('ems:takeCall')
AddEventHandler('ems:takeCall', function(idPlayerInComa, x, y, z, sourcePlayerInComa)
    TriggerClientEvent('ems:callTaken', -1, source, idPlayerInComa, x, y, z, sourcePlayerInComa)
end)

RegisterServerEvent('ems:medicDispatchedTo')
AddEventHandler('ems:medicDispatchedTo', function(sourcePlayerInComa)
    TriggerClientEvent('ems:medicDispatched', sourcePlayerInComa)
end)

RegisterServerEvent('ems:heal')
AddEventHandler('ems:heal', function(injuredPlayer)
    TriggerClientEvent('ems:heal', injuredPlayer)

    MySQL.Async.execute("UPDATE stats SET medic_heals = medic_heals + 1 ORDER BY ID DESC LIMIT 1", {}, function(rowsChanged)
    end)
end)

RegisterServerEvent('ems:revive')
AddEventHandler('ems:revive', function(deadPlayer)
    local player = source
    
    TriggerClientEvent('ems:revive', deadPlayer)

    local pay = round(baseMedicPay + ((playerRespawnTimes[deadPlayer].modifier * 10) * baseMedicPay), 0)

    playerRespawnTimes[source] = nil

    TriggerEvent('bank:depositWithCallback', source, pay, function()
        TriggerClientEvent('chatMessage', player, "MEDIC", { 255, 0, 0 }, "You have received $" .. pay .. " for saving a life.")
    end)

    MySQL.Async.execute("UPDATE stats SET medic_revives = medic_revives + 1 ORDER BY ID DESC LIMIT 1", {}, function(rowsChanged)
    end)
end)

RegisterServerEvent('ems:playerDied')
AddEventHandler("ems:playerDied", function(boneDamagePayload)
    local respawnTimeModifier = 0.00
    for _, damage in pairs(boneDamagePayload) do
        if damage.bone and bones[damage.bone] and regions[bones[damage.bone].region] then
            respawnTimeModifier = respawnTimeModifier + regions[bones[damage.bone].region].impact
        end
    end

    local respawnTime = baseRespawnTime - (baseRespawnTime * respawnTimeModifier)

    if respawnTime < 150 then
        respawnTimeModifier = 0.75
        respawnTime = 150
    end

    print('Player died. Respawn time: ' .. respawnTime .. ' seconds. ID: ' .. source)

    playerBoneDamage[source] = boneDamagePayload
    playerRespawnTimes[source] = {
        ['modifier'] = respawnTimeModifier, 
        ['timeLeft'] = respawnTime,
        ['locked'] = false,
        ['miracleAttempted'] = false,
    }

    TriggerClientEvent('ems:syncRespawnTimes', source, playerRespawnTimes)
end)

RegisterServerEvent('ems:startService')
AddEventHandler('ems:startService', function()
    inServiceMedics[source] = 1

    TriggerClientEvent("ems:allMedicsInService", -1, inServiceMedics)
    print('Medic went on duty.')
end)

RegisterServerEvent('ems:stopService')
AddEventHandler('ems:stopService', function()
    inServiceMedics[source] = nil

    TriggerClientEvent("ems:allMedicsInService", -1, inServiceMedics)
    print('Medic went off duty.')
end)

RegisterServerEvent('ems:getInServiceMedics')
AddEventHandler('ems:getInServiceMedics', function()
    TriggerClientEvent('ems:allMedicsInService', source, inServiceMedics)
end)

AddEventHandler('playerDropped', function()
    local identifier = Helpers.getSteamIdentifier(source)
    local id = exports['character']:serverIdToCharacterId(source)
    
    if identifier then
        if inServiceMedics[source] then
            inServiceMedics[source] = nil
            
            TriggerClientEvent("ems:allMedicsInService", -1, inServiceMedics)
        end
    end
end)

RegisterServerEvent('ems:clearDeath')
AddEventHandler('ems:clearDeath', function()
    local player = source

    playerRespawnTimes[player] = nil

    -- update character
end)

RegisterServerEvent('ems:stabilize')
AddEventHandler('ems:stabilize', function(playerInComa, additionalTime)
    local timeLeft = playerRespawnTimes[playerInComa].timeLeft
    
    if timeLeft and timeLeft > 0 then
        playerRespawnTimes[playerInComa].timeLeft = timeLeft + additionalTime
    end
end)

RegisterServerEvent('ems:beginRevive')
AddEventHandler('ems:beginRevive', function(playerInComa)
    local timeLeft = playerRespawnTimes[playerInComa].timeLeft
    
    if timeLeft then
        playerRespawnTimes[playerInComa].locked = true
    end
end)

RegisterServerEvent('ems:unseat')
AddEventHandler('ems:unseat', function(playerInComa)
    TriggerClientEvent('ems:unseat', playerInComa)
end)

RegisterServerEvent('ems:find')
AddEventHandler('ems:find', function(patient)
    TriggerClientEvent('police:getEscorted', patient, source)
end)

RegisterServerEvent('ems:miracle')
AddEventHandler('ems:miracle', function(deadPlayer)
    local player = source

    if playerRespawnTimes[deadPlayer] and not playerRespawnTimes[deadPlayer].miracleAttempted then
        playerRespawnTimes[deadPlayer].miracleAttempted = true

        local goal = math.random(1, 10)
        local roll = math.random(1, 10)

        if roll == goal then
            local characterName = exports['character']:getCharacterName(source)
            if characterName then
                TriggerClientEvent('chatMessage', -1, "MIRACLE", { 255, 0, 0 }, characterName .. " saved a life!")
            end
            
            playerRespawnTimes[deadPlayer] = nil
            TriggerClientEvent('ems:revive', deadPlayer)
            
            TriggerEvent('bank:depositWithCallback', source, 15000, function()
                TriggerClientEvent('chatMessage', player, "MEDIC", { 255, 0, 0 }, "You have received $15000 for saving a life.")
            end)

            MySQL.Async.execute("UPDATE stats SET medic_revives = medic_revives + 1 ORDER BY ID DESC LIMIT 1", {}, function(rowsChanged)
            end)
        else
            TriggerClientEvent('chatMessage', player, "MEDIC", { 255, 0, 0 }, "You were not able to save this person's life.")
        end
    end
end)

function globalDeathTimer()
    SetTimeout(1000, function()
        for player, respawnTime in pairs(playerRespawnTimes) do
            if respawnTime.timeLeft - 1 >= 0 and not respawnTime.locked then
                respawnTime.timeLeft = respawnTime.timeLeft - 1
            elseif not respawnTime.locked and respawnTime.timeLeft == 0 then
                if respawnTime.limbo then
                    if respawnTime.limbo - 1 == 0 then
                         playerRespawnTimes[player] = nil

                        User.getMoney(player, function(money)
                            if tonumber(money) > 0 then
                                User.removeMoney(player, money, function()
                                end)
                            end
                        end)

                        TriggerClientEvent('ems:respawn', player)
                    else
                        respawnTime.limbo = respawnTime.limbo - 1
                    end
                else
                    respawnTime.limbo = 60
                end
            end
        end

        TriggerClientEvent('ems:syncRespawnTimes', -1, playerRespawnTimes)

        globalDeathTimer()
    end)
end

globalDeathTimer()

-- Commands --

-- Helpers
function addMedic(player, identifier)
    local nameJob = "Medic"
    local characterId = exports['character']:serverIdToCharacterId(player)

    MySQL.Async.execute("INSERT IGNORE INTO medic (identifier) VALUES (@identifier)", { ['@identifier'] = characterId }, function(rowsChanged)
        MySQL.Async.execute("UPDATE users SET job = 11 WHERE identifier = @identifier", { ['@identifier'] = identifier }, function(rowsChanged)
            TriggerClientEvent("es_freeroam:notify", player, "CHAR_MP_STRIPCLUB_PR", 1, "Marie", false, "You've been hired as a Medic. Congratulations!")
            TriggerClientEvent("jobssystem:updateJob", player, nameJob, 1, 1)
        end)
    end)
end

function removeMedic(player, identifier)
    local nameJob = "Unemployed"
    local characterId = exports['character']:serverIdToCharacterId(player)

    MySQL.Async.execute("DELETE FROM medic WHERE identifier = @identifier", { ['@identifier'] = characterId }, function(rowsChanged)
        MySQL.Async.execute("UPDATE users SET job = 1 WHERE identifier = @identifier", { ['@identifier'] = identifier }, function(rowsChanged)
            TriggerClientEvent("es_freeroam:notify", player, "CHAR_MP_STRIPCLUB_PR", 1, "Marie", false, "You've been fired from your job as a Medic!")
            TriggerClientEvent("jobssystem:updateJob", player, nameJob, 1, 1)
            TriggerClientEvent("ems:fired", player)
        end)
    end)
end

-- Events (TODO: Clean this up.)
TriggerEvent('commands:add', 'medicadd', 'user', function(source, args)
    local identifier = exports['character']:serverIdToCharacterId(source) --Helpers.getSteamIdentifier(source)
    local medic = source

    MySQL.Async.fetchScalar("SELECT rank FROM medic WHERE identifier = @identifier", { ['@identifier'] = identifier }, function(rank)
        if rank and rank >= 5 then
            if not args[2] then
                TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "Usage : /medicadd [ID]")
            else
                if GetPlayerName(exports['character']:characterIdToServerId(tonumber(args[2]))) ~= nil then
                    local player = exports['character']:characterIdToServerId(tonumber(args[2]))
                    local playerIdentifier = Helpers.getSteamIdentifier(player)

                    addMedic(player, playerIdentifier)
                    
                    TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "Roger that!")
                    TriggerClientEvent("es_freeroam:notify", player, "CHAR_ANDREAS", 1, "Government", false, "Congrats, you're now a medic!~w~.")
                    TriggerClientEvent('ems:hired', player)
                else
                    TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "No player with this ID!")
                end
            end
        else
            TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "You don't have permission to do that!")
        end
    end)
end)

TriggerEvent('commands:add', 'medicrem', 'user', function(source, args)
    local identifier = exports['character']:serverIdToCharacterId(source) --Helpers.getSteamIdentifier(source)
    local medic = source

    MySQL.Async.fetchScalar("SELECT rank FROM medic WHERE identifier = @identifier", { ['@identifier'] = identifier }, function(rank)
        if rank and rank >= 5 then
            if not args[2] then
                TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "Usage : /medicrem [ID]")
            else
                if GetPlayerName(exports['character']:characterIdToServerId(tonumber(args[2]))) ~= nil then
                    local player = exports['character']:characterIdToServerId(tonumber(args[2]))
                    local playerIdentifier = Helpers.getSteamIdentifier(player)
                    
                    removeMedic(player, playerIdentifier)
                    
                    TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "Roger that!")
                else
                    TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "No player with this ID!")
                end
            end
        else
            TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "You don't have permission to do that!")
        end
    end)
end)

TriggerEvent('commands:add', 'medicpromo', 'user', function(source, args)
    local identifier = exports['character']:serverIdToCharacterId(source) --Helpers.getSteamIdentifier(source)
    local medic = source

    MySQL.Async.fetchScalar("SELECT rank FROM medic WHERE identifier = @identifier", { ['@identifier'] = identifier }, function(rank)
        if rank and rank >= 5 then
            if not args[2] then
                TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "Usage : /medicpromo [ID]")
            else
                if GetPlayerName(exports['character']:characterIdToServerId(tonumber(args[2]))) ~= nil then
                    local player = exports['character']:characterIdToServerId(tonumber(args[2]))
                    
                    TriggerEvent('jobssystem:promoteUser', medic, player, 11)
                else
                    TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "No player with this ID!")
                end
            end
        else
            TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "You don't have permission to do that!")
        end
    end)
end)

TriggerEvent('commands:add', 'medicdemo', 'user', function(source, args)
    local identifier = exports['character']:serverIdToCharacterId(source) --Helpers.getSteamIdentifier(source)
    local medic = source

    MySQL.Async.fetchScalar("SELECT rank FROM medic WHERE identifier = @identifier", { ['@identifier'] = identifier }, function(rank)
        if rank and rank >= 5 then
            if not args[2] then
                TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "Usage : /medicdemo [ID]")
            else
                if GetPlayerName(exports['character']:characterIdToServerId(tonumber(args[2]))) ~= nil then
                    local player = exports['character']:characterIdToServerId(tonumber(args[2]))
                    
                    TriggerEvent('jobssystem:demoteUser', medic, player, 11)
                else
                    TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "No player with this ID!")
                end
            end
        else
            TriggerClientEvent('chatMessage', medic, 'GOVERNMENT', { 255, 0, 0 }, "You don't have permission to do that!")
        end
    end)
end)