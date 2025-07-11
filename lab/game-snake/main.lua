local gridSize = 20
local cellSize = 20
local snake = { { x = 5, y = 5 } }
local direction = "right"
local food = { x = 10, y = 10 }
local timer = 0
local speed = 0.1
local gameOver = false

function love.load()
    love.window.setTitle("Snake in Love2D")
    love.window.setMode(gridSize * cellSize, gridSize * cellSize)
end

function love.update(dt)
    if gameOver then return end

    timer = timer + dt
    if timer >= speed then
        timer = 0
        moveSnake()
        checkCollision()
    end
end

function love.keypressed(key)
    if key == "r" then
        resetGame()
    end
    if key == "up" and direction ~= "down" then direction = "up" end
    if key == "down" and direction ~= "up" then direction = "down" end
    if key == "left" and direction ~= "right" then direction = "left" end
    if key == "right" and direction ~= "left" then direction = "right" end
end

function moveSnake()
    local head = { x = snake[1].x, y = snake[1].y }
    if direction == "up" then head.y = head.y - 1 end
    if direction == "down" then head.y = head.y + 1 end
    if direction == "left" then head.x = head.x - 1 end
    if direction == "right" then head.x = head.x + 1 end

    table.insert(snake, 1, head)

    if head.x == food.x and head.y == food.y then
        spawnFood()
    else
        table.remove(snake) -- move without growing
    end
end

function checkCollision()
    local head = snake[1]

    -- Wall collision
    if head.x < 0 or head.x >= gridSize or head.y < 0 or head.y >= gridSize then
        gameOver = true
    end

    -- Self collision
    for i = 2, #snake do
        if snake[i].x == head.x and snake[i].y == head.y then
            gameOver = true
        end
    end
end

function spawnFood()
    local valid = false
    while not valid do
        food.x = love.math.random(0, gridSize - 1)
        food.y = love.math.random(0, gridSize - 1)
        valid = true
        for _, part in ipairs(snake) do
            if part.x == food.x and part.y == food.y then
                valid = false
                break
            end
        end
    end
end

function resetGame()
    snake = { { x = 5, y = 5 } }
    direction = "right"
    gameOver = false
    spawnFood()
end

function love.draw()
    love.graphics.clear(0.1, 0.1, 0.1)

    -- Draw snake
    for _, part in ipairs(snake) do
        love.graphics.setColor(0, 1, 0)
        love.graphics.rectangle("fill", part.x * cellSize, part.y * cellSize, cellSize - 1, cellSize - 1)
    end

    -- Draw food
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", food.x * cellSize, food.y * cellSize, cellSize - 1, cellSize - 1)

    -- Draw game over
    if gameOver then
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Game Over! Press R to Restart", 0, (gridSize * cellSize) / 2 - 10, gridSize * cellSize,
            "center")
    end
end
