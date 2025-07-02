Object = require "classic"
require "aid"
require "player"
require "stage"

function love.load()   
    ww, wh = love.window.getMode()

    aid = Aid() -- I suck, so this helps
    player = Player()
    stage = Stage()
end

function love.update(dt)
    player:update(dt)
    stage:update(dt)
end

function love.draw()    
    stage:draw()
    player:draw()

    love.graphics.print(aid:betweenLimit(1, math.floor((player.x - (stage.x - #stage.model[1]*stage.cellSize/2))/stage.cellSize)+1, #stage.model[1]))

    love.graphics.print(aid:betweenLimit(1, math.floor((player.y - (stage.y - #stage.model*stage.cellSize/2))/stage.cellSize)+1, #stage.model), 20)
end