local window = require "hs.window"
local screen = require "hs.screen"
local alert = require "hs.alert"
local keys = require "keys"

-- Disable animations
window.animationDuration = 0

-- Get window variables & validate
function getWindow()
  local win = window.focusedWindow()

  if not win then
    alert.show("Can't move window")
    return nil
  end

  local frame = win:frame()
  local screen = win:screen():frame()
  local resolution = win:screen():fullFrame()

  return win, frame, screen, resolution
end



-- GENERAL MANIPULATION
keys.bindKeyFor("Center Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  frame.x = screen.x + (screen.w - frame.w) / 2
  frame.y = screen.y + (screen.h - frame.h) / 2

  window:setFrame(frame)
end)

keys.bindKeyFor("Fullscreen Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  frame.x = screen.x
  frame.y = screen.y
  frame.h = screen.h
  frame.w = screen.w

  window:setFrame(frame)
end)


-- CHANGE MONITOR
keys.bindKeyFor("Monitor Up", function()
  local window = getWindow()
  if not window then return end

  window:moveOneScreenNorth()
end)

keys.bindKeyFor("Monitor Right", function()
  local window = getWindow()
  if not window then return end

  window:moveOneScreenEast()
end)

keys.bindKeyFor("Monitor Down", function()
  local window = getWindow()
  if not window then return end

  window:moveOneScreenSouth()
end)

keys.bindKeyFor("Monitor Left", function()
  local window = getWindow()
  if not window then return end

  window:moveOneScreenWest()
end)


-- LEFT / RIGHT
-- 50% Width
keys.bindKeyFor("Left 1/2 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.h == screen.h and frame.x == screen.x and frame.w == screen.w / 2 then
    -- If already in targeted position
    frame.x = screen.x + screen.w / 2
  else
    frame.x = screen.x
  end

  frame.w = screen.w / 2
  frame.h = screen.h
  frame.y = screen.y

  window:setFrame(frame)
end)

keys.bindKeyFor("Right 1/2 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.h == screen.h and frame.x == screen.x + screen.w / 2 and frame.w == screen.w / 2 then
    -- If already in targeted position
    frame.x = screen.x
  else
    frame.x = screen.x + screen.w / 2
  end

  frame.w = screen.w / 2
  frame.h = screen.h
  frame.y = screen.y

  window:setFrame(frame)
end)

-- 33% Width
keys.bindKeyFor("Left 1/3 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.w == math.floor(screen.w / 3) and frame.x == screen.x then
    -- Currently in position (left) > Go to right side of the screen
    frame.x = screen.x + math.floor(screen.w / 3) * 2
  elseif frame.w == math.floor(screen.w / 3) and frame.x == screen.x + math.floor(screen.w / 3) * 2 then
    -- Currently on right side of screen > Go to middle of the screen
    frame.x = screen.x + math.floor(screen.w / 3)
  else
    -- Normal behavior
    frame.x = screen.x
  end

  frame.w = math.floor(screen.w / 3)
  frame.h = screen.h
  frame.y = screen.y

  window:setFrame(frame)
end)

keys.bindKeyFor("Right 1/3 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.w == math.floor(screen.w / 3) and frame.x == screen.x then
    -- Currently in position (right) > Go to left side of the screen
    frame.x = screen.x
  elseif frame.w == math.floor(screen.w / 3) and frame.x == screen.x + math.floor(screen.w / 3) * 2 then
    -- Currently on left side of screen > Go to middle of the screen
    frame.x = screen.x + math.floor(screen.w / 3)
  else
    -- Normal behavior
    frame.x = screen.x + math.floor(screen.w / 3) * 2
  end

  frame.w = math.floor(screen.w / 3)
  frame.h = screen.h
  frame.y = screen.y

  window:setFrame(frame)
end)

-- 67% Width
keys.bindKeyFor("Left 2/3 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.w == math.floor(screen.w / 3) * 2 and frame.x == screen.x then
    -- If already in targeted position
    frame.x = screen.x + math.floor(screen.w / 3)
  else
    frame.x = screen.x
  end

  frame.w = math.floor(screen.w / 3) * 2
  frame.h = screen.h
  frame.y = screen.y

  window:setFrame(frame)
end)

keys.bindKeyFor("Right 2/3 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.w == math.floor(screen.w / 3) * 2 and frame.x == screen.x + math.floor(screen.w / 3) then
    -- If already in targeted position
    frame.x = screen.x
  else
    frame.x = screen.x + math.floor(screen.w / 3)
  end

  frame.w = math.floor(screen.w / 3) * 2
  frame.h = screen.h
  frame.y = screen.y

  window:setFrame(frame)
end)



-- UP / DOWN
-- 50% Height
keys.bindKeyFor("Top 1/2 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.w == screen.w and frame.y == screen.y and frame.h == screen.h / 2 then
    -- If already in targeted position
    frame.y = screen.y + screen.h / 2
  else
    frame.y = screen.y
  end

  frame.h = screen.h / 2
  frame.w = screen.w
  frame.x = screen.x

  window:setFrame(frame)
end)

keys.bindKeyFor("Bottom 1/2 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.w == screen.w and frame.y == screen.y + screen.h / 2 and frame.h == screen.h / 2 then
    -- If already in targeted position
    frame.y = screen.y
  else
    frame.y = screen.y + screen.h / 2
  end

  frame.h = screen.h / 2
  frame.w = screen.w
  frame.x = screen.x

  window:setFrame(frame)
end)

-- 33% Width
keys.bindKeyFor("Top 1/3 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.h == math.floor(screen.h / 3) and frame.y == screen.y then
    -- Currently in position (top) > Go to bottom side of the screen
    frame.y = screen.y + math.floor(screen.h / 3) * 2
  elseif frame.h == math.floor(screen.h / 3) and frame.y == screen.y + math.floor(screen.h / 3) * 2 then
    -- Currently on bottom side of screen > Go to middle of the screen
    frame.y = screen.y + math.floor(screen.h / 3)
  else
    -- Normal behavior
    frame.y = screen.y
  end

  frame.h = math.floor(screen.h / 3)
  frame.w = screen.w
  frame.x = screen.x

  window:setFrame(frame)
end)

keys.bindKeyFor("Bottom 1/3 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.h == math.floor(screen.h / 3) and frame.y == screen.y then
    -- Currently in position (bottom) > Go to top side of the screen
    frame.y = screen.y
  elseif frame.h == math.floor(screen.h / 3) and frame.y == screen.y + math.floor(screen.h / 3) * 2 then
    -- Currently on left side of screen > Go to middle of the screen
    frame.y = screen.y + math.floor(screen.h / 3)
  else
    -- Normal behavior
    frame.y = screen.y + math.floor(screen.h / 3) * 2
  end

  frame.h = math.floor(screen.h / 3)
  frame.w = screen.w
  frame.x = screen.x

  window:setFrame(frame)
end)

-- 67% Width
keys.bindKeyFor("Top 2/3 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.h == math.floor(screen.h / 3) * 2 and frame.y == screen.y then
    -- If already in targeted position
    frame.y = screen.y + math.floor(screen.h / 3)
  else
    frame.y = screen.y
  end

  frame.h = math.floor(screen.h / 3) * 2
  frame.w = screen.w
  frame.x = screen.x

  window:setFrame(frame)
end)

keys.bindKeyFor("Bottom 2/3 Window", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  if frame.h == math.floor(screen.h / 3) * 2 and frame.y == screen.y + math.floor(screen.h / 3) then
    -- If already in targeted position
    frame.y = screen.y
  else
    frame.y = screen.y + math.floor(screen.h / 3)
  end

  frame.h = math.floor(screen.h / 3) * 2
  frame.w = screen.w
  frame.x = screen.x

  window:setFrame(frame)
end)



-- SCREEN RESOLUTIONS
-- 1920 x 1080
keys.bindKeyFor("Screen 1920x1080", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  local target = { w = 1920, h = 1080 }
  
  if resolution.w == target.w and resolution.h == target.h then
    alert.show("Native resolution")
    window:setFrame(screen)
    return
  end

  if screen.w <= target.w then
    frame.x = screen.x
    alert.show("Screen width smaller than requested size")
  else
    frame.x = screen.x + (screen.w - frame.w) /2
  end

  if screen.h <= target.h then
    frame.y = screen.y 
    alert.show("Screen height smaller than requested size")
  else
    frame.y = screen.y + (screen.h - frame.h) / 2
  end

  frame.w = target.w
  frame.h = target.h

  window:setFrame(frame)
end)

-- 1440 x 900
keys.bindKeyFor("Screen 1440x900", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  local target = { w = 1440, h = 900 }
  
  if resolution.w == target.w and resolution.h == target.h then
    alert.show("Native resolution")
    window:setFrame(screen)
    return
  end

  if screen.w <= target.w then
    frame.x = screen.x
    alert.show("Screen width smaller than requested size")
  else
    frame.x = screen.x + (screen.w - frame.w) /2
  end

  if screen.h <= target.h then
    frame.y = screen.y 
    alert.show("Screen height smaller than requested size")
  else
    frame.y = screen.y + (screen.h - frame.h) / 2
  end

  frame.w = target.w
  frame.h = target.h

  window:setFrame(frame)
end)

-- 1336 x 768
keys.bindKeyFor("Screen 1336x768", function()
  local window, frame, screen, resolution = getWindow()
  if not window then return end

  local target = { w = 1336, h = 768 }
  
  if resolution.w == target.w and resolution.h == target.h then
    alert.show("Native resolution")
    window:setFrame(screen)
    return
  end

  if screen.w <= target.w then
    frame.x = screen.x
    alert.show("Screen width smaller than requested size")
  else
    frame.x = screen.x + (screen.w - frame.w) /2
  end

  if screen.h <= target.h then
    frame.y = screen.y 
    alert.show("Screen height smaller than requested size")
  else
    frame.y = screen.y + (screen.h - frame.h) / 2
  end

  frame.w = target.w
  frame.h = target.h

  window:setFrame(frame)
end)
