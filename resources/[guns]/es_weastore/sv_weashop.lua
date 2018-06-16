
local max_number_weapons = 6 --maximum number of weapons that the player can buy. Weapons given at spawn doesn't count.
local cost_ratio = 100 --Ratio for withdrawing the weapons. This is price/cost_ratio = cost.

RegisterServerEvent('CheckMoneyForWea')
AddEventHandler('CheckMoneyForWea', function(weapon,price)
	TriggerEvent('es:getPlayerFromId', source, function(user)

		if (tonumber(user.getMoney()) >= tonumber(price)) then
			local player = user.getIdentifier()
			local nb_weapon = 0
			local result = MySQL.Sync.fetchAll("SELECT * FROM user_weapons WHERE identifier = @username",{['@username'] = player})
				if result then
					for k,v in ipairs(result) do
						nb_weapon = nb_weapon + 1
					end
				end
				if (tonumber(max_number_weapons) > tonumber(nb_weapon)) then
					user.removeMoney((price))
					MySQL.Async.execute("INSERT INTO user_weapons (identifier,weapon_model,withdraw_cost) VALUES (@identifier,@weapon,@cost)",
						{['@identifier'] = player, ['@weapon'] = weapon, ['@cost'] = (price)/cost_ratio})
					-- Trigger some client stuff
					TriggerClientEvent('FinishMoneyCheckForWea',source)
					TriggerClientEvent("police:notify", source, "CHAR_AMMUNATION", 1, "AMMUNATION", false, "Thank you for your purchase, have a good day!\n")
				else
					TriggerClientEvent('ToManyWeapons',source)
					TriggerClientEvent("police:notify", source, "CHAR_AMMUNATION", 1, "AMMUNATION", false, "You have too many weapons for your pockets (max: "..max_number_weapons..")\n")
				end
			else
			TriggerClientEvent("police:notify", source, "CHAR_AMMUNATION", 1, "AMMUNATION", false, "You dont have enough money.\n")
		end
	end)
end)

RegisterServerEvent("weaponshop:playerSpawned")
AddEventHandler("weaponshop:playerSpawned", function(spawn)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('weaponshop:GiveWeaponsToPlayer', source)
	end)
end)

-- NOTE: Ajouter une fonction pour remove l arme à la mort du joueur in game et in db

RegisterServerEvent("weaponshop:GiveWeaponsToPlayer")
AddEventHandler("weaponshop:GiveWeaponsToPlayer", function(player)
	TriggerEvent('es:getPlayerFromId', player, function(user)

		local identifier = user.getIdentifier()
		local delay = nil

		local result = MySQL.Sync.fetchAll("SELECT * FROM user_weapons WHERE identifier = @username",{['@username'] = identifier})

			delay = 2000
			if (result) then
				for k,v in ipairs(result) do
					TriggerClientEvent("giveWeapon", player, v.weapon_model, delay)
				end
			end
		end)
	end)