function love.conf (t)
    -- App Settings
    t.window.title = "Display Wizard"
    t.identity = "JASG"

    -- General Settings
    t.console = true

    -- Video Settings
    --t.window.fullscreen = true
    t.window.fullscreentype = "desktop"
    t.window.vsync = 0
    --t.window.width = 0
    --t.window.height = 0

    t.window.width = 800
    t.window.height = 600
    t.window.fullscreen = false
end