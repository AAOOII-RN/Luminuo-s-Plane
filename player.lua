Player = Object:extend()

function Player:new()
    -- Player info
    self = {}
    self.x = ww / 2
    self.y = wh / 2
    self.rad = 10
    self.body = love.graphics.circle
end

function Player:update(dt)
    local kd = love.keyboard.isDown
    -- Player Movement
    if kd("w") then
        self.y = self.y - 500 * dt
    elseif kd("s") then
        self.y = self.y + 500 * dt
    end

    if kd("a") then
        self.x = self.x - 500 * dt
    elseif kd("d") then
        self.x = self.x + 500 * dt
    end
end

function Player:draw()
    love.graphics.setColor(0.5,0.5,1)
    self.body("fill", self.x, self.y, self.rad)
end