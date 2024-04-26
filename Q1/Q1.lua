--[[local function releaseStorage(player)

  player:setStorageValue(1000, -1)

end

function onLogout(player)

  if player:getStorageValue(1000) == 1 then

    addEvent(releaseStorage, 1000, player)

  end

  return true

end ]]--

-- adding missing storage Id argument to function declaration
local function releaseStorage(storageId, player)

    -- replacing 1000 by the storage Id argument
    player:setStorageValue(storageId, -1) 

  end

  function onLogout(player)

    -- -1 being the default value, we enter the condition only if the storage value if not -1
    if player:getStorageValue(1000) ~= -1 then 

      addEvent(releaseStorage, 1000, player)

    end

    return true

  end