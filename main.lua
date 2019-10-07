local Map = require 'core/map'
local Util = require 'core/util'



function love.load()
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  w = 64   
  h = 64   
  hp = 100 
  
  map = Map:new(10, 13)
  floor = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_12.png')
  wall  = love.graphics.newImage('assets-1/dungeon/floor/green_bones_12.png')
  template = {
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  } 
    
  map = Map:new(template) 
end

function love.update(dt)
  if love.keyboard.isDown('up') then
    y = y - 5
  end
  if love.keyboard.isDown('down') then
    y = y + 5
  end
  if love.keyboard.isDown('left') then
    x = x - 5
  end
  if love.keyboard.isDown('right') then
    x = x + 5
  end

 
 if cc(x, y, w, h,   0, 0, 64, 64) then  
  hp = hp - 1
 end
end
  

function love.draw()
  map:draw()
  love.graphics.draw(playerImg1, x, y)
   
   love.graphics.rectangle('line', 0, 0, 64, 64)
   love.graphics.print(hp, 0, 0)
end
