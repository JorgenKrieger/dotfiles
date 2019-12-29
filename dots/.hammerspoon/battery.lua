local alert = require "hs.alert"
local battery = require "hs.battery"
local brightness = require "hs.brightness"

batteryWatch = battery.watcher.new(function()
  local percentage = battery.percentage()

  if percentage == 50 or percentage == 25 then
    alert.show("Battery " .. math.floor(battery.timeRemaining()) .. "min remaining")
  end

  if not battery.isCharging() then
    -- Only process steps of 10%
    local lux = math.floor(percentage/10) * 10 + brightness.ambient()

    -- Set brightness only if lower than preset
    if lux < brightness.get() then
      brightness.set(lux)
    end
  else
    -- Battery charging
    if percentage <= 25 then
      brightness.set(50)
    else
      brightness.set(100)
    end
  end
end)

batteryWatch:start()
