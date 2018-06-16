-- Config START
local displayMDTBlips = true  --- Change this if you dont want BLIPS
local usingMDT = false 
local GUIOpen = false
local Darkzy = true




-- Blips START

local desks = {
	{name="Desk MDT", id=521, x= 442.14019775391, y= -978.88403320313, z= 30.689609527588}, -- Mission Row Upstairs
	{name="Desk MDT", id=521, x= 459.75399780273, y= -988.72802734375, z= 24.914869308472}, -- Mission Row Cells
	{name="Desk MDT", id=521, x= 1853.2602539063, y= 3689.87109375, z= 34.267032623291}, -- Sandy
	{name="Desk MDT", id=521, x= -449.37454223633, y= 6012.5166015625, z= 31.716365814209}, -- Paleto 
}


	function showMDTBlips()
	Citizen.CreateThread(function()
		if (displayMDTBlips) then
			for _, item in pairs(desks) do
				item.blip = AddBlipForCoord(item.x, item.y, item.z)
				SetBlipSprite(item.blip, item.id)
				SetBlipAsShortRange(item.blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(item.name)
				EndTextCommandSetBlipName(item.blip)
					end
				end
		 end)
	end

-- BLIPS END






-- UI START

local atMDT = false
local deskMDTOpen = false
local carMDTOpen = false


function openGui()
SetNuiFocus(true)
SendNUIMessage({openMDT = true})
end

function closeGui()
SetNuiFocus(false)
SendNUIMessage({openMDT = false})
end


function loadMDT()
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
	if (IsNearDesk() or IsInPoliceVehicle()) then
		if (atMDT == false) then
		DisplayHelpText("Press ~g~E~s~ to open MDT")
		end
		local ped = GetPlayerPed(-1)
		atMDT = true
	if IsControlJustPressed(1, 38)  then	
		if IsPedDeadOrDying(ped, 1) then
			DisplayHelpText("MATE, you can't use your PC while ded... gud meme")
		else
			if deskMDTOpen then
				closeGui()
				deskMDTOpen = false
			else
				openGui()
				deskMDTOpen = true
			end
		end
	end
		else 
			if(deskMDTOpen or carMDTOpen) then
				closeGui()
			end
			atMDT = false
			deskMDTOpen = false
			carMDTOpen = false
				end
			end
		end)
	end



-- Control Disables
Citizen.CreateThread(function()
	while true do
	  if deskMDTOpen or carMDTOpen then
		local ped = GetPlayerPed(-1)
		local active = true
		DisableControlAction(0, 1, active) -- LookLeftRight
		DisableControlAction(0, 2, active) -- LookUpDown
		DisableControlAction(0, 24, active) -- Attack
		DisablePlayerFiring(ped, true) -- Disable weapon firing
		DisableControlAction(0, 142, active) -- MeleeAttackAlternate
		DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
		if IsDisabledControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
		  SendNUIMessage({type = "click"})
		end
	  end
	  Citizen.Wait(0)
	end
  end)

-- UI End





-- STRP CHECK IF PLAYER IS COP
if Darkzy then -- LOCALHOST COMMAND
	--if exports.police:getIsInService() then   --- remove the lines for it to work in STRP
		Citizen.Trace("Showing MDT Blips")
		showMDTBlips()
		loadMDT()
	end







-- NUI Functions START








-- NUI Functions END














-- Helpers
function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end


function IsNearDesk()
	local ped = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ped, 0)
	for _, item in pairs(desks) do
	  local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
	  if(distance <= 2) then
		return true
	  end
	end
  end


function IsInPoliceVehicle()
	local ped = GetPlayerPed(-1)
	if IsPedInAnyPoliceVehicle(ped) then
	  return true
	else 
		return false
	end
  end