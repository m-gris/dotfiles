
-- Functions 
function open_app(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end


-- function modal_open(name, modal)
--     return function()
--         open_app(name)()
--         modal:exit()
--     end
-- end



-- -- Define the modal hotkey groups
-- microsoftApps = hs.hotkey.modal.new({"alt", "ctrl"}, "M")
-- appleApps = hs.hotkey.modal.new({"alt", "ctrl"}, "A")
-- terminalApps = hs.hotkey.modal.new({"alt", "ctrl"}, "T")
-- browserApps = hs.hotkey.modal.new({"alt", "ctrl"}, "B")

-- -- Alert when entering modal state
-- function microsoftApps:entered() hs.alert.show('Microsoft Apps') end
-- function appleApps:entered() hs.alert.show('Apple Apps') end
-- function terminalApps:entered() hs.alert.show('Terminal Apps') end
-- function browserApps:entered() hs.alert.show('Browser Apps') end


-- -- Bind keys for Microsoft apps within the Microsoft modal
-- microsoftApps:bind('', 'T', nil, modal_open('Microsoft Teams', microsoftApps))
-- microsoftApps:bind('', 'E', nil, modal_open('Microsoft Excel', microsoftApps))
-- microsoftApps:bind('', 'escape', nil, function() terminalApps:exit() end)
-- --
-- -- Bind keys for Apple apps within the Apple modal
-- appleApps:bind('', 'M', nil, modal_open('Mail', appleApps))
-- appleApps:bind('', 'F', nil, modal_open('Finder', appleApps))
-- appleApps:bind('', 'P', nil, modal_open('Preview', appleApps))
-- appleApps:bind('', 'escape', nil, function() terminalApps:exit() end)
--

-- -- Bind keys for Terminal apps within the Terminal modal
-- terminalApps:bind('', 'A', nil, modal_open('Alacritty', terminalApps))
-- terminalApps:bind('', 'K', nil, modal_open('Kitty', terminalApps))
-- terminalApps:bind('', 'I', nil, modal_open('iTerm', terminalApps))
-- terminalApps:bind('', 'T', nil, modal_open('Terminal', terminalApps))
-- terminalApps:bind('', 'escape', nil, function() terminalApps:exit() end)

-- -- Bind keys for Browser apps within the Browser modal
-- browserApps:bind('', 'S', nil, modal_open('Safari', browserApps))
-- browserApps:bind('', 'F', nil, modal_open('Firefox', browserApps))
-- browserApps:bind('', 'G', nil, modal_open('Google Chrome', browserApps))
-- browserApps:bind('', 'A', nil, modal_open('Arc', browserApps))
-- browserApps:bind('', 'escape', nil, function() browserApps:exit() end)

-- --- quick open applications
hs.hotkey.bind({"alt", "ctrl"}, "T", open_app("Kitty"))
hs.hotkey.bind({"alt", "ctrl"}, "K", open_app("Slack")) 
hs.hotkey.bind({"alt", "ctrl"}, "A", open_app("Arc")) 
hs.hotkey.bind({"alt", "ctrl"}, "G", open_app("Google Chrome")) 
hs.hotkey.bind({"alt", "ctrl"}, "X", open_app("Microsfot Excel")) 
hs.hotkey.bind({"alt", "ctrl"}, "W", open_app("WhatsApp"))
hs.hotkey.bind({"alt", "ctrl"}, "R", open_app("Remnote"))
hs.hotkey.bind({"alt", "ctrl"}, "S", open_app("Spotify"))
hs.hotkey.bind({"alt", "ctrl"}, "O", open_app("Obsidian"))
hs.hotkey.bind({"alt", "ctrl"}, "M", open_app("Mail"))
hs.hotkey.bind({"alt", "ctrl"}, "F", open_app("Finder"))

hs.hotkey.bind({"alt", "ctrl"}, "V", open_app("Visual Studio Code"))
hs.hotkey.bind({"alt", "ctrl"}, "N", open_app("Notion"))
hs.hotkey.bind({"alt", "ctrl"}, "Z", open_app("zoom.us"))


----------------------------------
---- START VIM CONFIG
----------------------------------
--local VimMode = hs.loadSpoon("VimMode")
--local vim = VimMode:new()

---- Configure apps you do *not* want Vim mode enabled in
---- For example, you don't want this plugin overriding your control of Terminal
---- vim
--vim
--  :disableForApp('Code')
--  :disableForApp('zoom.us')
--  :disableForApp('iTerm')
--  :disableForApp('iTerm2')
--  :disableForApp('Terminal')
--  :disableForApp('Code')

---- If you want the screen to dim (a la Flux) when you enter normal mode
---- flip this to true.
--vim:shouldDimScreenInNormalMode(false)

---- If you want to show an on-screen alert when you enter normal mode, set
---- this to true
--vim:shouldShowAlertInNormalMode(true)

---- You can configure your on-screen alert font
--vim:setAlertFont("Courier New")

---- Enter normal mode by typing a key sequence
---- vim:enterWithSequence('asdf', 250)

---- if you want to bind a single key to entering vim, remove the
---- :enterWithSequence('jk') line above and uncomment the bindHotKeys line
---- below:
----
---- To customize the hot key you want, see the mods and key parameters at:
----   https://www.hammerspoon.org/docs/hs.hotkey.html#bind
----
--vim:bindHotKeys({ enter = { {'ctrl'}, ';' } })
--vim:enableBetaFeature('block_cursor_overlay')


----------------------------------
---- END VIM CONFIG
----------------------------------
