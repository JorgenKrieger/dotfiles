local application = require "hs.application"
local keys = require "keys"

-- Hammerspoon management
keys.bindKeyFor("Reload", function()
  hs.reload()
end)

-- Simple triggers
for applicationName, _ in pairs(keys.triggers) do
  keys.bindKeyFor(applicationName, function()
    application.launchOrFocus(applicationName)
  end)
end
