AddEventHandler('onClientMapStart', function()
	exports.pNotify:SendNotification({text = "Welcome to Sanctuary Roleplay, please find the rules at WEBLINK ",type = "success",timeout = 6000,layout = "centerRight",queue = "left"})
	exports.pNotify:SendNotification({text = "Server Version v.a1.0",type = "error",timeout = 6000,layout = "centerRight",queue = "left"})
	end)

function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', 'Sanctuary Roleplay')
end)



Citizen.CreateThread(function()
    while true do
    		-- These natives has to be called every frame.
    	SetVehicleDensityMultiplierThisFrame(0.5)
		SetPedDensityMultiplierThisFrame(0.5)
		SetRandomVehicleDensityMultiplierThisFrame(0.5)
		SetParkedVehicleDensityMultiplierThisFrame(0.5)
		SetScenarioPedDensityMultiplierThisFrame(0.5, 0.5)
		
		local playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(playerPed) 
		RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
		
		
		-- These natives do not have to be called everyframe.
		SetGarbageTrucks(1)
		SetRandomBoats(2)
    	
		Citizen.Wait(1)
	end
end)


