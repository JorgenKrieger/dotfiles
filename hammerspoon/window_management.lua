local hotkey = require "hs.hotkey"
local keys = require "keys"
local log = hs.logger.new("WinManage", "debug")

-- Set animation
hs.window.animationDuration = 0

-- Define positions
local positions = {
	["Fullscreen"] = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 },

	["Top 50%"] = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
	["Bottom 50%"] = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },

	["Left 33%"] = { x = 0.00, y = 0.00, w = 0.33, h = 1.00 },
	["Left 50%"] = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
	["Left 67%"] = { x = 0.00, y = 0.00, w = 0.67, h = 1.00 },

	["Right 33%"] = { x = 0.67, y = 0.00, w = 0.33, h = 1.00 },
	["Right 50%"] = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
	["Right 67%"] = { x = 0.33, y = 0.00, w = 0.67, h = 1.00 },
}

-- Error handling
function alertCannotManipulateWindow()
	hs.alert.show("Can't move window")
end

-- Generic movement handling
function move(position)
	local win = hs.window.focusedWindow()
	if not win then
		alertCannotManipulateWindow()
		return
	end
	win:move(position, nil, true)
end

-- Generic keybinds
for key,value in pairs(Keys.windowManagement) do
	local keypress = Keys.windowManagement[key]
	hotkey.bind(keypress[1], keypress[2], function() move(positions[key]) end)
end

-- Move monitor
for key,value in pairs(Keys.moveMonitor) do
	local keypress = Keys.moveMonitor[key]
	hotkey.bind(keypress[1], keypress[2],hs.notify:getFunctionTag()
		local win = hs.window.focusedWindow()
		if not win then
			alertCannotManipulateWindow()
			return
		end

		if key == "Up" then
			win:moveOneScreenNorth()
		elseif key == "Right" then
			win:moveOneScreenEast()
		elseif key == "Down" then
			win:moveOneScreenSouth()
		elseif key == "Left" then
			win:moveOneScreenWest()
		else
			log.e("This key value is not supported. Provide a direction of a string.")
		end
	end)
end

-- Center window
hotkey.bind({ "alt", "cmd" }, "C", function()
	hs.window.focusedWindow():centerOnScreen(nil, true)
end)