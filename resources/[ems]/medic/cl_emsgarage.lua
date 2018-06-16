local medicveh = {
    opened = false,
    title = "EMS Garage",
    currentmenu = "main",
    lastmenu = nil,
    currentpos = nil,
    selectedbutton = 0,
    marker = { r = 0, g = 155, b = 255, a = 200, type = 1 }, -- ???
    menu = {
        x = 0.11,
        y = 0.25,
        width = 0.2,
        height = 0.04,
        buttons = 10,
        from = 1,
        to = 10,
        scale = 0.4,
        font = 0,
        ["main"] = {
            title = "CATEGORIES",
            name = "main",
            buttons = {
                { name = "Basic Ambulance", costs = 0, description = {}, model = "ambulance2" },
            }
        },
    }
}

local fakecar = { model = '', car = nil }
local boughtcar = false
local vehicle_price = 0

function LocalPed()
    return GetPlayerPed(-1)
end

-------------------------------------------------
---------------- CONFIG SELECTION----------------
-------------------------------------------------
function ButtonSelected(button)
    local ped = GetPlayerPed(-1)
    local this = medicveh.currentmenu
    boughtcar = true
    CloseVeh()
end

-------------------------------------------------
---------------- CONFIG OPEN MENU-----------------
-------------------------------------------------
function OpenMenuVeh(menu)
    fakecar = { model = '', car = nil }
    medicveh.lastmenu = medicveh.currentmenu
    if menu == "main" then
        medicveh.lastmenu = "main"
    end
    medicveh.menu.from = 1
    medicveh.menu.to = 10
    medicveh.selectedbutton = 0
    medicveh.currentmenu = menu
end

-------------------------------------------------
------------------ DRAW NOTIFY--------------------
-------------------------------------------------
function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

-------------------------------------------------
------------------ DRAW TITLE MENU----------------
-------------------------------------------------
function drawMenuTitle(txt, x, y)
    local menu = medicveh.menu
    SetTextFont(2)
    SetTextProportional(0)
    SetTextScale(0.5, 0.5)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    AddTextComponentString(txt)
    DrawRect(x, y, menu.width, menu.height, 0, 0, 0, 150)
    DrawText(x - menu.width / 2 + 0.005, y - menu.height / 2 + 0.0028)
end

-------------------------------------------------
------------------ DRAW MENU BOUTON---------------
-------------------------------------------------
function drawMenuButton(button, x, y, selected)
    local menu = medicveh.menu
    SetTextFont(menu.font)
    SetTextProportional(0)
    SetTextScale(menu.scale, menu.scale)
    if selected then
        SetTextColour(0, 0, 0, 255)
    else
        SetTextColour(255, 255, 255, 255)
    end
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(button.name)
    if selected then
        DrawRect(x, y, menu.width, menu.height, 255, 255, 255, 255)
    else
        DrawRect(x, y, menu.width, menu.height, 0, 0, 0, 150)
    end
    DrawText(x - menu.width / 2 + 0.005, y - menu.height / 2 + 0.0028)
end

-------------------------------------------------
------------------ DRAW MENU INFO-----------------
-------------------------------------------------
function drawMenuInfo(text)
    local menu = medicveh.menu
    SetTextFont(menu.font)
    SetTextProportional(0)
    SetTextScale(0.45, 0.45)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawRect(0.675, 0.95, 0.65, 0.050, 0, 0, 0, 150)
    DrawText(0.365, 0.934)
end

-------------------------------------------------
---------------- DRAW MENU DROIT------------------
-------------------------------------------------
function drawMenuRight(txt, x, y, selected)
    local menu = medicveh.menu
    SetTextFont(menu.font)
    SetTextProportional(0)
    SetTextScale(menu.scale, menu.scale)
    --SetTextRightJustify(1)
    if selected then
        SetTextColour(0, 0, 0, 255)
    else
        SetTextColour(255, 255, 255, 255)
    end
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(txt)
    DrawText(x + menu.width / 2 - 0.03, y - menu.height / 2 + 0.0028)
end

-------------------------------------------------
------------------- DRAW TEXT---------------------
-------------------------------------------------
function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

-------------------------------------------------
---------------- CONFIG BACK MENU-----------------
-------------------------------------------------
function Back()
    if backlock then
        return
    end
    backlock = true
    if medicveh.currentmenu == "main" then
        CloseVeh()
    elseif vehshop.currentmenu == "main" then
        if DoesEntityExist(fakecar.car) then
            Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
        end
        fakecar = { model = '', car = nil }
    else
        OpenMenuVeh(medicveh.lastmenu)
    end
end

-------------------------------------------------
---------------- FONCTION ???????-----------------
-------------------------------------------------
function f(n)
    return n + 0.0001
end

function LocalPed()
    return GetPlayerPed(-1)
end

function try(f, catch_f)
    local status, exception = pcall(f)
    if not status then
        catch_f(exception)
    end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function round(num, idp)
    if idp and idp > 0 then
        local mult = 10 ^ idp
        return math.floor(num * mult + 0.5) / mult
    end
    return math.floor(num + 0.5)
end

function stringstarts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

-------------------------------------------------
---------------- FONCTION OPEN--------------------
-------------------------------------------------
function OpenMVeh() --OpenCreator
    boughtcar = false
    local ped = LocalPed()
    local playerCoords = GetEntityCoords(ped, 0)
    local pos = { playerCoords.x, playerCoords.y, playerCoords.z }
    --local pos = {452.115,-1018.106,28.478}
    FreezeEntityPosition(ped, true)
    SetEntityVisible(ped, false)
    local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B, pos[1], pos[2], pos[3], Citizen.PointerValueFloat(), 0)
    SetEntityCoords(ped, pos[1], pos[2], g)
    SetEntityHeading(ped, pos[4])
    medicveh.currentmenu = "main"
    medicveh.opened = true
    medicveh.selectedbutton = 0
end

-------------------------------------------------
---------------- FONCTION CLOSE-------------------
-------------------------------------------------
function CloseVeh() -- Close Creator
    Citizen.CreateThread(function()
        local ped = LocalPed()
        if not boughtcar then
            FreezeEntityPosition(ped, false)
            SetEntityVisible(ped, true)
        else
            local veh = GetVehiclePedIsUsing(ped)
            local model = GetEntityModel(veh)
            local colors = table.pack(GetVehicleColours(veh))
            local extra_colors = table.pack(GetVehicleExtraColours(veh))
            local plyCoords = GetEntityCoords(ped, 0)

            local mods = {}
            for i = 0, 24 do
                mods[i] = GetVehicleMod(veh, i)
            end
            Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))

            FreezeEntityPosition(ped, false)
            RequestModel(model)
            while not HasModelLoaded(model) do
                Citizen.Wait(0)
            end
            medicvehicle = CreateVehicle(model, plyCoords["x"], plyCoords["y"], plyCoords["z"], 90.0, true, false)
            SetModelAsNoLongerNeeded(model)
            --[[for i,mod in pairs(mods) do
                SetVehicleModKit(medicvehicle,0)
                SetVehicleMod(medicvehicle,i,mod)
            end]]

            SetVehicleMod(medicvehicle, 11, 2)
            SetVehicleMod(medicvehicle, 12, 2)
            SetVehicleMod(medicvehicle, 13, 2)
            SetVehicleEnginePowerMultiplier(medicvehicle, 35.0)
            ToggleVehicleMod(medicvehicle, 18, true) -- turbo
            SetVehicleTyresCanBurst(medicvehicle, false) -- bulletproof tires

            SetVehicleOnGroundProperly(medicvehicle)
            SetVehicleHasBeenOwnedByPlayer(medicvehicle, true)
            local id = NetworkGetNetworkIdFromEntity(medicvehicle)
            SetNetworkIdCanMigrate(id, true)
            Citizen.InvokeNative(0x629BFA74418D6239, Citizen.PointerValueIntInitialized(medicvehicle))
            SetVehicleColours(medicvehicle, colors[1], colors[2])
            SetVehicleExtraColours(medicvehicle, extra_colors[1], extra_colors[2])
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), medicvehicle, -1)
            SetEntityVisible(ped, true)
            exports.vehicleManager:giveVehicleKeys(GetVehicleNumberPlateText(medicvehicle), GetEntityModel(medicvehicle))
            TriggerServerEvent("vehicleManager:addItemToTrunk", GetVehicleNumberPlateText(medicvehicle), 83, 1)
            local rank = exports.jobs:getRank()
            if rank >= 4 then -- Field Supervisor
                SetVehicleLivery(medicvehicle, 5) -- skin selection
            else
                SetVehicleLivery(medicvehicle, 5) -- skin selection
            end

            if DoesEntityExist(fakecar.car) then
                Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
            end

            TriggerEvent('ems:medicVehicle', medicvehicle)
        end

        medicveh.opened = false
        medicveh.menu.from = 1
        medicveh.menu.to = 10
    end)
end

-- Just trying to make this work...
local stationGarage = {
    { x = 327.592, y = -1471.510, z = 29.774 }, -- innocence
    { x = 1137.0216064453, y = -1612.1114501953, z = 34.692546844482 }, -- st fiacre
    { x = 283.66897338867, y = -603.87176757813, z = 43.188522338867 }, -- pillbox
    { x = -475.28688964844, y = -354.18936157227, z = 34.263506317139 }, -- Mt Zonah / Carcer Way
    { x = 1803.2822265625, y = 3679.9753417969, z = 34.224262237549 }, -- Sandy Shores
    { x = -260.55755615234, y = 6340.5366210938, z = 32.329204559326 }, -- The Bay
}

function isNearStationGarage(draw)
    for i = 1, #stationGarage do
        local ply = GetPlayerPed(-1)
        local plyCoords = GetEntityCoords(ply, 0)
        local distance = GetDistanceBetweenCoords(stationGarage[i].x, stationGarage[i].y, stationGarage[i].z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
        if (distance < 30 and draw) then
            DrawMarker(1, stationGarage[i].x, stationGarage[i].y, stationGarage[i].z - 1, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.0, 255, 165, 0, 165, 0, 0, 2, 0, 0, 0, 0)
        end
        if (distance < 3) then
            return true
        end
    end
end

function getNearStationGarage()
    for i = 1, #stationGarage do
        local ply = GetPlayerPed(-1)
        local plyCoords = GetEntityCoords(ply, 0)
        local distance = GetDistanceBetweenCoords(stationGarage[i].x, stationGarage[i].y, stationGarage[i].z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
        if (distance < 5) then
            return stationGarage[i]
        end
    end
end

-------------------------------------------------
---------------- FONCTION OPEN MENU---------------
-------------------------------------------------
local backlock = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not isNearStationGarage(false) and medicveh.opened then
            CloseVeh()
        end
        if medicveh.opened then
            local ped = LocalPed()
            local menu = medicveh.menu[medicveh.currentmenu]
            local stationGarage = getNearStationGarage()
            drawTxt(medicveh.title, 1, 1, medicveh.menu.x, medicveh.menu.y, 1.0, 255, 255, 255, 255)
            drawMenuTitle(menu.title, medicveh.menu.x, medicveh.menu.y + 0.08)
            drawTxt(medicveh.selectedbutton .. "/" .. tablelength(menu.buttons), 0, 0, medicveh.menu.x + medicveh.menu.width / 2 - 0.0385, medicveh.menu.y + 0.067, 0.4, 255, 255, 255, 255)
            local y = medicveh.menu.y + 0.12
            buttoncount = tablelength(menu.buttons)
            local selected = false

            for i, button in pairs(menu.buttons) do
                if i >= medicveh.menu.from and i <= medicveh.menu.to then

                    if i == medicveh.selectedbutton then
                        selected = true
                    else
                        selected = false
                    end
                    drawMenuButton(button, medicveh.menu.x, y, selected)
                    --if button.distance ~= nil then
                    --drawMenuRight(button.distance.."m",medicveh.menu.x,y,selected)
                    --end
                    y = y + 0.04
                    if medicveh.currentmenu == "main" then
                        if selected then
                            if fakecar.model ~= button.model then
                                if DoesEntityExist(fakecar.car) then
                                    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
                                end
                                local ped = LocalPed()
                                local hash = GetHashKey(button.model)
                                RequestModel(hash)
                                while not HasModelLoaded(hash) do
                                    Citizen.Wait(0)
                                    drawTxt("~b~Loading...", 0, 1, 0.5, 0.5, 1.5, 255, 255, 255, 255)
                                end
                                --local veh = CreateVehicle(hash, 452.115, -1018.106, 28.478,90.0,false,false)
                                local veh = CreateVehicle(hash, stationGarage.x, stationGarage.y, stationGarage.z, 90.0, false, false)
                                while not DoesEntityExist(veh) do
                                    Citizen.Wait(0)
                                    drawTxt("~b~Loading...", 0, 1, 0.5, 0.5, 1.5, 255, 255, 255, 255)
                                end
                                FreezeEntityPosition(veh, true)
                                SetEntityInvincible(veh, true)
                                SetVehicleDoorsLocked(veh, 4)
                                --SetEntityCollision(veh,false,false)
                                TaskWarpPedIntoVehicle(LocalPed(), veh, -1)
                                for i = 0, 24 do
                                    SetVehicleModKit(veh, 0)
                                    RemoveVehicleMod(veh, i)
                                end
                                fakecar = { model = button.model, car = veh }
                                SetVehicleLivery(veh, 5) -- skin selection
                            end
                        end
                    end
                    if selected and IsControlJustPressed(1, 201) then
                        ButtonSelected(button)
                    end
                end
            end
        end
        if medicveh.opened then
            if IsControlJustPressed(1, 202) then
                Back()
            end
            if IsControlJustReleased(1, 202) then
                backlock = false
            end
            if IsControlJustPressed(1, 188) then
                if medicveh.selectedbutton > 1 then
                    medicveh.selectedbutton = medicveh.selectedbutton - 1
                    if buttoncount > 10 and medicveh.selectedbutton < medicveh.menu.from then
                        medicveh.menu.from = medicveh.menu.from - 1
                        medicveh.menu.to = medicveh.menu.to - 1
                    end
                end
            end
            if IsControlJustPressed(1, 187) then
                if medicveh.selectedbutton < buttoncount then
                    medicveh.selectedbutton = medicveh.selectedbutton + 1
                    if buttoncount > 10 and medicveh.selectedbutton > medicveh.menu.to then
                        medicveh.menu.to = medicveh.menu.to + 1
                        medicveh.menu.from = medicveh.menu.from + 1
                    end
                end
            end
        end
    end
end)
---------------------------------------------------
------------------ EVENT SPAWN VEH------------------
---------------------------------------------------
RegisterNetEvent('medicveh:spawnVehicle')
AddEventHandler('medicveh:spawnVehicle', function(v)
    local car = GetHashKey(v)
    local playerPed = GetPlayerPed(-1)
    if playerPed and playerPed ~= -1 then
        RequestModel(car)
        while not HasModelLoaded(car) do
            Citizen.Wait(0)
        end
        local playerCoords = GetEntityCoords(playerPed)

        veh = CreateVehicle(car, playerCoords, 0.0, true, false)

        TaskWarpPedIntoVehicle(playerPed, veh, -1)
        SetEntityInvincible(veh, false)
    end
end)

RegisterNetEvent('medic:updateGarage')
AddEventHandler('medic:updateGarage', function()
    Citizen.Wait(3000)
    local rank = exports.jobs:getRank()
    for k in pairs(medicveh.menu["main"].buttons) do medicveh.menu["main"].buttons[k] = nil end -- clear table and reset
    Citizen.Trace("Updating vehicles for rank: " .. rank)

    if rank >= 1 then -- Medical Trainee
        table.insert(medicveh.menu["main"].buttons, { name = "Basic Ambulance", costs = 0, description = {}, model = "ambulance2" })
        table.insert(medicveh.menu["main"].buttons, { name = "EMS Van", costs = 0, description = {}, model = "emsvan" })
    end

    if rank >= 2 then -- EMR
        table.insert(medicveh.menu["main"].buttons, { name = "Ambulance", costs = 0, description = {}, model = "ambulance" })
    end

    if rank >= 3 then -- EMT
        table.insert(medicveh.menu["main"].buttons, { name = "EMS Granger", costs = 0, description = {}, model = "emssuv2" })
        table.insert(medicveh.menu["main"].buttons, { name = "EMS SUV", costs = 0, description = {}, model = "emssuv" })
    end

    if rank >= 4 then -- Paramedic
        table.insert(medicveh.menu["main"].buttons, { name = "First Responder", costs = 0, description = {}, model = "emscar" })
    end

    if rank >= 5 then -- Field Supervisor
        table.insert(medicveh.menu["main"].buttons, { name = "Rapid Reponse", costs = 0, description = {}, model = "emscar2" })
    end

    if rank >= 6 then -- Medical Director
        table.insert(medicveh.menu["main"].buttons, { name = "MD Charger", costs = 0, description = {}, model = "police9" })

    end

    if rank >= 7 then -- Chief medical Officer

    end
end)