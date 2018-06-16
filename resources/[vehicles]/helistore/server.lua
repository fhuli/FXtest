--[[Info]]--



--[[Register]]--

RegisterServerEvent('helishop:CheckForSpawnHeli')
RegisterServerEvent('helishop:CheckForHeli')
RegisterServerEvent('helishop:SetHeliOut')
RegisterServerEvent('helishop:SetHeliIn')
RegisterServerEvent('helishop:PutHeliInHeliport')
RegisterServerEvent('helishop:CheckHeliportForHeli')
RegisterServerEvent('helishop:CheckForSelHeli')
RegisterServerEvent('helishop:SelHeli')



--[[Local/Global]]--



helis = {}


--[[Events]]--

AddEventHandler('helishop:CheckForSpawnHeli', function(heli_id)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local heli_id = heli_id
    local player = user.getIdentifier()
    MySQL.Async.fetchAll("SELECT * FROM user_heli WHERE identifier = '@username' AND ID = '@ID'", {['@username'] = player, ['@ID'] = heli_id}, function(result)

    if(result)then
      for k,v in ipairs(result)do
        heli = v.heli_model
        plate = v.heli_plate
        state = v.heli_state
        primarycolor = v.heli_colorprimary
        secondarycolor = v.heli_colorsecondary
        pearlescentcolor = v.heli_pearlescentcolor
        wheelcolor = v.heli_wheelcolor

      local heli = vehicle
      local plate = plate
      local state = state      
      local primarycolor = primarycolor
      local secondarycolor = secondarycolor
      local pearlescentcolor = pearlescentcolor
      local wheelcolor = wheelcolor
      end
    end
    TriggerClientEvent('helishop:SpawnHeli', source, heli, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
    end)
  end)
end)

AddEventHandler('helishop:CheckForHeli', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local state = "Sortit"
    local player = user.getIdentifier()
    MySQL.Async.fetchAll("SELECT * FROM user_heli WHERE identifier = '@username' AND heli_state ='@state'",{['@username'] = player, ['@heli'] = heli, ['@state'] = state}, function(result)
    if(result)then
      for k,v in ipairs(result)do
        heli = v.heli_model
        plate = v.heli_plate
      local heli = heli
      local plate = plate
      end
    end
    TriggerClientEvent('helishop:StoreHeli', source, heli, plate)
	end)
  end)
end)

AddEventHandler('helishop:SetHeliOut', function(heli, plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local heli = heli
    local state = "Sortit"
    local plate = plate
	MySQL.Async.execute("UPDATE user_heli SET heli_state='@state' WHERE identifier = '@username' AND heli_plate = '@plate' AND heli_model = '@heli'",{['@username'] = player, ['@heli'] = heli, ['@state'] = state, ['@plate'] = plate}, function(result)
  	
  	end)
  end)
end)

AddEventHandler('helishop:SetHeliIn', function(plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local plate = plate
    local state = "Rentré"
    MySQL.Async.execute("UPDATE user_heli SET heli_state='@state' WHERE identifier = '@username' AND heli_plate = '@plate'",
      {['@username'] = player, ['@plate'] = plate, ['@state'] = state}, function(result)
      end)
  end)
end)

AddEventHandler('helishop:PutHeliInHeliport', function(heli)
  TriggerEvent('es:getPlayerFromId', source, function(user)

    local player = user.getIdentifier()
    local state ="Rentré"
  
    MySQL.Async.fetchAll("SELECT * FROM user_heli WHERE identifier = '@username'",{['@username'] = player}, function(result)

    if(result)then
      for k,v in ipairs(result)do
        joueur = v.identifier
        local joueur = joueur
       end
    end

    if joueur ~= nil then

      MySQL.Async.execute("UPDATE user_heli SET `heli_state`='@state' WHERE identifier = '@username'",
      {['@username'] = player, ['@state'] = state}, function(result)
      end)
    end
  end)
end)

AddEventHandler('helishop:CheckHeliportForHeli', function()
  helis = {}
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()  
    MySQL.Async.fetchAll("SELECT * FROM user_heli WHERE identifier = '@username'",{['@username'] = player}, function(result)
    if (result) then
        for _, v in ipairs(result) do
            t = { ["id"] = v.id, ["heli_model"] = v.heli_model, ["heli_name"] = v.heli_name, ["heli_state"] = v.heli_state}
            table.insert(helis, tonumber(v.id), t)
        end
    end
  end)  
    TriggerClientEvent('helishop:getHeli', source, helis)
    end)
end)

AddEventHandler('helishop:CheckForSelHeli', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local state = "Sortit"
    local player = user.getIdentifier()
    MySQL.Async.fetchAll("SELECT * FROM user_heli WHERE identifier = '@username' AND heli_state ='@state'",{['@username'] = player, ['@heli'] = heli, ['@state'] = state}, function(result)
    if(result)then
      for k,v in ipairs(result)do
        heli = v.heli_model
        plate = v.heli_plate
      local heli = heli
      local plate = plate
      end
    end
   end)
    TriggerClientEvent('helishop:SelHeli', source, heli, plate)
	end)
  end)
end)


AddEventHandler('helishop:SelHeli', function(plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local plate = plate

    MySQL.Async.fetchAll("SELECT * FROM user_heli WHERE identifier = '@username' AND heli_plate ='@plate'",
    {['@username'] = player, ['@heli'] = heli, ['@plate'] = plate}, function(result)
    if(result)then
      for k,v in ipairs(result)do
        price = v.heli_price
      local price = price / 2
      user.addMoney((price))
      end
    end
   end)
    MySQL.Async.execute("DELETE from user_heli WHERE identifier = '@username' AND heli_plate = '@plate'",
    {['@username'] = player, ['@plate'] = plate}, function(result)
    TriggerClientEvent("police:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Heli Sold!\n")
    end)
  end)
end)

AddEventHandler('playerConnecting', function()
	local player_state = 1
  local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE player_state = '@player_state'",{['@player_state'] = player_state})

	if (result) then
		for i,v in ipairs(result) do

			sum = sum + v.player_state
		end
	else
		sum = 0
	end
	if (sum < 1) then
		local old_state = "Sortit"
		local state = "Rentré"

		MySQL.Async.execute("UPDATE user_heli SET `heli_state`='@state' WHERE heli_state = '@old_state'",
		{['@old_state'] = old_state, ['@state'] = state}, function(result)

    	end)
	end
end)
