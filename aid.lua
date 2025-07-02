Aid = Object:extend()

function Aid:isBetween(a, b, c)
    -- is b between a and c?
    return a < b < c
end

function Aid:betweenLimit(a, b, c)
    -- b can't go beyond a or c
    return math.max(a,math.min(c, b))
end