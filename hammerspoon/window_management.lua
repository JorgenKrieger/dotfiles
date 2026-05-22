local keys = require "keys"
local log = hs.logger.new("WinManage", "debug")
local padding = 16
local gap = 16

hs.window.animationDuration = 0.00

local function alertCannotManipulateWindow()
    hs.alert.show("Can't move window")
end

-- nearPx: tolerance for pixel/coordinate comparisons (OS may round by a few px)
local function nearPx(a, b) return math.abs(a - b) <= 10 end

-- Compute target window width for a given fraction, accounting for gaps between slots
local function targetWidth(max, frac)
    local avail = max.w - padding * 2
    if frac == 1/3 then return (avail - gap * 2) / 3
    elseif frac == 0.5 then return (avail - gap) / 2
    elseif frac == 2/3 then return (avail - gap) * 2 / 3
    end
    return avail * frac
end

-- Compute target window height for a given fraction, accounting for gaps between slots
local function targetHeight(max, frac)
    local avail = max.h - padding * 2
    if frac == 1/3 then return (avail - gap * 2) / 3
    elseif frac == 0.5 then return (avail - gap) / 2
    elseif frac == 2/3 then return (avail - gap) * 2 / 3
    end
    return avail * frac
end

-- Return all valid x positions for a given target width
local function xPositions(max, w)
    local avail = max.w - padding * 2
    if nearPx(w, (avail - gap * 2) / 3) then
        return {
            max.x + padding,
            max.x + padding + w + gap,
            max.x + padding + (w + gap) * 2,
        }
    elseif nearPx(w, (avail - gap) / 2) then
        return {
            max.x + padding,
            max.x + padding + w + gap,
        }
    elseif nearPx(w, (avail - gap) * 2 / 3) then
        local complement = (avail - gap) / 3
        return {
            max.x + padding,
            max.x + padding + complement + gap,
        }
    end
    return { max.x + padding }
end

-- Return all valid y positions for a given target height
local function yPositions(max, h)
    local avail = max.h - padding * 2
    if nearPx(h, (avail - gap * 2) / 3) then
        return {
            max.y + padding,
            max.y + padding + h + gap,
            max.y + padding + (h + gap) * 2,
        }
    elseif nearPx(h, (avail - gap) / 2) then
        return {
            max.y + padding,
            max.y + padding + h + gap,
        }
    elseif nearPx(h, (avail - gap) * 2 / 3) then
        local complement = (avail - gap) / 3
        return {
            max.y + padding,
            max.y + padding + complement + gap,
        }
    end
    return { max.y + padding }
end

-- Snap window to a horizontal fraction. startRight controls initial snap direction when resizing.
-- Cycling order is always left → ... → right → left (wraps).
local function moveHorizontal(frac, startRight)
    local win = hs.window.focusedWindow()
    if not win then alertCannotManipulateWindow() return end

    local max = win:screen():frame()
    local frame = win:frame()
    local w = targetWidth(max, frac)
    local positions = xPositions(max, w)
    local newX

    if nearPx(frame.w, w) then
        local currentIdx
        for i, px in ipairs(positions) do
            if nearPx(frame.x, px) then currentIdx = i break end
        end
        if currentIdx then
            if startRight then
                newX = positions[(currentIdx % #positions) + 1]
            else
                newX = positions[((currentIdx - 2) % #positions) + 1]
            end
        else
            newX = startRight and positions[#positions] or positions[1]
        end
    else
        newX = startRight and positions[#positions] or positions[1]
    end

    win:setFrame({ x = newX, y = max.y + padding, w = w, h = max.h - padding * 2 })
end

-- Snap window to a vertical fraction. Preserves x and width.
-- startBottom controls initial snap direction when resizing.
local function moveVertical(frac, startBottom)
    local win = hs.window.focusedWindow()
    if not win then alertCannotManipulateWindow() return end

    local max = win:screen():frame()
    local frame = win:frame()
    local h = targetHeight(max, frac)
    local positions = yPositions(max, h)
    local newY

    if nearPx(frame.h, h) then
        local currentIdx
        for i, py in ipairs(positions) do
            if nearPx(frame.y, py) then currentIdx = i break end
        end
        if currentIdx then
            if startBottom then
                newY = positions[(currentIdx % #positions) + 1]
            else
                newY = positions[((currentIdx - 2) % #positions) + 1]
            end
        else
            newY = startBottom and positions[#positions] or positions[1]
        end
    else
        newY = startBottom and positions[#positions] or positions[1]
    end

    win:setFrame({ x = frame.x, y = newY, w = frame.w, h = h })
end

-- Detect which horizontal fraction and slot index the window currently occupies, or nil if unknown
local function detectHorizontal(frame, max)
    for _, frac in ipairs({ 1/3, 0.5, 2/3, 1.0 }) do
        local w = targetWidth(max, frac)
        if nearPx(frame.w, w) then
            local positions = xPositions(max, w)
            for i, px in ipairs(positions) do
                if nearPx(frame.x, px) then return frac, i end
            end
        end
    end
    return nil, nil
end

-- Detect which vertical fraction and slot index the window currently occupies, or nil if unknown
local function detectVertical(frame, max)
    for _, frac in ipairs({ 1/3, 0.5, 2/3, 1.0 }) do
        local h = targetHeight(max, frac)
        if nearPx(frame.h, h) then
            local positions = yPositions(max, h)
            for i, py in ipairs(positions) do
                if nearPx(frame.y, py) then return frac, i end
            end
        end
    end
    return nil, nil
end

local function moveToScreen(win, direction)
    local frame = win:frame()
    local oldMax = win:screen():frame()
    local hFrac, hSlot = detectHorizontal(frame, oldMax)
    local vFrac, vSlot = detectVertical(frame, oldMax)

    if direction == "Up" then win:moveOneScreenNorth()
    elseif direction == "Right" then win:moveOneScreenEast()
    elseif direction == "Down" then win:moveOneScreenSouth()
    elseif direction == "Left" then win:moveOneScreenWest()
    end

    if not hFrac and not vFrac then return end

    local newMax = win:screen():frame()
    local cur = win:frame()
    local newX, newW, newY, newH = cur.x, cur.w, cur.y, cur.h

    if hFrac then
        newW = targetWidth(newMax, hFrac)
        local positions = xPositions(newMax, newW)
        newX = positions[math.min(hSlot, #positions)]
    end

    if vFrac then
        newH = targetHeight(newMax, vFrac)
        local positions = yPositions(newMax, newH)
        newY = positions[math.min(vSlot, #positions)]
    end

    win:setFrame({ x = newX, y = newY, w = newW, h = newH })
end

local wm = keys.windowManagement
local mm = keys.moveMonitor

hs.hotkey.bind(wm["Fullscreen"][1], wm["Fullscreen"][2], function()
    local win = hs.window.focusedWindow()
    if not win then alertCannotManipulateWindow() return end
    local max = win:screen():frame()
    win:setFrame({ x = max.x + padding, y = max.y + padding, w = max.w - padding * 2, h = max.h - padding * 2 })
end)

hs.hotkey.bind(wm["Center"][1], wm["Center"][2], function()
    local win = hs.window.focusedWindow()
    if not win then alertCannotManipulateWindow() return end
    local max = win:screen():frame()
    local frame = win:frame()
    local availW = max.w - padding * 2
    local availH = max.h - padding * 2
    local w = math.min(frame.w, availW)
    local h = math.min(frame.h, availH)
    win:setFrame({
        x = max.x + padding + (availW - w) / 2,
        y = max.y + padding + (availH - h) / 2,
        w = w,
        h = h,
    })
end)

hs.hotkey.bind(wm["Left 33%"][1],  wm["Left 33%"][2],  function() moveHorizontal(1/3, false) end)
hs.hotkey.bind(wm["Left 50%"][1],  wm["Left 50%"][2],  function() moveHorizontal(0.5, false) end)
hs.hotkey.bind(wm["Left 67%"][1],  wm["Left 67%"][2],  function() moveHorizontal(2/3, false) end)
hs.hotkey.bind(wm["Right 33%"][1], wm["Right 33%"][2], function() moveHorizontal(1/3, true) end)
hs.hotkey.bind(wm["Right 50%"][1], wm["Right 50%"][2], function() moveHorizontal(0.5, true) end)
hs.hotkey.bind(wm["Right 67%"][1], wm["Right 67%"][2], function() moveHorizontal(2/3, true) end)

hs.hotkey.bind(wm["Up 33%"][1],   wm["Up 33%"][2],   function() moveVertical(1/3, false) end)
hs.hotkey.bind(wm["Up 50%"][1],   wm["Up 50%"][2],   function() moveVertical(0.5, false) end)
hs.hotkey.bind(wm["Up 67%"][1],   wm["Up 67%"][2],   function() moveVertical(2/3, false) end)
hs.hotkey.bind(wm["Down 33%"][1], wm["Down 33%"][2], function() moveVertical(1/3, true) end)
hs.hotkey.bind(wm["Down 50%"][1], wm["Down 50%"][2], function() moveVertical(0.5, true) end)
hs.hotkey.bind(wm["Down 67%"][1], wm["Down 67%"][2], function() moveVertical(2/3, true) end)

for key, _ in pairs(mm) do
    local keypress = mm[key]
    hs.hotkey.bind(keypress[1], keypress[2], function()
        local win = hs.window.focusedWindow()
        if not win then alertCannotManipulateWindow() return end
        moveToScreen(win, key)
    end)
end
