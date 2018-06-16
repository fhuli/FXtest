resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependency 'clothing'
dependency 'police'

client_script 'cl_healthplayer.lua'
client_script 'cl_emergency.lua'
client_script 'cl_emsgarage.lua'

server_script '@mysql-async/lib/MySQL.lua'
server_script '@helpers/helpers.lua'
server_script '@user/user.lua'

server_script 'sv_emergency.lua'

export "isPlayerAMedic"
export "getIsInService"
export "getMedicCount"
export "getMedics"
export "getRespawnTime"
export "getLimboTime"
export "hasMiracleBeenAttempted"