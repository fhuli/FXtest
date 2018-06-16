-- PROXY CLIENT-SIDE VERSION (https://github.com/ImagicTheCat/vRP)
-- Proxy interface system, used to add/call functions between resources

Citizen.CreateThread(function()
	while true do
		Wait(0)
		
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		-- Weed check

		DrawMarker(1, 2885.7807617188,4387.224609375,50.735790252686, 0, 0, 0, 0, 0, 0, 2.0, 3.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 2885.7807617188,4387.224609375,50.735790252686, true) <= 5.0 then
			if IsControlJustPressed(0, 38) then -- uses 'E' to interact
				loadWeed()
			end
		end	

		-- Launder check
		DrawMarker(1, 639.78234863282,2773.1804199218,42.025310516358-1.0001, 0, 0, 0, 0, 0, 0, 2.0, 3.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 639.78234863282,2773.1804199218,42.025310516358, true) <= 5.0 then
			if IsControlJustPressed(0, 38) then
				loadLaunder()
			end
		end	

		-- Meth check
		DrawMarker(1, 910.54754638672,-1065.3074951172,37.943222045898-1.0001, 0, 0, 0, 0, 0, 0, 2.0, 3.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 910.54754638672,-1065.3074951172,37.943222045898, true) <= 5.0 then
			if IsControlJustPressed(0, 38) then
				loadMeth()
			end
		end	

		-- Coke check
		DrawMarker(1, 387.51754760742,3584.7612304688,33.29222869873-1.0001, 0, 0, 0, 0, 0, 0, 2.0, 3.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 387.51754760742,3584.7612304688,33.29222869873, true) <= 5.0 then
			if IsControlJustPressed(0, 38) then
				loadCoke()
			end
		end	

		-- Biker check
		DrawMarker(1, 964.48321533204,-1027.0417480468,40.847507476806-1.0001, 0, 0, 0, 0, 0, 0, 2.0, 3.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 964.48321533204,-1027.0417480468,40.847507476806, true) <= 5.0 then
			if IsControlJustPressed(0, 38) then
				loadBiker()
			end
		end	

		-- weed exit
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 1065.430, -3182.969, -39.163, true) <= 5.0 then
			-- TriggerEvent("fs_freemode:displayHelp", i18n.translate("exit_warehouse"))
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
			-- TriggerEvent("fs_freemode:displayHelp", i18n.translate("exit_warehouse"))
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
			-- TriggerEvent("fs_freemode:displayHelp", i18n.translate("exit_warehouse"))
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
		-- TriggerEvent("fs_freemode:displayHelp", i18n.translate("exit_warehouse"))
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
		-- TriggerEvent("fs_freemode:displayHelp", i18n.translate("exit_warehouse"))
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

--[[
Citizen.CreateThread(function()

RequestIpl("bkr_biker_interior_placement_interior_0_biker_dlc_int_01_milo")
RequestIpl("bkr_biker_interior_placement_interior_1_biker_dlc_int_02_milo")
RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo")
RequestIpl("bkr_biker_interior_placement_interior_3_biker_dlc_int_ware02_milo")
RequestIpl("bkr_biker_interior_placement_interior_4_biker_dlc_int_ware03_milo")
RequestIpl("bkr_biker_interior_placement_interior_5_biker_dlc_int_ware04_milo")
RequestIpl("bkr_biker_interior_placement_interior_6_biker_dlc_int_ware05_milo")
RequestIpl("ex_exec_warehouse_placement_interior_1_int_warehouse_s_dlc_milo")
RequestIpl("ex_exec_warehouse_placement_interior_0_int_warehouse_m_dlc_milo")
RequestIpl("ex_exec_warehouse_placement_interior_2_int_warehouse_l_dlc_milo")

EnableInteriorProp(247297, "weed_upgrade_equip")
EnableInteriorProp(247297, "weed_drying")
EnableInteriorProp(247297, "weed_security_upgrade")

EnableInteriorProp(247297, "weed_production")
EnableInteriorProp(247297, "weed_set_up")
EnableInteriorProp(247297, "weed_chairs")

EnableInteriorProp(247297, "weed_growtha_stage3")
EnableInteriorProp(247297, "weed_growthb_stage3")
EnableInteriorProp(247297, "weed_growthc_stage3")

EnableInteriorProp(247297, "weed_growthd_stage3")
EnableInteriorProp(247297, "weed_growthe_stage3")
EnableInteriorProp(247297, "weed_growthf_stage3")

EnableInteriorProp(247297, "weed_growthg_stage3")
EnableInteriorProp(247297, "weed_growthh_stage3")
EnableInteriorProp(247297, "weed_growthi_stage3")

EnableInteriorProp(247297, "weed_hosea")
EnableInteriorProp(247297, "weed_hoseb")
EnableInteriorProp(247297, "weed_hosec")

EnableInteriorProp(247297, "weed_hosed")
EnableInteriorProp(247297, "weed_hosee")
EnableInteriorProp(247297, "weed_hosef")

EnableInteriorProp(247297, "weed_hoseg")
EnableInteriorProp(247297, "weed_hoseh")
EnableInteriorProp(247297, "weed_hosei")

EnableInteriorProp(247297, "light_growtha_stage23_upgrade")
EnableInteriorProp(247297, "light_growthb_stage23_upgrade")
EnableInteriorProp(247297, "light_growthc_stage23_upgrade")

EnableInteriorProp(247297, "light_growthd_stage23_upgrade")
EnableInteriorProp(247297, "light_growthe_stage23_upgrade")
EnableInteriorProp(247297, "light_growthf_stage23_upgrade")

EnableInteriorProp(247297, "light_growthg_stage23_upgrade")
EnableInteriorProp(247297, "light_growthh_stage23_upgrade")
EnableInteriorProp(247297, "light_growthi_stage23_upgrade")

EnableInteriorProp(247553, "coke_cut_01")
EnableInteriorProp(247553, "coke_cut_02")
EnableInteriorProp(247553, "coke_cut_03")

EnableInteriorProp(247553, "security_high")
EnableInteriorProp(247553, "production_upgrade")
EnableInteriorProp(247553, "equipment_upgrade")

EnableInteriorProp(247553, "coke_cut_04")
EnableInteriorProp(247553, "coke_cut_05")
EnableInteriorProp(247553, "set_up")

EnableInteriorProp(247553, "table_equipment_upgrade")
EnableInteriorProp(247553, "coke_press_upgrade")

EnableInteriorProp(247041, "meth_lab_upgrade")
EnableInteriorProp(247041, "meth_lab_production")
EnableInteriorProp(247041, "meth_lab_security_high")

EnableInteriorProp(247041, "meth_lab_setup")

EnableInteriorProp(247809, "counterfeit_security")
EnableInteriorProp(247809, "counterfeit_cashpile100a")
EnableInteriorProp(247809, "counterfeit_cashpile20a")

EnableInteriorProp(247809, "counterfeit_cashpile10a")
EnableInteriorProp(247809, "counterfeit_cashpile100b")
EnableInteriorProp(247809, "counterfeit_cashpile100c")

EnableInteriorProp(247809, "counterfeit_cashpile100d")
EnableInteriorProp(247809, "counterfeit_cashpile20b")
EnableInteriorProp(247809, "counterfeit_cashpile20c")

EnableInteriorProp(247809, "counterfeit_cashpile20d")
EnableInteriorProp(247809, "counterfeit_cashpile10b")
EnableInteriorProp(247809, "counterfeit_cashpile10c")

EnableInteriorProp(247809, "counterfeit_cashpile10d")
EnableInteriorProp(247809, "counterfeit_setup")
EnableInteriorProp(247809, "counterfeit_upgrade_equip")

EnableInteriorProp(247809, "dryera_on")
EnableInteriorProp(247809, "dryerb_on")
EnableInteriorProp(247809, "dryerc_on")

EnableInteriorProp(247809, "dryerd_on")
EnableInteriorProp(247809, "money_cutter")
EnableInteriorProp(247809, "special_chairs")

EnableInteriorProp(246785, "equipment_upgrade")
EnableInteriorProp(246785, "production")
EnableInteriorProp(246785, "security_high")

EnableInteriorProp(246785, "set_up")
EnableInteriorProp(246785, "clutter")
EnableInteriorProp(246785, "interior_upgrade")

EnableInteriorProp(246785, "chair01")
EnableInteriorProp(246785, "chair02")
EnableInteriorProp(246785, "chair03")

EnableInteriorProp(246785, "chair04")
EnableInteriorProp(246785, "chair05")
EnableInteriorProp(246785, "chair06")
EnableInteriorProp(246785, "chair07")
-- bikers
EnableInteriorProp(246529, "lower_walls_default")
EnableInteriorProp(246529, "Mural_02")
EnableInteriorProp(246529, "Walls_01")
EnableInteriorProp(246529, "Furnishings_01")
EnableInteriorProp(246529, "Decorative_01")
end)
--]]