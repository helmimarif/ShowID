onlinePlayers = {}

RegisterServerEvent('showid:add-id')
AddEventHandler('showid:add-id', function()
    TriggerClientEvent("showid:client:add-id", source, onlinePlayers)
    local topText = "undefined " .. Config.which
    local identifiers = GetPlayerIdentifiers(source)
    if Config.which == "steam" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'steam:') then
                topText = v
                break
            end
        end
    elseif Config.which == "steamv2" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'steam:') then
                topText = string.sub(v, 7)
                break
            end
        end
    elseif Config.which == "license" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'license:') then
                topText = v
                break
            end
        end
    elseif Config.which == "licensev2" then 
        for k,v in ipairs(identifiers) do
            if string.match(v, 'license:') then
                topText = string.sub(v, 9)
                break
            end
        end
    elseif Config.which == "name" then 
        topText = GetPlayerName(source)
    end
    onlinePlayers[tostring(source)] = topText
    TriggerClientEvent("showid:client:add-id", -1, topText, tostring(source))
end)

AddEventHandler('playerDropped', function(reason)
    onlinePlayers[tostring(source)] = nil
end)