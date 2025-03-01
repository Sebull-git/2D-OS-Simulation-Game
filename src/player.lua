
Player = {}
Player.__index = Player

function Player.init() 
    local self = setmetatable({}, Player)
    
    self.madeTurn = false
    self.availableMovement = 2
    self.takenMovement = 0
    print(self.takenMovement)
    return self
end

function Player:turn()
    if self.takenMovement == self.availableMovement then 
        self.madeTurn = true
        print("Player made my turn!")
    end
    self.takenMovement = 0
end

function Player:handleInput(key)
    self.takenMovement = self.takenMovement + 1
    if key == "a" then print("I got moved") end
end

