local mainmarkers = true

local main = {
	{name="Court House", id=419, x= 233.03190612793, y= -414.4367980957, z= 57.699691772461} -- Mission Row Upstairs
}


	Citizen.CreateThread(function()
		if (mainmarkers) then
			for _, item in pairs(main) do
			item.blip = AddBlipForCoord(item.x, item.y, item.z)
			SetBlipSprite(item.blip, item.id)
			SetBlipAsShortRange(item.blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(item.name)
			EndTextCommandSetBlipName(item.blip)
		end
	end
end)




Citizen.CreateThread(function()
	while true do

		Wait(0)
		
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)


		---------------------------------------------------------------------------
		-- OUTSIDE MARKER
		---------------------------------------------------------------------------

		-- Court House Enter

		DrawMarker(23, 238.03744506836,-412.17980957031,48.111953735352, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 10.3, 0, 519, 0, 105, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 238.03744506836,-412.17980957031,48.111953735352, true) <= 2.0 then
			DisplayHelpText("Press ~r~E~s~ to go inside")
			if IsControlJustPressed(0, 38) then -- uses 'E' to interact
				loadCasino()
			end
		end	

		-- Launder check

		DrawMarker(1, 639.78234863282,2773.1804199218,42.025310516358-1.0001, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 10.3, 0, 519, 0, 105, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 639.78234863282,2773.1804199218,42.025310516358, true) <= 2.0 then
			DisplayHelpText("Press ~r~E~s~ to go inside")
			if IsControlJustPressed(0, 38) then
				loadLaunder()
			end
		end	

		-- Meth check

		DrawMarker(1, 910.54754638672,-1065.3074951172,37.943222045898-1.0001, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 10.3, 0, 519, 0, 105, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 910.54754638672,-1065.3074951172,37.943222045898, true) <= 2.0 then
			DisplayHelpText("Press ~r~E~s~ to go inside")
			if IsControlJustPressed(0, 38) then
				loadMeth()
			end
		end	

		-- Coke check

		DrawMarker(1, 387.51754760742,3584.7612304688,33.29222869873-1.0001, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 10.3, 0, 519, 0, 105, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 387.51754760742,3584.7612304688,33.29222869873, true) <= 2.0 then
			DisplayHelpText("Press ~r~E~s~ to go inside")
			if IsControlJustPressed(0, 38) then
				loadCoke()
			end
		end	

		-- Biker check

		DrawMarker(1, 964.48321533204,-1027.0417480468,40.847507476806-1.0001, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 10.3, 0, 519, 0, 105, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 964.48321533204,-1027.0417480468,40.847507476806, true) <= 2.0 then
			DisplayHelpText("Press ~r~E~s~ to go inside")
			if IsControlJustPressed(0, 38) then
				loadBiker()
			end
		end	



		---------------------------------------------------------------------------
		-- INSIDE MARKER AND TP OUTSIDE
		---------------------------------------------------------------------------

			-- Court house exit

		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 224.73817443848,-419.69500732422,-118.19955444336, true) <= 2.0 then
			if IsControlJustPressed(0, 38) then

				SetEntityCoords(GetPlayerPed(-1), 238.03744506836,-412.17980957031,48.111953735352)				
			end
		end

		-- weed exit

		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 1065.430, -3182.969, -39.163, true) <= 2.0 then
			if IsControlJustPressed(0, 38) then
				DoScreenFadeOut(1000)
				Citizen.Wait(1500)
				
				SetEntityCoords(GetPlayerPed(-1), 2885.7807617188,4387.224609375,50.735790252686, 239.736)
				
				Citizen.Wait(1000)
				DoScreenFadeIn(1000)
			end
		end
		
		-- coke exit

		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 1088.803, -3188.257, -38.993, true) <= 1.0 then
			if IsControlJustPressed(0, 38) then
				DoScreenFadeOut(1000)
				Citizen.Wait(1500)

				SetEntityCoords(GetPlayerPed(-1), 387.51754760742,3584.7612304688,33.29222869873)
				Citizen.Wait(1000)
				DoScreenFadeIn(1000)
			end
		end
		
		-- meth exit
		
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 996.933, -3200.605, -36.394, true) <= 1.0 then
			if IsControlJustPressed(0, 38) then
				DoScreenFadeOut(1000)
				Citizen.Wait(1500)
				
				SetEntityCoords(GetPlayerPed(-1), 910.54754638672,-1065.3074951172,37.943222045898)
				Citizen.Wait(1000)
				DoScreenFadeIn(1000)
			end
		end	
		
		-- launder exit

		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 1118.683, -3193.319, -40.391, true) <= 2.0 then
			if IsControlJustPressed(0, 38) then
				DoScreenFadeOut(1000)
				Citizen.Wait(1500)

				SetEntityCoords(GetPlayerPed(-1), 639.16082763672,2773.4375,42.015407562256, 125.059)
				Citizen.Wait(1000)
				DoScreenFadeIn(1000)				
			end
		end	

		-- biker exit

		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 996.88189697266,-3157.9697265625,-38.907146453858, true) <= 2.0 then
			if IsControlJustPressed(0, 38) then
				DoScreenFadeOut(1000)
				Citizen.Wait(1500)

				SetEntityCoords(GetPlayerPed(-1), 964.48321533204,-1027.0417480468,40.847507476806, 125.059)
				Citizen.Wait(1000)
				DoScreenFadeIn(1000)				
			end
		end
	end
end)



















	---------------------------------------------------------------------------
	-- LOAD INTO BUILDING
	---------------------------------------------------------------------------

function loadWeed()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(GetPlayerPed(-1), 1063.445, -3183.618, -39.164)
		DoScreenFadeIn(1000)
end

function loadLaunder()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(GetPlayerPed(-1), 1118.683, -3193.319, -40.391)
		DoScreenFadeIn(1000)
end

function loadMeth()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(GetPlayerPed(-1), 996.8969116211,-3200.6459960938,-36.39372253418)
		DoScreenFadeIn(1000)
end

function loadCoke()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(GetPlayerPed(-1), 1088.803, -3188.257, -38.993)
		DoScreenFadeIn(1000)
end

function loadBiker()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(GetPlayerPed(-1), 996.97509765625,-3157.9213867188,-38.907146453858)
		DoScreenFadeIn(1000)
end

function loadCasino()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		SetEntityCoords(GetPlayerPed(-1), 225.338,-419.716,-118.150)
end




	---------------------------------------------------------------------------
	-- LOAD INTO BUILDING
	---------------------------------------------------------------------------
	function DisplayHelpText(str)
   		SetTextComponentFormat("STRING")
   	 	AddTextComponentString(str)
    	DisplayHelpTextFromStringLabel(0, 0, 0, -1)
	end