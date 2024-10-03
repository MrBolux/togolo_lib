function removeRadialOptions(menuItems)
    if menuItems then
        for _, item in ipairs(menuItems) do
            exports['qb-radialmenu']:RemoveOption(item.id)
        end
    end
end

function updateRadialOption(menuItems, optionsRadialMenu)
    removeRadialOptions(menuItems)
    if optionsRadialMenu then
        for _, item in ipairs(optionsRadialMenu) do
            item.id = exports['qb-radialmenu']:AddOption(item)
        end
        return optionsRadialMenu
    end
end

exports('updateRadialOption', updateRadialOption)
exports('removeRadialOptions', removeRadialOptions)
