AddEventHandler('chatMessage', function(source, name, message)
  if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
  PerformHttpRequest('https://discordapp.com/api/webhooks/446762068155039756/DDFaiPNiKKX17TVDBrsWWfx52k4c6BHXEqObNKOqzClN1LQ2KLdO7BLHG0vTtsvv-onA', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end)
function sendToDiscord(name, message)
  if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
  PerformHttpRequest('https://discordapp.com/api/webhooks/446762068155039756/DDFaiPNiKKX17TVDBrsWWfx52k4c6BHXEqObNKOqzClN1LQ2KLdO7BLHG0vTtsvv-onA', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end
AddEventHandler('playerConnecting', function()
  sendToDiscord('ManchesterIsGay', GetPlayerName(source) .. '  Joined. ')
end)

AddEventHandler('playerDropped', function(reason)
  sendToDiscord('SancBot', GetPlayerName(source) .. ' Left.  (' .. reason .. ')')
end)
