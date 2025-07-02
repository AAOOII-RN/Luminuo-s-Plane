function love.conf(t)
    t.identity = nil                    -- The name of the save directory (string)
    t.version = "11.4"                  -- The LÖVE version this game was made for (string)
    t.externalstorage = false           -- True to save files (and read from the save directory) in external storage on Android (boolean) 
    t.window.title = "Luminuo's Plane"         -- The window title (string)
    t.window.fullscreen = true         -- Enable fullscreen (boolean)
end