G = require "game"


function love.load()
    G.init()
end

function love.draw()

end

function love.update()
    G.turn()
end

function love.keypressed(key)
    G.handleInput(key)
end