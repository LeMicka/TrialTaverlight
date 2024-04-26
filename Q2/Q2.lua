--[[function printSmallGuildNames(memberCount)

-- this method is supposed to print names of all guilds that have less than memberCount max members

local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"

local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))

local guildName = result.getString("name")

print(guildName)

end]]--


function printSmallGuildNames(memberCount)

    -- this method is supposed to print names of all guilds that have less than memberCount max members

    local selectGuildQuery = "SELECT `name` FROM `guilds` WHERE `max_members` < %d;"  -- Changed the format of the query, the categories must be between '' 

    local resultID = db.storeQuery(string.format(selectGuildQuery, memberCount))

    if resultID ~= false then                                                         -- There might be more that one guild name returned so the getString and the print must be repeated until there is no name.
        repeat
            local guildName = result.getString(orderQuery, 'name')
            print(guildName)
        until not result.next(resultID)
    end
    

end