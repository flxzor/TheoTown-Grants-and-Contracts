
-- This module handles data storage and serialization. Contract data should preferably persist between sessions.

local Storage = {}

-- Initialize an load stored data.
function Storage.init()
    local s = Util.optStorage(City.getStorage(), '$kulche_contracts_script_storage_00')

    s.contracts = s.contracts or {
        active = {},
        completed = {}
    }

    return s
end

return Storage
