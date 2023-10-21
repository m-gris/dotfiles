
--- start quick open applications 
function open_app(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

-- --- quick open applications
hs.hotkey.bind({"alt", "ctrl"}, "2", open_app("Mail")) 
hs.hotkey.bind({"alt", "ctrl"}, "K", open_app("Slack")) 
hs.hotkey.bind({"alt", "ctrl"}, "V", open_app("Visual Studio Code"))
hs.hotkey.bind({"alt", "ctrl"}, "G", open_app("Google Chrome"))
hs.hotkey.bind({"alt", "ctrl"}, "R", open_app("Remnote"))
hs.hotkey.bind({"alt", "ctrl"}, "S", open_app("Spotify"))
hs.hotkey.bind({"alt", "ctrl"}, "W", open_app("WhatsApp"))
hs.hotkey.bind({"alt", "ctrl"}, "A", open_app("Alacritty"))
hs.hotkey.bind({"alt", "ctrl"}, "N", open_app("Notion"))
hs.hotkey.bind({"alt", "ctrl"}, "M", open_app("Microsoft Teams"))
hs.hotkey.bind({"alt", "ctrl"}, "T", open_app("Kitty"))
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
