RegisterServerEvent('esx_killstreak:increment')
AddEventHandler('esx_killstreak:increment', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local currentKillstreak = (xPlayer.get('killstreak') or 0) + 1
        xPlayer.set('killstreak', currentKillstreak)
        TriggerClientEvent('esx_killstreak:update', source, currentKillstreak)
    end
end)

RegisterServerEvent('esx_killstreak:reset')
AddEventHandler('esx_killstreak:reset', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.set('killstreak', 0)
        TriggerClientEvent('esx_killstreak:update', source, 0)
    end
end)