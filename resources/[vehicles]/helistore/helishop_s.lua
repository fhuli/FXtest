

RegisterServerEvent('helishop:CheckMoneyForHeli')
RegisterServerEvent('helishop:BuyForHeli')


AddEventHandler('helishop:CheckMoneyForHeli', function(name, heli, price)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    if (tonumber(user.getMoney()) >= tonumber(price)) then
      local player = user.getIdentifier()
      local heli = heli
      local name = name
      user.removeMoney((price))
      TriggerClientEvent('helishop:FinishMoneyCheckForHeli',source, name, heli, price)
      TriggerClientEvent("police:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Enjoy your heli you smelly little meme!\n")
    else
      TriggerClientEvent("police:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "You're poor lel!\n")
    end
  end)
end)

AddEventHandler('helishop:BuyForHeli', function(name, heli, price, plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
  TriggerEvent('es:getPlayerFromId', source, function(user)

    local player = user.getIdentifier()
    local name = name
    local price = price
    local heli = heli
    local plate = plate
    local state = "Sortit"
    local primarycolor = primarycolor
    local secondarycolor = secondarycolor
    local pearlescentcolor = pearlescentcolor
    local wheelcolor = wheelcolor
    MySQL.Async.execute("INSERT INTO user_heli (`identifier`, `heli_name`, `heli_model`, `heli_price`, `heli_plate`, `heli_state`, `heli_colorprimary`, `heli_colorsecondary`, `heli_pearlescentcolor`, `heli_wheelcolor`) VALUES ('@username', '@name', '@heli', '@price', '@plate', '@state', '@primarycolor', '@secondarycolor', '@pearlescentcolor', '@wheelcolor')",
    {['@username'] = player, ['@name'] = name, ['@heli'] = heli, ['@price'] = price, ['@plate'] = plate, ['@state'] = state, ['@primarycolor'] = primarycolor, ['@secondarycolor'] = secondarycolor, ['@pearlescentcolor'] = pearlescentcolor, ['@wheelcolor'] = wheelcolor}, function(result)
  	end)
  end)
end)
