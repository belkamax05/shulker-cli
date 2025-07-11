local gridSize = 4
local grid = {}
local tileSize = 100
local spacing = 10
local font

function love.load()
    font = love.graphics.newFont(32)
    love.graphics.setFont(font)
    resetGrid()
end

function resetGrid()
    for y = 1, gridSize do
        grid[y] = {}
        for x = 1, gridSize do
            grid[y][x] = 0
        end
    end
    spawnTile()
    spawnTile()
end

function spawnTile()
    local empty = {}
    for y = 1, gridSize do
        for x = 1, gridSize do
            if grid[y][x] == 0 then
                table.insert(empty, { x = x, y = y })
            end
        end
    end
    if #empty > 0 then
        local spot = empty[math.random(#empty)]
        grid[spot.y][spot.x] = math.random() < 0.9 and 2 or 4
    end
end

function moveRowLeft(row)
    local newRow = {}
    local merged = {}
    local score = 0
    for i = 1, gridSize do
        newRow[i] = 0
        merged[i] = false
    end

    local insertPos = 1
    for i = 1, gridSize do
        if row[i] ~= 0 then
            if newRow[insertPos] == 0 then
                newRow[insertPos] = row[i]
            elseif newRow[insertPos] == row[i] and not merged[insertPos] then
                newRow[insertPos] = newRow[insertPos] * 2
                score = score + newRow[insertPos]
                merged[insertPos] = true
            else
                insertPos = insertPos + 1
                newRow[insertPos] = row[i]
            end
        end
    end
    return newRow, score
end

function moveLeft()
    local moved = false
    for y = 1, gridSize do
        local newRow, _ = moveRowLeft(grid[y])
        for x = 1, gridSize do
            if grid[y][x] ~= newRow[x] then
                moved = true
            end
            grid[y][x] = newRow[x]
        end
    end
    if moved then spawnTile() end
end

function rotateGrid(times)
    for _ = 1, times do
        local new = {}
        for y = 1, gridSize do
            new[y] = {}
            for x = 1, gridSize do
                new[y][x] = grid[gridSize - x + 1][y]
            end
        end
        grid = new
    end
end

function love.keypressed(key)
    if key == "r" then
        resetGrid()
    end
    local dir = { left = 0, up = 1, right = 2, down = 3 }
    if dir[key] then
        rotateGrid(dir[key])
        moveLeft()
        rotateGrid((4 - dir[key]) % 4)
    end
end

function love.draw()
    love.graphics.clear(0.9, 0.9, 0.9)
    for y = 1, gridSize do
        for x = 1, gridSize do
            local val = grid[y][x]
            local xPos = (x - 1) * (tileSize + spacing) + spacing
            local yPos = (y - 1) * (tileSize + spacing) + spacing
            love.graphics.setColor(0.75, 0.75, 0.75)
            if val ~= 0 then
                love.graphics.setColor(0.8 - 0.05 * math.log(val) / math.log(2), 0.7, 0.5)
            end
            love.graphics.rectangle("fill", xPos, yPos, tileSize, tileSize, 8)
            if val ~= 0 then
                love.graphics.setColor(0, 0, 0)
                love.graphics.printf(val, xPos, yPos + tileSize / 2 - 16, tileSize, "center")
            end
        end
    end
end

function move(direction)
    local rotated = false
    local moved = false

    -- Rotate based on direction
    if direction == "up" then
        rotateGrid()
    elseif direction == "down" then
        rotateGrid()
        rotateGrid()
        rotateGrid()
    elseif direction == "right" then
        flipGridHorizontally()
    end

    for y = 1, gridSize do
        local newRow, _ = moveRowLeft(grid[y])
        for x = 1, gridSize do
            if grid[y][x] ~= newRow[x] then
                moved = true
            end
            grid[y][x] = newRow[x]
        end
    end

    -- Undo rotation/flip
    if direction == "up" then
        rotateGrid()
        rotateGrid()
        rotateGrid()
    elseif direction == "down" then
        rotateGrid()
    elseif direction == "right" then
        flipGridHorizontally()
    end

    if moved then
        spawnTile()
    end
end

function rotateGrid()
    local new = {}
    for y = 1, gridSize do
        new[y] = {}
        for x = 1, gridSize do
            new[y][x] = grid[gridSize - x + 1][y]
        end
    end
    grid = new
end

function flipGridHorizontally()
    for y = 1, gridSize do
        for x = 1, math.floor(gridSize / 2) do
            grid[y][x], grid[y][gridSize - x + 1] = grid[y][gridSize - x + 1], grid[y][x]
        end
    end
end

function love.keypressed(key)
    if key == "r" then
        resetGrid()
    elseif key == "left" or key == "right" or key == "up" or key == "down" then
        move(key)
    end
end
