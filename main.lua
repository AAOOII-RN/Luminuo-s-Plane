function love.load()
    ww, wh = love.window.getMode()

    -- Player info
    player = {}
    player.x = ww / 2
    player.y = wh / 2
    player.rad = 10
    player.body = love.graphics.circle

    -- table[y][x]
    stage = {}
    stage.model = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
    }
    stage.colorList = {
        {1, 1, 1},
        {1, 0.4, 0.4},
        {0.4, 1, 0.4},
        {0.4, 0.4, 1},
        {0.4, 1, 1},
        {1, 0.4, 1},
        {1, 1, 0.4}
    }
    stage.cellSize = 38
end

function randomizeStageModel()
    for y, row in ipairs(stage.model) do
        for x, tile in ipairs(row) do
            stage.model[y][x] = math.random(1, #stage.colorList)
        end
    end
end

function love.update(dt)
    local kd = love.keyboard.isDown

    -- Player Movement
    if kd("w") then
        player.y = player.y - 500 * dt
    elseif kd("s") then
        player.y = player.y + 500 * dt
    end

    if kd("a") then
        player.x = player.x - 500 * dt
    elseif kd("d") then
        player.x = player.x + 500 * dt
    end
end

function love.keypressed(kd)
    -- Perform randomizeStageModel
    if kd == "space" then
        randomizeStageModel()
    end
end

function love.draw()    
    -- The grid
    for y, row in ipairs(stage.model) do
        for x, tile in ipairs(row) do
            love.graphics.setColor(stage.colorList[tile])

            love.graphics.rectangle(
            "fill", 
            (x-1)*stage.cellSize + ww/2 - #stage.model[1]*stage.cellSize/2,
            (y-1)*stage.cellSize + wh/2 - #stage.model*stage.cellSize/2, 
            stage.cellSize, 
            stage.cellSize
        )
        end
    end

    -- Player
    love.graphics.setColor(0.5,0.5,1)
    player.body("fill", player.x, player.y, player.rad)
end