--resource_type 'gametype' { name = 'RORP'}

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
    'voip.lua',
    'client.lua',
    'carhud.lua',
    'nativeui.net.dll',
    'vehiclecontrols.net.dll'
}


server_script 'sv_cmd.lua'