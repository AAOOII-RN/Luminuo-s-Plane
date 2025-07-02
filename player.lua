Player = Object:extend()

function Player:new()
    -- Player info
    self.x = ww / 2
    self.y = wh / 2
    self.rad = 10
    self.speed = 200
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
end

function Player:draw()
    love.graphics.setColor(0.5,0.5,1)
    self.body("fill", self.x, self.y, self.rad)
end