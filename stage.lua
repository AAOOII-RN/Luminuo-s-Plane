Stage = Object:extend()

function Stage:new()
    -- table[y][x]

    -- STAGE SETTINGS
    self.model = {}
    self.height, self.width = 6, 12
    for y = 1, self.height do
        self.model[y] = {}
        for x = 1, self.width do
            self.model[y][x] = 1
        end
    end
    self.cellSize = 90
    self.colorList = {
        {0.9, 0.9, 0.9}, -- white
        {0.9, 0.4, 0.4}, -- red
        {0.4, 0.9, 0.4}, -- green
        {0.4, 0.4, 0.9}, -- blue
        {0.4, 0.9, 0.9}, -- cyan
        {0.9, 0.4, 0.9}, -- pink
        {0.9, 0.9, 0.4} -- yellow
    }
    self.x, self.y = ww/2, 5*wh/8
    
    -- STAGE STATE
    self.randomizeCooldown = 5
    self.playerCell = {}

    -- SELCECTED CELLS
    self.selectCell = 1
    self.sc_size = 45
    self.sc_x, self.sc_y = ww/2, wh/4
    self.sc_correctCell = 0
end

function Stage:update(dt)
    self.randomizeCooldown = self.randomizeCooldown - 1 * dt
    self.playerX = aid:betweenLimit(1, math.floor((player.x - (self.x - self.width*self.cellSize/2))/self.cellSize)+1, self.width)
    self.playerY = aid:betweenLimit(1, math.floor((player.y - (self.y - self.height*self.cellSize/2))/self.cellSize)+1, self.height)

    if self.randomizeCooldown <= 0 then
        self:randomizeStageModel()
        self.randomizeCooldown = 5
        self.selectCell = math.random(#self.colorList)

        if self.model[self.playerY][self.playerX] == self.selectCell then
            self.sc_correctCell = self.sc_correctCell + 1
        end
    end

end

function Stage:draw()
    for y, row in ipairs(self.model) do
        for x, tile in ipairs(row) do
            -- Highlights the cell where the player stands
            if y == self.playerY and x == self.playerX then
                self.colorList[tile][4] = 0.75
            else
                self.colorList[tile][4] = 1
            end
            love.graphics.setColor(self.colorList[tile])

            -- builds the stage
            love.graphics.rectangle(
            "fill", 
            (x-1)*self.cellSize + self.x - #self.model[1]*self.cellSize/2,
            (y-1)*self.cellSize + self.y - #self.model*self.cellSize/2, 
            self.cellSize, 
            self.cellSize
        )
        end
    end

    love.graphics.setColor(self.colorList[self.selectCell])
    love.graphics.rectangle("fill", self.sc_x, self.sc_y, self.sc_size, self.sc_size)
end

function Stage:randomizeStageModel()
    for y, row in ipairs(self.model) do
        for x, tile in ipairs(row) do
            self.model[y][x] = math.random(1, #self.colorList)
        end
    end
end