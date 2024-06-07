-- Load the config file
local Config = Config or {}

Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports["es_extended"]:getSharedObject()
        Citizen.Wait(0)
    end
end)

local isShooting = false
local lastShotTime = 0
local gunshotCoords = nil
local gunshotBlip = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        if IsPedShooting(playerPed) and not isShooting then
            isShooting = true
            local currentTime = GetGameTimer()
            if currentTime - lastShotTime >= Config.Cooldown then
                lastShotTime = currentTime
                local playerCoords = GetEntityCoords(playerPed)
                local streetName, crossingRoad = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
                local streetNameText = GetStreetNameFromHashKey(streetName)
                local gender = IsPedMale(playerPed) and "Male" or "Female"
                local weaponHash = GetSelectedPedWeapon(playerPed)
                if not Config.BlacklistedWeapons[weaponHash] then
                    local weaponName = Config.WeaponNames[weaponHash] or "Unknown"
                    TriggerServerEvent('policeAlert:gunshot', streetNameText, gender, weaponName, playerCoords)
                    -- Send notification to all players
                    TriggerEvent('policeAlert:notify', "Press ~b~E~w~ to attach to latest shots fired.")
                end
            end
        elseif not IsPedShooting(playerPed) and isShooting then
            isShooting = false
        end
    end
end)

RegisterNetEvent('policeAlert:sendNotification')
AddEventHandler('policeAlert:sendNotification', function(streetName, gender, weaponName, coords)
    if ESX and ESX.GetPlayerData() then
        local job = ESX.GetPlayerData().job
        if job and job.name == 'police' then
            gunshotCoords = coords
            PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", -1)
            exports.bulletin:SendAdvanced({
                message = 'A ~b~' .. gender .. '~w~ has been spotted firing a ~b~' .. weaponName .. '~w~ at ~b~' .. streetName,
                title = Config.Notification.Title,
                subject = Config.Notification.Subject,
                icon = Config.Notification.Icon,
            })
            Citizen.Wait(100)
            exports.bulletin:Send({
                message = 'Press <b>E</b> to attach to latest shots fired',
            })
            Citizen.Wait(Config.Blip.Timeout) -- Wait for the configured timeout before clearing gunshotCoords
            gunshotCoords = nil -- Clear the coordinates after the configured timeout
        end
    end
end)

-- The rest of your code remains the same

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if gunshotCoords and IsControlJustPressed(0, 38) then -- 38 is the default key code for "E"
            local currentTime = GetGameTimer()
            if currentTime - lastShotTime <= Config.Blip.Timeout then -- Check if within the configured timeout window
                SetNewWaypoint(gunshotCoords.x, gunshotCoords.y)

                -- Remove existing blip if it exists
                if gunshotBlip then
                    RemoveBlip(gunshotBlip)
                end

                -- Create new blip for gunshots
                gunshotBlip = AddBlipForCoord(gunshotCoords.x, gunshotCoords.y, gunshotCoords.z)
                SetBlipSprite(gunshotBlip, Config.Blip.Sprite) -- Set blip sprite from config
                SetBlipColour(gunshotBlip, Config.Blip.Color) -- Set blip color from config
                SetBlipScale(gunshotBlip, Config.Blip.Scale) -- Set blip scale from config
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Shots Fired")
                EndTextCommandSetBlipName(gunshotBlip)

                exports.bulletin:Send({
                    message = 'A marker has been set on your GPS',
                    theme = 'info'
                })

                -- Remove the blip after the configured timeout
                Citizen.CreateThread(function()
                    Citizen.Wait(Config.Blip.Timeout)
                    if gunshotBlip then
                        RemoveBlip(gunshotBlip)
                        gunshotBlip = nil
                    end
                end)
            end
        end
    end
end)