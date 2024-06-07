ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports["es_extended"]:getSharedObject()
        Citizen.Wait(0)
    end
end)

RegisterServerEvent('policeAlert:gunshot')
AddEventHandler('policeAlert:gunshot', function(streetName, gender, weaponName, playerCoords)
    TriggerClientEvent('policeAlert:sendNotification', -1, streetName, gender, weaponName, playerCoords)
end)






