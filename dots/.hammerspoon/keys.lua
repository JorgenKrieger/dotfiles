local hotkey = require "hs.hotkey"

-- Modifier keys
altcmd = {"alt", "cmd"}
ctrlcmd = {"ctrl", "cmd"}
ctrlalt = {"ctrl", "alt"}

ctrlaltcmd = {"ctrl", "alt", "cmd"}
ctrlaltshift = {"ctrl", "alt", "shift"}

Keys = {
  ["specialTriggers"] = {
    -- HAMMERSPOON
    ["Reload"] = {altcmd, "R"},
    
    -- WINDOW MANAGEMENT
    
    -- Fixed resolution
    ["Screen 1920x1080"] = {{}, "f16"},
    ["Screen 1440x900"] = {{}, "f17"},
    ["Screen 1336x768"] = {{}, "f18"},

    -- General
    ["Fullscreen Window"] = {altcmd, "F"},
    ["Center Window"] = {altcmd, "C"},

    -- Left/Right
    -- 50% width
    ["Left 1/2 Window"] = {altcmd, "Left"},
    ["Right 1/2 Window"] = {altcmd, "Right"},

    -- 33% width
    ["Left 1/3 Window"] = {ctrlalt, "Left"},
    ["Right 1/3 Window"] = {ctrlalt, "Right"},

    -- 67% width
    ["Left 2/3 Window"] = {ctrlaltshift, "Left"},
    ["Right 2/3 Window"] = {ctrlaltshift, "Right"},

    -- Up/Down
    -- 50% height
    ["Top 1/2 Window"] = {altcmd, "Up"},
    ["Bottom 1/2 Window"] = {altcmd, "Down"},

    -- 33% height
    ["Top 1/3 Window"] = {ctrlalt, "Up"},
    ["Bottom 1/3 Window"] = {ctrlalt, "Down"},

    -- 67% height
    ["Top 2/3 Window"] = {ctrlaltcmd, "Up"},
    ["Bottom 2/3 Window"] = {ctrlaltcmd, "Down"},

    -- Move to diferent monitor
    ["Monitor Up"] = {ctrlaltcmd, "Up"},
    ["Monitor Right"] = {ctrlaltcmd, "Right"},
    ["Monitor Down"] = {ctrlaltcmd, "Down"},
    ["Monitor Left"] = {ctrlaltcmd, "Left"}
  },
  ["triggers"] = {
    -- APPLICATIONS
    ["iTerm"] = {ctrlcmd, "1"},
    ["Microsoft Edge Canary"] = {ctrlcmd, "2"},
    ["Skype"] = {ctrlcmd, "3"},
    ["Music"] = {ctrlcmd, "4"}
  }
}
