-- Creating two arrays of areas, for the big tornados and the small ones
BIGTORNADOS = {
    {
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 1, 0, 0, 2, 0, 0, 1 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 }
    },
    {
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 1, 0, 1, 2, 1, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 1, 0, 1, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 }
    },
    {
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 1, 0, 1, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 2, 0, 0, 1 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 }
    },
    {
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 1, 0, 1, 2, 1, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 1, 0, 1, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 }
    }
}

SMALLTORNADOS = {
    {
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 1, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 2, 0, 0, 0 },
        { 0, 1, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 1, 0, 0, 0 }
    },
    {
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 1, 0 },
        { 0, 0, 0, 2, 0, 0, 0 },
        { 0, 0, 0, 1, 0, 1, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 }
    },
    {
        { 0, 0, 0, 1, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 1, 0, 0, 0 },
        { 0, 0, 0, 2, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 },
        { 0, 0, 0, 0, 0, 0, 0 }
    }
}

-- function to create the combats
function createCombats(areas)
    combats = {}
    for k, v in pairs(areas) do                                                     -- For each area in the array, create a combat object
        combat = Combat()
        combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)                    -- Parameters of the object: it will do ice damage
        combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)               -- The visual effect will be icetornado
        combat:setArea(createCombatArea(v))                                         -- setting the corresponding area to the object
        function onGetFormulaValues(player, level, magicLevel)                      -- function to calculate the damages it will do, 
            local min = (level / 5) + (magicLevel * 5.5) + 25
            local max = (level / 5) + (magicLevel * 11) + 50
            return -min, -max
        end
        combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
        table.insert(combats, combat)                                               -- Adding the object we created into the array of objects
    end
    return combats
end

-- Creating the arrays of combat objects fot the small and big tornados 
combatBigs = createCombats(BIGTORNADOS)
combatSmalls = createCombats(SMALLTORNADOS)

function cast(combat, creature, variant)
    combat:execute(creature, variant)                                                -- Execute the instance(s) of the combat(s)
end

-- Function to cast the combats
function onCastSpell(creature, variant)
    for i = 1, 3, 1 do                                                                          -- Each combat will be casted 3 times
        for k, v in pairs(combatBigs) do                                                        -- For each combat in the combatBig array
            addEvent(cast, 250 * (k - 1)+ (1000 * (i - 1)), v, creature.uid, variant)           -- Create an event that will cast the combat every 250 millisecond
        end
    end
    for i = 1, 3, 1 do                                                                          -- Do the same thing for the small tornados
        for k, v in pairs(combatSmalls) do
            addEvent(cast, (300 * (k - 1)) + (900 * (i - 1)), v, creature.uid, variant)         -- addEvent arguments: function, delay, ...arguments of the function)
        end
    end
    return true
end
