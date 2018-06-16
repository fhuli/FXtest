
--Intégration de la position dans MySQL
RegisterServerEvent("project:savelastpos")
AddEventHandler("project:savelastpos", function( LastPosX , LastPosY , LastPosZ , LastPosH )
	TriggerEvent('es:getPlayerFromId', source, function(user)
		--Récupération du SteamID.
		local player = user.getIdentifier()
		--Formatage des données en JSON pour intégration dans MySQL.
		local LastPos = "{" .. LastPosX .. ", " .. LastPosY .. ",  " .. LastPosZ .. ", " .. LastPosH .. "}"
		--Exécution de la requêtes SQL.
		MySQL.Sync.execute("UPDATE users SET lastpos = @lastpos WHERE identifier = @username", {['@username'] = player, ['@lastpos'] = LastPos})
		--Affichage d'un message confirmant la sauvegarde de la position du joueurs.
	end)
end)


--Récupération de la position depuis MySQL
RegisterServerEvent("project:SpawnPlayer")
AddEventHandler("project:SpawnPlayer", function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		--Récupération du SteamID.
		local player = user.getIdentifier()
		local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @username", {['@username'] =  player})

		-- Vérification de la présence d'un résultat avant de lancer le traitement.
		if(result)then
			for k,v in ipairs(result)do
				if v.lastpos ~= "" then
				-- Décodage des données récupérées
				local ToSpawnPos = json.decode(v.lastpos)
				-- Intégration des données dans les variables dédiées
				local PosX = ToSpawnPos[1]
				local PosY = ToSpawnPos[2]
				local PosZ = ToSpawnPos[3]
				local PosH = ToSpawnPos[4]
				-- On envoie la derniere position vers le client pour le spawn
				TriggerClientEvent("project:spawnlaspos", source, PosX, PosY, PosZ)
				end
			end
		end
	end)
end)