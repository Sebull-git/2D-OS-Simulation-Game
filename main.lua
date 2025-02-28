actors = require("actors")
tiles = require("tiles")

-- Initial Load
function love.load()
    GLOBAL_HEIGHT = 20
    GLOBAL_WIDTH = 20
    love.window.setMode(GLOBAL_WIDTH * 40, GLOBAL_HEIGHT * 40)
end

function love.draw()
    love.graphics.rectangle("fill", player.x, player.y, GLOBAL_WIDTH, GLOBAL_HEIGHT)
end

-- game Loop
function love.update()    

end

function love.keypressed( key )
    if key == "a" then
        if player.x <= 0 then return; end
        player.x = player.x - GLOBAL_WIDTH
    end
    if key == "d" then
        if player.x >= love.graphics.getWidth() then return; end
        player.x =  player.x + GLOBAL_WIDTH
    end
    if key == "w" then
        if player.y <= 0 then return; end
        player.y = player.y - GLOBAL_HEIGHT
    end
    if key == "s" then 
        if player.y >= love.graphics.getHeight() then return; end
        player.y = player.y + GLOBAL_HEIGHT
    end
end