-- Default style
hs.alert.defaultStyle.strokeColor = {white = 1, alpha = 0}
hs.alert.defaultStyle.radius = 3

-- Load scripts
require "window_management"

-- Bind helper hotkeys
hs.hotkey.bind({ "ctrl", "alt", "cmd " }, "R", function()
    hs.reload()
end)

hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "C", function()
    hs.openConsole();
end)


-- Done
hs.notify.show("Hammerspoon", "", "Configuration loaded")
hs.console.clearConsole()
