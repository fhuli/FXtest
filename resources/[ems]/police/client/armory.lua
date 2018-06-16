--[[
            Cops_FiveM - A cops script for FiveM RP servers.
              Copyright (C) 2018 FiveM-Scripts
              
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.
You should have received a copy of the GNU Affero General Public License
along with Cops_FiveM in the file "LICENSE". If not, see <http://www.gnu.org/licenses/>.
]]

local buttonsCategories = {}
local buttonWeaponList = {}

function load_armory()
	for k in ipairs (buttonsCategories) do
		buttonsCategories [k] = nil
	end
	
	for k in ipairs (buttonWeaponList) do
		buttonWeaponList [k] = nil
	end
	
	buttonsCategories[#buttonsCategories+1] = {name = i18n.translate("armory_basic_kit"), func = "giveBasicKit", params = ""}
	buttonsCategories[#buttonsCategories+1] = {name = i18n.translate("armory_add_bulletproof_vest_title"), func = "addBulletproofVest", params = ""}
	buttonsCategories[#buttonsCategories+1] = {name = i18n.translate("armory_remove_bulletproof_vest_title"), func = "removeBulletproofVest", params = ""}
	buttonsCategories[#buttonsCategories+1] = {name = i18n.translate("armory_weapons_list"), func = "openWeaponListMenu", params = ""}

	

	


	buttonWeaponList[#buttonWeaponList+1] = {name = i18n.translate("WEAPON_COMBATPISTOL"), func = 'giveCombatPistol', params = ""}
	buttonWeaponList[#buttonWeaponList+1] = {name = i18n.translate("WEAPON_PISTOL50"), func = 'givePistol50', params = ""}
	buttonWeaponList[#buttonWeaponList+1] = {name = i18n.translate("WEAPON_PUMPSHOTGUN"), func = 'givePumpShotgun', params = ""}
	buttonWeaponList[#buttonWeaponList+1] = {name = i18n.translate("WEAPON_ASSAULTSMG"), func = 'giveAssaultSmg', params = ""}
	buttonWeaponList[#buttonWeaponList+1] = {name = i18n.translate("WEAPON_ASSAULTSHOTGUN"), func = 'giveAssaultShotgun', params = ""}
	buttonWeaponList[#buttonWeaponList+1] = {name = i18n.translate("WEAPON_HEAVYSNIPER"), func = 'giveHeavySniper', params = ""}
end

local hashSkin = GetHashKey("mp_m_freemode_01")


function giveBasicKit()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 200, true, true)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 200, true, true)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 200, true, true)

	PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
end


function addBulletproofVest()
	if(config.enableOutfits == true) then
		if(GetEntityModel(PlayerPedId()) == hashSkin) then
			SetPedComponentVariation(PlayerPedId(), 9, 4, 1, 2)
		else
			SetPedComponentVariation(PlayerPedId(), 9, 6, 1, 2)
		end
	end

	SetPedArmour(PlayerPedId(), 100)
	PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
end

function removeBulletproofVest()
	if(config.enableOutfits == true) then
		SetPedComponentVariation(PlayerPedId(), 9, 0, 1, 2)
	end

	SetPedArmour(PlayerPedId(), 0)
	PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
end

function CloseArmory()
	CloseMenu()
end


function openWeaponListMenu()
	CloseMenu()
	SendNUIMessage({
		title = i18n.translate("armory_weapons_list"),
		buttons = buttonWeaponList,
		action = "setAndOpen"
	})
	
	anyMenuOpen.menuName = "armory-weapon_list"
	anyMenuOpen.isActive = true
end


function giveCombatPistol()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 200, true, true)
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
end

function givePistol50()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), 200, true, true)
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))
end

function givePumpShotgun()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), 200, true, true)
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))
end

function giveAssaultSmg()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), 200, true, true)
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))
end

function giveAssaultShotgun()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), 200, true, true)
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))
end

function giveHeavySniper()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), 200, true, true)
end



function OpenArmory()
	if((anyMenuOpen.menuName ~= "armory" and anyMenuOpen.menuName ~= "armory-weapon_list") and not anyMenuOpen.isActive) then
		SendNUIMessage({
			title = i18n.translate("armory_global_title"),
			buttons = buttonsCategories,
			action = "setAndOpen"
		})
		
		anyMenuOpen.menuName = "armory"
		anyMenuOpen.isActive = true
	end
end

function BackArmory()
	OpenArmory()
	CloseArmory()
end