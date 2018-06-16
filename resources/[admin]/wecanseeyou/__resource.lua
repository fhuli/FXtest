resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

dependency 'NativeUI'

server_scripts {
	"admin_server.lua",
	"version",
	"language/en.json",
	"language/de.json",
	"language/fr.json",
	"language/sv.json",
	"language/it.json",
	"sv_solokick.lua",
	"ac_s.lua",
	"sv_afkkick.lua",
}

client_scripts {
	"@NativeUI/NativeUI.lua",
	"admin_client.lua",
	"gui_c.lua",
	"ids.lua",
	"cl_solokick.lua",
	"ac_c.lua",
	"cl_afkkick.lua",
	"utils.lua"
}
