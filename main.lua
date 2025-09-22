local tux = require ("libs.tux")
local lovelyToasts = require ("libs.lovelyToasts")

local targetWidth, targetHeight = 1920, 1080

lovelyToasts.options.tapToDismiss = true
lovelyToasts.options.queueEnabled = true
lovelyToasts.options.position = "top"

function love.update (dt)
    tux.callbacks.update (dt)
    lovelyToasts.update(dt)

    local mx, my = love.mouse.getPosition ()

    tux.layout.pushGrid ({
        maxLineLength = 250,
        maxLineSize = 50,
        wrap = true
    }, 25, 25)

    tux.show.label ({
        text = "Mouse: " .. mx .. ", " .. my
    }, tux.layout.nextItem ({}, "100%", "100%"))

    tux.layout.nextItem ({}, "100%", "100%") -- Spacing

    if tux.show.button ({
        text = "Autoscale"
    }, tux.layout.nextItem ({}, "100%", "100%")) == "end" then
        love.window.setMode (targetWidth, targetHeight, {fullscreen = true})

        love.mouse.setPosition (targetWidth, targetHeight)

        local nmx, nmy = love.mouse.getPosition ()

        local scaleX = math.floor (targetWidth / nmx * 100 + 0.5)
        local scaleY = math.floor (targetHeight / nmy * 100 + 0.5)

        lovelyToasts.show ("Calculated scale: " .. scaleX .. "%, " .. scaleY .. "%")
    end

    -- if tux.show.button ({
    --     text = "Move mouse to corner"
    -- }, tux.layout.nextItem ({}, "100%", "100%")) == "end" then
    --     love.mouse.setPosition (1920, 1080)
    -- end

    if tux.show.button ({
        text = "Exit"
    }, tux.layout.nextItem ({}, "100%", "100%")) == "end" then
        love.event.quit ()
    end

    tux.layout.popGrid ()
end

function love.draw ()
    love.graphics.setBackgroundColor(0, 0, 1, 1)
    tux.callbacks.draw ()
    lovelyToasts.draw()
end

function love.keypressed (key, scancode, isrepeat)
	tux.callbacks.keypressed (key, scancode, isrepeat)
end

function love.textinput (text)
    tux.callbacks.textinput (text)
end

function love.mousereleased(x, y, button)
    lovelyToasts.mousereleased(x, y, button)
end

function love.touchreleased(id, x, y, dx, dy, pressure)
    lovelyToasts.touchreleased(id, x, y, dx, dy, pressure)
end

function love.resize (w, h)
    lovelyToasts.canvasSize = {w, h}
end