Player = Object:extend()

function Player:new()
    -- Player info
    self.x = ww / 2
    self.y = wh / 2
    self.rad = 10
    self.speed = 500
    self.body = love.graphics.circle
end

function Player:update(dt)
    local kd = love.keyboard.isDown
    -- Player Movement
    if kd("w") then
        self.y = self.y - self.speed * dt
    elseif kd("s") then
        self.y = self.y + self.speed * dt
    end

    if kd("a") then
        self.x = self.x - self.speed * dt
    elseif kd("d") then
        self.x = self.x + self.speed * dt
    end

     -- LIMITS
     -- Horizonatal Limits
     if self.x + self.rad > stage.x + stage.width * stage.cellSize / 2 then
        self.x = stage.x + stage.width * stage.cellSize / 2 - self.rad
    elseif self.x - self.rad < stage.x - stage.width * stage.cellSize / 2 then
        self.x = stage.x - stage.width * stage.cellSize / 2 + self.rad
     end

     -- Vertical Limits
     if self.y + self.rad > stage.y + stage.height * stage.cellSize / 2 then
        self.y = stage.y + stage.height * stage.cellSize / 2 - self.rad
    elseif self.y - self.rad < stage.y - stage.height * stage.cellSize / 2 then
        self.y = stage.y - stage.height * stage.cellSize / 2 + self.rad
     end
end

function Player:draw()
    love.graphics.setColor(1, 0, 0)
    self.body("fill", self.x, self.y, self.rad)
end