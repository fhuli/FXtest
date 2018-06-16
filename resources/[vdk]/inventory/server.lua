

RegisterServerEvent("item:getItems")
RegisterServerEvent("item:updateQuantity")
RegisterServerEvent("item:setItem")
RegisterServerEvent("item:reset")
RegisterServerEvent("item:sell")
RegisterServerEvent("player:giveItem")
RegisterServerEvent("player:swapMoney")
RegisterServerEvent("player:getInfos")

local items = {}

AddEventHandler("item:getItems", function()
    items = {}
    local player = getPlayerID(source)
    -- for i = 0, 23 do
        local qItems = MySQL.Sync.fetchAll("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE user_id = @username", {['@username'] = player})
            if (qItems) then
                for _, item in ipairs(qItems) do
                    t = { ["quantity"] = item.quantity, ["libelle"] = item.libelle, ["canUse"] = item.canUse }
                    table.insert(items, tonumber(item.item_id), t)
                end
            end
            TriggerClientEvent("gui:getItems", source, items)
    -- end
end)

AddEventHandler("item:setItem", function(item, quantity)
    local player = getPlayerID(source)
    MySQL.Async.execute("INSERT INTO user_inventory (`user_id`, `item_id`, `quantity`) VALUES (@player, @item, @qty)",
        {['@player'] = player, ['@item'] = item, ['@qty'] = quantity },
        function(rowsChanged)
            print(rowsChanged)
        end)
end)

AddEventHandler("item:updateQuantity", function(qty, id)
    local player = getPlayerID(source)
    MySQL.Async.execute("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = @username AND `item_id` = @id",
    { ['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id) })
end)

AddEventHandler("item:reset", function()
    local player = getPlayerID(source)
    MySQL.Async.execute("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = @username", { ['@username'] = player, ['@qty'] = 0 })
end)

AddEventHandler("item:sell", function(id, qty, price)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.getIdentifier()
        user.addMoney(tonumber(price))
    end)
end)

AddEventHandler("player:giveItem", function(item, name, qty, target)
    local player = getPlayerID(source)
    local total = MySQL.Sync.fetchScalar("SELECT SUM(quantity) as total FROM user_inventory WHERE user_id = '@username'", { ['@username'] = player })
    if (total + qty <= 20) then
        TriggerClientEvent("player:looseItem", source, item, qty)
        TriggerClientEvent("player:receiveItem", target, item, qty)
        TriggerClientEvent("police:notify", target, "CHAR_MP_STRIPCLUB_PR", 1, "Mairie", false, "You just received: " .. qty .. " " .. name)
    end
end)

AddEventHandler("player:swapMoney", function(amount, target)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        if user.money - amount >= 0 then
            user.removeMoney(amount)
            TriggerEvent('es:getPlayerFromId', target, function(user) user:addMoney(amount) end)
        end
    end)
end)

AddEventHandler("player:getInfos", function()
    MySQL.Async.fetchAll("SELECT name, number FROM users WHERE identifier = @player",
    {['@player'] = getPlayerID(source)},
    function(infos)
        nameSplit = stringSplit(infos[1].name, " ")
        local prenom = nameSplit[1]
        local nom = nameSplit[2]
        TriggerClientEvent("player:setInfos", source, prenom, nom, infos[1].number)
    end)
end)

AddEventHandler("player:showIdCard", function(infos, target)
    TriggerClientEvent("player:seeIdCard", target, infos)
end)

-- get's the player id without having to use bugged essentials
function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

-- gets the actual player id unique to the player,
-- independent of whether the player changes their screen name
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function stringSplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end