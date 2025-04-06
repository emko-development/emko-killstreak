fx_version 'cerulean'
game 'gta5'

author 'emko'
description 'killstreak'
version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua'
}

server_scripts {
    'server/main.lua'
}

client_scripts {
    'client/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css'
}

dependency 'es_extended'