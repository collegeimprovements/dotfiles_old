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
