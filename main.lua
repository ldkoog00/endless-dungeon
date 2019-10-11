local Map = require 'core/map'
local Util = require 'core/util'

love.graphics.setDefaultFilter('nearest', 'nearest')
local Map = require 'core/map'

function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-2/player/base/merfolk_m.png')
  w = 32   -- The player's width is 32
  h = 32   -- The player's height is 32
  hp = 100 -- Set the player's HP to 100 at the start of the game
  cage = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_3.png')
  cage1 = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_4.png')
  cage2 = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_5.png')
  cage3 = love.graphics.newImage('assets-1/dungeon/floor/floor_vines_6.png')
  wall = love.graphics.newImage ('assets-1/dungeon/wall/catacombs_0.png')
  door = love.graphics.newImage ('assets-1/dungeon/doors/runed_door.png')
  door2 = love.graphics.newImage('assets-1/dungeon/doors/sealed_door.png')
  statue1 = love.graphics.newImage ('assets-1/dungeon/statues/statue_sigmund.png')
  butterfly = love.graphics.newImage('assets-1/monster/animals/butterfly_1.png')
  jackal = love.graphics.newImage('assets-1/monster/animals/jackal.png')
  bat = love.graphics.newImage('assets-1/monster/animals/bat.png')
  raiju = love.graphics.newImage('assets-1/monster/animals/raiju.png')
  trap = love.graphics.newImage ('assets-1/dungeon/traps/shaft.png')

  background = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, cage1, cage2, cage3, cage, cage1, cage2, cage3, cage, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},


    collision = { 
      {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},

    }
  }
end
function love.update(dt)
  if love.keyboard.isDown('up') then
    if collision:cc(x, y, 64, 64) then
      y = y - 1
    end
  end
  if love.keyboard.isDown('down') then
    if collision:cc(x, y, 64, 64) then
      y = y + 1
    end
  end
  if love.keyboard.isDown('right') then
    if collision:cc(x, y, 64, 64) then
      x = x + 1
    end
  end
  if love.keyboard.isDown('left') then
    if collision:cc(x, y, 64, 64) then
      x = x - 1
    end
  end
end


function love.draw()
  map = Map:new(background)
  map = Map:new(collision)

  map:draw()

 

  love.graphics.draw(trap, 385, 130, 0, 2) -- Bottom Middle Pit
  love.graphics.draw(trap, 320, 130, 0, 2)
  love.graphics.draw(trap, 450, 130, 0, 2)
  love.graphics.draw(trap, 450, 65, 0, 2)
  love.graphics.draw(trap, 320, 65, 0, 2)


  love.graphics.draw(door2, 390, 0, 0, 2) -- Top Door
  love.graphics.draw(door, 390, 575, 0, 2) -- Bottom Door
  love.graphics.draw(door, 740, 325, 0, 2) -- Right Door
  love.graphics.draw(door, 0, 325, 0, 2) -- Left Door
  
  love.graphics.draw(statue1, 65, 65, 0, 2)

  love.graphics.draw(butterfly, 65, 325, 0, 2)
  love.graphics.draw(bat, 675, 325, 0, 2)
  love.graphics.draw(raiju, 385, 65, 0, 2)



  love.graphics.draw(playerImg, x, y, 0, 2)
  love.graphics.rectangle('line', 0, 0, 64, 64)

  love.graphics.print(hp, 0, 0)
end

