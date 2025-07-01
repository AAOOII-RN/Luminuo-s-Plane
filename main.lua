Object = require "classic"
require "player"
require "stage"

function love.load()   
    player = Player()
    stage = Stage()
    
    ww, wh = love.window.getMode()
end

function love.update(dt)
    player:update(dt)
    stage:update(dt)
end

function love.draw()    
    player:draw()
    stage:draw()

    love.graphics.print(math.floor(stage.randomizeCooldown))
end