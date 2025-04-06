local killstreak = 0

AddEventHandler('gameEventTriggered', function(eventName, args)
    if eventName == 'CEventNetworkEntityDamage' then
        local victim = args[1]
        local attacker = args[2]
        local isDead = args[6] == 1

        if isDead and attacker == PlayerPedId() and victim ~= attacker then
            TriggerServerEvent('esx_killstreak:increment')
        end
        if isDead and victim == PlayerPedId() then
            TriggerServerEvent('esx_killstreak:reset')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if IsPlayerDead(PlayerId()) then
            TriggerServerEvent('esx_killstreak:reset')
            Citizen.Wait(2000)
        end
    end
end)

RegisterNetEvent('esx_killstreak:update')
AddEventHandler('esx_killstreak:update', function(newKillstreak)
    killstreak = newKillstreak
    
    if killstreak >= Config.MinKills then
        local color = Config.KillstreakColors[1].color
        for _, streak in ipairs(Config.KillstreakColors) do
            if killstreak >= streak.kills then
                color = streak.color
            else
                break
            end
        end

        SendNUIMessage({
            type = 'updateKillstreak',
            kills = killstreak,
            r = color.r,
            g = color.g,
            b = color.b,
            a = color.a / 255
        })
    else
        SendNUIMessage({
            type = 'hideKillstreak'
        })
    end
end)