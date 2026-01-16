
local Definitions = {}

local contract_defintions = {}

-- Load all defined contracts.
function Definitions.load()
    Draft.getDrafts():forEach(function(draft)
        local meta = draft:getMeta()
        if meta and meta.tags and meta.tags.contract then
            local def = Definitions.normalize(meta)
            contract_defintions[def.id] = def
        end
    end)
end

-- Set contract properties to default values if they haven't been explicitly stated.
function Definitions.normalize(meta)
    local contract = {}

    for k, v in pairs(meta) do
        contract[k] = v
    end

    contract.id = contract['contract id']
    contract.advance = contract['advance'] or 0
    contract.completion = contract['completion'] or 0
    contract.cancellation = contract['cancellation'] or 0
    contract.requirements = contract['requirements'] or {}
    contract.goals = contract['goals'] or {}

    contract.goals.completed_contracts = contract.goals['completed contracts'] or nil -- ?

    if contract.goals.buildings then 
        for _, b in ipairs(contract.goals.buildings) do
            b.count = b['count'] or 1
        end
    end

    if contract.goals.roads then 
        for _, r in ipairs(contract.goals.roads) do
            r.count = r['count'] or 1
        end
    end

    if contract.goals.population then 
        for _, p in ipairs(contract.goals.population) do
            p.level = p['level']
        end
    end

    return contract
end

-- Return a contract definition with provided ID.
function Definitions.get(id)
    return contract_defintions[id]
end

return Definitions
