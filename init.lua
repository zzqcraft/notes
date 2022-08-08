--------------------------------------------------------------------------------
-- This config is used in Hammerspoon. Please make sure 
--   Privacy&Security -> Accessibility allows this app to run.
--------------------------------------------------------------------------------


local zzq_config = { }
local menubarMuteItem = nil


--------------------------------------------------------------------------------
-- Window Management
--------------------------------------------------------------------------------

function zzq_config.focused_window()
   return hs.window.focusedWindow()
end

function zzq_config.set_frame(unit)
   return zzq_config.focused_window():setFrame(unit, 0)
end

function zzq_config.maximize_window()
   local sf = zzq_config.focused_window():screen():frame()
   zzq_config.set_frame({ x = sf.x, y = sf.y, w = sf.w, h = sf.h })
end

function zzq_config.center_window()
   local sf = zzq_config.focused_window():screen():frame()
   zzq_config.set_frame({ x = sf.x + sf.w / 4, y = sf.y + sf.h / 4, w = sf.w / 2, h = sf.h / 2 })
end

function zzq_config.send_window_left()
   local sf = zzq_config.focused_window():screen():frame()
   local old_wf = zzq_config.focused_window():frame()
   zzq_config.set_frame({ x = sf.x, y = sf.y, w = sf.w / 2, h = sf.h })

   if old_wf == zzq_config.focused_window():frame() then
      local west_screen = zzq_config.focused_window():screen():toWest()
      if west_screen ~= nil then
         local wsf = west_screen:frame()
         zzq_config.set_frame({ x = wsf.x + wsf.w / 2, y = wsf.y, w = wsf.w / 2, h = wsf.h })
      end
   end
end

function zzq_config.send_window_right()
   local sf = zzq_config.focused_window():screen():frame()
   local old_wf = zzq_config.focused_window():frame()
   zzq_config.set_frame({ x = sf.x + sf.w / 2, y = sf.y, w = sf.w / 2, h = sf.h })

   if old_wf == zzq_config.focused_window():frame() then
      local east_screen = zzq_config.focused_window():screen():toEast()
      if east_screen ~= nil then
         local esf = east_screen:frame()
         zzq_config.set_frame({ x = esf.x, y = esf.y, w = esf.w / 2, h = esf.h })
      end
   end
end


--------------------------------------------------------------------------------
-- Mic Management
--------------------------------------------------------------------------------

function zzq_config.present_mic_status()
   if menubarMuteItem == nil then
      menubarMuteItem = hs.menubar.new()
   end

   local mic = hs.audiodevice.defaultInputDevice()

   if mic:inputMuted() then
      menubarMuteItem:setTitle(
         hs.styledtext.new(
            mic:name(), { color = { red = 1, blue = 0.3, green = 0 }}
         )
      )
   else
      menubarMuteItem:setTitle(
         hs.styledtext.new(
            mic:name(), { color = { red = 0, blue = 0.3, green = 0.6 }}
         )
      )
   end
end

function zzq_config.toggle_audio_input_mute()
   local mic = hs.audiodevice.defaultInputDevice()
   local input_devices = hs.audiodevice.allInputDevices()

   if mic:muted() then
      for index, value in ipairs(input_devices) do
         if value ~= nil then
            value:setMuted(false)
         end
      end
   else
      for index, value in ipairs(input_devices) do
         if value ~= nil then
            value:setMuted(true)
         end
      end
   end

   zzq_config.present_mic_status()
end


zzq_config.present_mic_status()


--------------------------------------------------------------------------------
-- Volume Management
--------------------------------------------------------------------------------

function sendSystemKey(key)
    hs.eventtap.event.newSystemKeyEvent(key, true):post()
    hs.eventtap.event.newSystemKeyEvent(key, false):post()
end

function zzq_config.increaseVolume()
   sendSystemKey("SOUND_UP")
end

function zzq_config.decreaseVolume()
   sendSystemKey("SOUND_DOWN")
end

function zzq_config.muteVolume()
   sendSystemKey("MUTE")
end


--------------------------------------------------------------------------------
-- Key Bindings
--------------------------------------------------------------------------------

hs.hotkey.bind({"cmd"}, "Left", function() zzq_config.send_window_left() end)
hs.hotkey.bind({"cmd"}, "Right", function() zzq_config.send_window_right() end)
hs.hotkey.bind({"cmd"}, "Up", function() zzq_config.maximize_window() end)
hs.hotkey.bind({"cmd"}, "Down", function() zzq_config.center_window() end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "l", function() hs.caffeinate.startScreensaver() end)

hs.hotkey.bind({"cmd"}, "m", function() zzq_config.toggle_audio_input_mute() end)

hs.hotkey.bind({"cmd"}, "F12", zzq_config.increaseVolume, nil, zzq_config.increaseVolume)
hs.hotkey.bind({"cmd"}, "F11", zzq_config.decreaseVolume, nil, zzq_config.decreaseVolume)
hs.hotkey.bind({"cmd"}, "F10", zzq_config.muteVolume, nil, zzq_config.muteVolume)
