--[[function do_sth_with_PlayerParty(playerId, membername)

  player = Player(playerId)

  local party = player:getParty()

  for k,v in pairs(party:getMembers()) do

    if v == Player(membername) then

      party:removeMember(Player(membername))

    end

  end

end]]--


function do_sth_with_PlayerParty(playerId, membername)

    player = Player(playerId)
  
    local party = player:getParty()
  
    for k,v in pairs(party:getMembers()) do
  
      if v == membername then                             -- compare v (the members of the party) directly with membername
  
        party:removeMember(membername)                    -- If we find the Membername is found, we remove that member from the party
  
      end
  
    end
  
end