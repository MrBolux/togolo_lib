fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Mr.Bolux as Bob Togolo'
description 'library for TogoloScript'
version '1.0.0'

client_scripts {
    'client/main.lua',
    'client/alerte.lua',
    'client/blips.lua',
    'client/bossMenu.lua',
    'client/stash.lua',
    'client/clothing.lua',
    'client/duty.lua',
    'client/ped.lua',
    'client/radialMenu.lua',
    'client/boombox.lua',
}

server_scripts {
    'server/alerte.lua'
}

shared_scripts {
	'config.lua',
    'shared/utils.lua',
    '@qb-core/shared/locale.lua',
	'locales/fr.lua',
}

dependencys {
    'qb-radialmenu',
    'qb-target'
}