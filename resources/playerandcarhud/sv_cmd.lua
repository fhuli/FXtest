-- Made by FAXES.
--
AddEventHandler('chatMessage', function(Source, Name, Msg)
    args = stringsplit(Msg, " ")
    CancelEvent()
    if string.find(args[1], "/") then
        local cmd = args[1]
        table.remove(args, 1)
	end
end)


RegisterServerEvent("updateClients")
AddEventHandler("updateClients", function(test)
	local _source = source
    TriggerClientEvent('changeProximity', -1, test)
		               	            TriggerClientEvent("pNotify:SetQueueMax", _source, "lmao", 1)
									TriggerClientEvent("pNotify:SendNotification", _source, {
							            text = "Your VOIP has been set to "..test..".",
							            type = "info",
							            queue = "lmao",
							            timeout = 3000,
							            layout = "CenterLeft"
						       		})
end)



function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

