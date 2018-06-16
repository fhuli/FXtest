--[[

  dnaFramework Door Manager    
  Coded by Darklandz
  Version: 1.0

  Allows cops to lock/unlock doors at the police stations/jail/...

  Resource File
]]

--
-- Load client scripts
--

client_script {
  "client.lua"
}

--
-- Load server script
--

server_scripts {
  "@mysql-async/lib/MySQL.lua",
  "server.lua"
}
