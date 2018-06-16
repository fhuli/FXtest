-- CHATRP

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/dispatch" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "Dispatch : " .. name, { 255, 0, 0 }, string.sub(msg,10))
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/ooc" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "OOC : " .. name, { 128, 128, 128 }, string.sub(msg,5))
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/me" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "Me : " .. name, { 30, 144, 255  }, string.sub(msg,5))
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/911" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "911 : " .. name, { 255, 0, 0 }, string.sub(msg,5))
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
  if msg:sub(1, 1) == "/" then
    sm = stringsplit(msg, " ");
	   if sm[1] == "/twt" then
		     CancelEvent()
	TriggerClientEvent('chatMessage', -1, "^0[^4Twitter^0]", {30, 144, 255}, " (^3" .. GetPlayerName(source) .." ^5Tweets^0 ) " .. string.sub(msg,7))
     end
  end

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




