local Translations = {
    duty = {
        sign_in = 'Prise de Service'
    },
    stash = {
        open_stash = 'Ouvrir le coffre'
    },
    clothing = {
        open_clothingRooms = 'Ouvrir le vestiaire'
    },
    bossMenu = {
        open_bossMenu = 'Ouvrir le menu boss'
    },
    boomBox = {
        play = 'Interagir'
    }
}

if GetConvar('qb_locale', 'en') == 'fr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end