require "actor"
require "util"
require "player"
local Game = {}
Game.actors = {}
Game.currentActor = 1

Game.init = function ()
    Game.actors[1] = Player.init()
    Game.actors[2] = Actor.init()
    Game.actors[3] = Actor.init()

end

Game.turn = function ()
    if Game.actors[Game.currentActor].madeTurn then
        Game.currentActor = Game.currentActor + 1 
        if Game.currentActor > tablelength(Game.actors) then Game.currentActor = 1 end
        print("New current Actor",Game.currentActor)
    else
        Game.actors[Game.currentActor]:turn()
    end   
    
end

Game.handleInput = function (key)
    if Game.currentActor == 1 then
        Game.actors[1]:handleInput(key)
    end
end

return Game