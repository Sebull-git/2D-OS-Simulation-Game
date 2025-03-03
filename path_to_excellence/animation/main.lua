goal = {x = 0,y = 0}
head = {x = 10, y = 10, vel = 2, size = 20}
body = {part1 = {x = head.size,y=head.size}}
function love.load()
    
end

head_v = {x = 0, y = 0}

function straight()
    -- this function will follow the point given in just straight lines

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
end

function squared(x)
    return x * x
end

function variable_velo()

    distance = math.sqrt(squared((math.abs(goal.y - head.y))) + squared((math.abs(goal.x - head.x))))
    if distance > 20 then head.vel = head.vel * 2 end
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
end

function love.update()
    --* my head is trying to walk to the goal
    -- TODO let the head move dynamically with different velocity
    -- goal is right of head
    variable_velo()
    head.x = head.x + head_v.x
    head.y = head.y + head_v.y

    --* my body is trying to follow the head
    -- lets get the math mathing
    -- currently watching: https://www.youtube.com/watch?v=KPoeNZZ6H4s
end

function love.draw()
    -- this is my head
    love.graphics.rectangle("fill",head.x,head.y,head.size,head.size)
    love.graphics.rectangle("fill", body.part1.x, body.part1.y, head.size,head.size)
end


function love.mousepressed(x, y)
    goal.x = x
    goal.y = y
 end