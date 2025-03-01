goal = {x = 0,y = 0}
head = {x = 10, y = 10, vel = 2}

function love.load()
    
end

head_v = {x = 0, y = 0}

function love.update()
    -- my head is trying to walk to the goal

    -- goal is right of head
    if head.x <= goal.x then
        head_v.x = head.vel
    end
    -- goal is left of head
    if head.x >= goal.x then
        head_v.x = -head.vel
    end
    -- goal is above head
    if head.y <= goal.y then
        head_v.y = head.vel
    end
    -- goal is under head
    if head.y >= goal.y then
        head_v.y = -head.vel
    end
    head.x = head.x + head_v.x
    head.y = head.y + head_v.y
end

function love.draw()
    -- this is my head
    love.graphics.rectangle("fill",head.x,head.y,20,20)
end


function love.mousepressed(x, y)
    goal.x = x
    goal.y = y
 end