hs.loadSpoon('ControlEscape'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon
hs.loadSpoon('ToggleApp'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon


local hyper = {"ctrl", "alt", "cmd"}
local ctrl_cmd = {"ctrl", "cmd"}

hs.loadSpoon('MiroWindowsManager')

hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
  up = {ctrl_cmd, "up"},
  right = {ctrl_cmd, "right"},
  down = {ctrl_cmd, "down"},
  left = {ctrl_cmd, "left"},
  fullscreen = {hyper, "f"}
})
