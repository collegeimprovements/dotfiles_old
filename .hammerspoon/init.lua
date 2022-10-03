hs.loadSpoon('ControlEscape'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon
-- -- hs.loadSpoon('Volume'):start()
-- hs.loadSpoon('Brightness'):start()

function changeBrightness(diff)
  return function()
    local current = hs.brightness.get()
    local new = math.min(100, math.max(10, math.floor(current + diff)))
    hs.alert.closeAll(0.0)
    hs.alert.show("Brightness " .. new .. "%", {}, 0.4)
    hs.brightness.set(new)
  end
end

hs.hotkey.bind({ 'shift', 'ctrl', 'alt' }, 'Down', changeBrightness(-10))
hs.hotkey.bind({ 'shift', 'ctrl', 'alt' }, 'Up', changeBrightness(10))

function changeVolume(diff)
  return function()
    local current = hs.audiodevice.defaultOutputDevice():volume()
    local new = math.min(100, math.max(0, math.floor(current + diff)))
    if new > 0 then
      hs.audiodevice.defaultOutputDevice():setMuted(false)
    end
    hs.alert.closeAll(0.0)
    hs.alert.show("Volume " .. new .. "%", {}, 0.4)
    hs.audiodevice.defaultOutputDevice():setVolume(new)
  end
end

hs.hotkey.bind({ 'ctrl', 'shift', 'cmd' }, 'Down', changeVolume(-10))
hs.hotkey.bind({ 'ctrl', 'shift', 'cmd' }, 'Up', changeVolume(10))
