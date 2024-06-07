fx_version 'adamant'
game 'gta5'

author 'Prestige Studios'
description 'Advanced Police Shots Fired Dispatch System'



shared_script 'config.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
    
}
