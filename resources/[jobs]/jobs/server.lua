
---------------------------------- FUNCTIONS ----------------------------------

-- Fonction : Récupère le nom du travail
-- Paramètre(s) : id = ID du travail
function nameJob(id)
  return MySQL.Sync.fetchScalar("SELECT job_name FROM jobs WHERE job_id = @namejob", {['@namejob'] = id})
end

-- Fonction : Récupère le travail du joueur
-- Paramètre(s) : player = Identifiant du joueur
function whereIsJob(player)
  return MySQL.Sync.fetchScalar("SELECT job FROM users WHERE identifier = @username", {['@username'] = player})
end

-- Fonction : Mets à jour le travail du joueur
-- Paramètre(s) : player = Identifiant du joueur, id = ID du travail
function updatejob(player, id)
  local job = id
  return MySQL.Sync.execute("UPDATE users SET job=@value WHERE identifier = @username", {['@value'] = job, ['@username'] = player})
end

---------------------------------- EVENEMENT ----------------------------------

RegisterServerEvent('jobssystem:jobs')
AddEventHandler('jobssystem:jobs', function(id)
  TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.getIdentifier()
        local jobName = nameJob(id)
        updatejob(player, id)
        TriggerClientEvent("jobssystem:updateJob", source, jobName)
		TriggerClientEvent("police:notify", source, "CHAR_MP_STRIPCLUB_PR", 1, "Job", false, "Your Job is now : ".. jobName)
  end)
end)

AddEventHandler('es:playerLoaded', function(source)
  TriggerEvent('es:getPlayerFromId', source, function(user)
      local player = user.getIdentifier()
      local WIJ = whereIsJob(player)
      local jobName = nameJob(WIJ)
      TriggerClientEvent("jobssystem:updateJob", source, jobName)
    end)
end)

