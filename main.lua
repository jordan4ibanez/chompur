-- load libraries
dofile("libraries/map_prepack.lua")
dofile("libraries/ecs.lua")
dofile("libraries/ecs.lua")

-- lua locals
local
table_insert, map_size,ecs,iterator_1d
=
table.insert, map_size,ecs,map_size*map_size

-- default of 700
local scale = 66
local spacing = 4

-- runtime scalers
local tile_scale = 66
local tile_spacing = 4
local round_corners = 3

-- default map
local map = reset_map()

-- resize function for scaling
function love.resize( width, height )
    local new_scale

    if width <= height then
        new_scale = width
    else
        new_scale = height
    end

    tile_scale = (new_scale / 700) * scale

    tile_spacing = (new_scale / 700) * spacing
end

-- 2d to 1d calcultion
local function convert_1d_to_2d(i)
    i = i - 1
    local x = (i % 10) % 10
    local y = math.floor(i / 10)

    return({ x, y })
end

-- user input
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

-- user input
function love.load()

end

-- engine update loop
function love.update()

end

-- rendering loop
function love.draw()
    for i = 1,iterator_1d do
        local x,y = unpack(convert_1d_to_2d(i))
        love.graphics.rectangle( "line", x * (tile_scale + tile_spacing), y * (tile_scale + tile_spacing), tile_scale, tile_scale, round_corners, round_corners)
    end
end