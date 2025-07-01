Stage = Object:extend()

function Stage:new()
    -- table[y][x]
    self.x, self.y = ww/2, wh/2
    self.model = {}
    self.height, self.width = 6, 6
    for y = 1, self.height do
        self.model[y] = {}
        for x = 1, self.width do
            self.model[y][x] = 1
        end
    end
    self.cellSize = 70
    self.colorList = {
        {1, 1, 1},
        {1, 0.4, 0.4},
        {0.4, 1, 0.4},
        {0.4, 0.4, 1},
        {0.4, 1, 1},
        {1, 0.4, 1},
        {1, 1, 0.4}
    }

    self.randomizeCooldown = 5
end

function Stage:update(dt)
    self.randomizeCooldown = self.randomizeCooldown - 1 * dt
    if self.randomizeCooldown <= 0 then
        self:randomizeStageModel()
        self.randomizeCooldown = 5
    end
end

function Stage:draw()
    for y, row in ipairs(self.model) do
        for x, tile in ipairs(row) do
            love.graphics.setColor(self.colorList[tile])

            love.graphics.rectangle(
            "fill", 
            (x-1)*self.cellSize + self.x - #self.model[1]*self.cellSize/2,
            (y-1)*self.cellSize + self.y - #self.model*self.cellSize/2, 
            self.cellSize, 
            self.cellSize
        )
        end
    end
end

function Stage:randomizeStageModel()
    for y, row in ipairs(self.model) do
        for x, tile in ipairs(row) do
            self.model[y][x] = math.random(1, #self.colorList)
        end
    end
end