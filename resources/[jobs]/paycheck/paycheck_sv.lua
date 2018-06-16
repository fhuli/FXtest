RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
	local salary = math.random(100,250) 
    TriggerEvent('es:getPlayerFromId', source, function(user)
    
    local player = user.getIdentifier()
    local result = MySQL.Sync.fetchAll("SELECT salary FROM users INNER JOIN jobs ON users.job = jobs.job_id WHERE identifier = @username", {['@username'] = player})

            if (result) then 
                user.addBank((salary + result[1].salary))
                TriggerClientEvent("police:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "City Paycheck : ~g~$: "..salary.." ~s~~n~Work paycheck : + ~g~$: "..result[1].salary.."")
            end
            	local bank = MySQL.Sync.fetchScalar("SELECT bank FROM users WHERE identifier = @username", {['@username'] = player})

            	if (bank) then 
            		local balance = user.getBank()
            		user.getBank(balance)
            		TriggerClientEvent("police:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Bank balance ~g~$: " ..balance.."")
            		TriggerClientEvent("banking:updateBalance", source, user.getBank())
            		print("Updated bank status of" ..player)
            	end
        	end)
    	end)


