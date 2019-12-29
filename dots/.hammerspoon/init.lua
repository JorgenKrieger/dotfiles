local alert = require "hs.alert"
local notify = require "hs.notify"

-- Default style
alert.defaultStyle.strokeColor = {white = 1, alpha = 0}
alert.defaultStyle.radius = 3
alert.defaultStyle.textSize = 16

-- Load scripts
require "window_management"
require "triggers"

-- Done
notify.show("Hammerspoon", "", "Configuration loaded")
