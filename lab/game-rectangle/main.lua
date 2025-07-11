local x, y = 100, 100

function love.load()
    love.window.setTitle("My First Lua Game")
end

function love.update(dt)
    if love.keyboard.isDown("right") then x = x + 100 * dt end
    if love.keyboard.isDown("left") then x = x - 100 * dt end
    if love.keyboard.isDown("down") then y = y + 100 * dt end
    if love.keyboard.isDown("up") then y = y - 100 * dt end
end

function love.draw()
    love.graphics.setColor(1, 0, 0) -- red
    love.graphics.rectangle("fill", x, y, 50, 50)
end
