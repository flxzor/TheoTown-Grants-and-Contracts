
local Definitions = require('definitions')
local Storage = require('storage')
local Manager = require('manager')

function script:lateInit()
    Definitions.load()
end

function script:enterCity()
    Storage.init()
    Manager.initCity()
    Requirements.initCity()
end
