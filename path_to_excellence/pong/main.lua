player_y = 0
running = true
main_menu = true
width, height = love.window.getMode( )
ball_x = width / 2
ball_y = height / 2
autoplay = true

main_anim = 50

function love.draw()
    -- main menu 
    if main_menu then
        love.graphics.print("Press Enter to start",width / 3,height / 3 )
        love.graphics.rectangle("fill", width / 2, height / 2, main_anim, main_anim)
    else
        if running then
            -- game
            love.graphics.rectangle("fill",0,player_y,50, 100)
            love.graphics.rectangle("fill",ball_x, ball_y, 20, 20)
        else 
            -- Lost Screen
            love.graphics.print("GAME LOST",width  / 2, height / 2)
        end 
    end
    
end


function love.load()

end
ball_vel = 5
ball_v = {x = ball_vel,y = ball_vel}

function love.update()
    if(running) then 
        -- Handle Input
        if love.keyboard.isDown( "w" ) then
            if player_y >= 0 then 
                player_y = player_y - ball_vel
            end
        end
        if love.keyboard.isDown( "s" ) then 
            if (player_y + 100) <= height then
                player_y = player_y + ball_vel
            end
        end
        
        if love.keyboard.isDown( "return" ) and main_menu then
            main_menu = false
        end

        -- Check for ball hit a wall and update ball_v

        -- ball hit the lower bound
        if ball_y >= height - 20 then
            -- if ball came from upper left
            if ball_v.x > 0 then
                --print "Lower - Upper left"
                ball_v.y = -ball_vel
            end
            -- ball came from upper right 
            --! as soon as this happens something seems to fuck up
            if ball_v.x < 0 then
                --print "Upper right"
                ball_v.y = ball_vel
            end
        end

        -- ball hit the upper bound 
        if ball_y <= 0 then 
            -- ball came from down left
            --! as soon as this happens something seems to fuck up
            if ball_v.x > 0 then 
                --print("Upper - Upper left")
                ball_v.y = -ball_vel
            end

            -- ball came from down right
            if ball_v.x < 0 then
                ball_v.y = ball_vel
            end
        end

        -- ball hit the right bound
        if ball_x >= width - 20 then
            
            -- ball came from up
            if ball_v.y > 0 then
                ball_v.x = ball_vel
            end
            if ball_v.y < 0 then 
                ball_v.x = -ball_vel
            end
            -- ball came from down
        end

        -- ball hit the left bound
        -- TODO potential loose!
        if ball_x  <= 0 then 
            running = false
            -- ball came from up 
            if ball_v.y > 0 then 
                ball_v.x = ball_vel
            end
            if ball_v.y < 0 then 
                ball_v.x = -ball_vel
            end
        end

        -- ball hit the player 
        if ball_y >= player_y and ball_y <= player_y + 100 and ball_x <= 0 + 50 then 
            if ball_v.y > 0 then 
                ball_v.x = ball_vel
            end
            if ball_v.y < 0 then 
                ball_v.x = -ball_vel
            end
        end
        -- Add ball ball_v to ball_x and y
        ball_x = ball_x + ball_v.x
        ball_y = ball_y + ball_v.y
        --print(ball_x,ball_y)
    end
end

