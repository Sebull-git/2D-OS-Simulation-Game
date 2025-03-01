
Actor = {}
Actor.__index = Actor

function Actor.init() 
    local self = setmetatable({}, Actor)
    self.madeTurn = false
    return self
end

function Actor:turn()
    print("I made my turn!")
    self.madeTurn = true
end
