ui_page 'ui.html'

files {
	'ui.html',
	'pricedown.ttf',
	'job-icon.png'
}

client_script "client.lua"
server_script "server.lua"
server_script '@mysql-async/lib/MySQL.lua'
