TriggerEvent('es:addGroupCommand', 'fix', "mod", function(source, args, user)
	TriggerClientEvent('wk:fixvehicle', user)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "No perms")
end, {help = "Memes"})


