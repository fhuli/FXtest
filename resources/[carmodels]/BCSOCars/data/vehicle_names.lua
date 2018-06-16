	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	-- SHERIFF
	AddTextEntry('0x9BAA707C', 'SHERIFF')
