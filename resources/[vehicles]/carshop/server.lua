--[[Info]]--


RegisterServerEvent('CheckMoneyForVeh')
AddEventHandler('CheckMoneyForVeh', function(vehicle,price, name, brutmodel, plate, instance)
	TriggerEvent('es:getPlayerFromId', source, function(user)

	if (tonumber(user.getMoney()) >= tonumber(price)) then
    local player = user.getIdentifier()
    print("Yes mate!")
			-- Pay the shop (price)
			user.removeMoney((price))
      -- Save this shit to the database
      -- Trigger some client stuff
      TriggerClientEvent('FinishMoneyCheckForVeh', source)
      TriggerClientEvent("police:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Thank you for your purchase!\n")
    else
      -- Inform the player that he needs more money
    TriggerClientEvent("police:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "You dont have enough cash to buy this car!\n")
 	 end
 	 end)
end)