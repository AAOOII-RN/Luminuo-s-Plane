Object = require "classic"
require "aid"
require "player"
require "stage"

function love.load()   
    ww, wh = love.window.getMode()

    aid = Aid() -- I suck, so this helps
    player = Player()
    stage = Stage()

    ticks = 0
end

function love.update(dt)
    ticks = ticks + 1 * dt
    player:update(dt)
    stage:update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.4, 0.2, 0.2)
    stage:draw()
    player:draw()

    love.graphics.print(stage.randomizeCooldown .. "\n" .. stage.sc_correctCell .. "\n" .. stage.model[stage.playerY][stage.playerX] .. "\n" .. stage.selectCell)
end