local Map = require 'core/map'
local Util = require 'core/util'



function love.load()
  x = 100
  y = 100
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  w = 64   
  h = 64   
  hp = 100 
  
  map = Map:new(10, 13)
  map = Map:new(10, 13)
  floor = love.graphics.newImage('assets-1/dungeon/floor/crypt_domino_8a.png')
  wall  = love.graphics.newImage('assets-1/dungeon/wall/lab-metal_0.png')

  walls = {
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, wall, wall, nil, nil, nil, wall},
    { wall, nil, nil, nil, wall, wall, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  }
  
  floors = {
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  }

  map = Map:new(walls) 
  map2 = Map:new(floors) 
end




function love.update(dt)
  if love.keyboard.isDown('up') then
    if map:cc(x, y - 5 , w, h) == false then  
      y = y - 5
     end
  end
  if love.keyboard.isDown('down') then
    if map:cc(x, y + 5, w, h) == false then  
      y = y + 5
     end
  end
  if love.keyboard.isDown('left') then
    if map:cc(x - 5, y, w, h) == false then  
      x = x - 5
     end
  end
  if love.keyboard.isDown('right') then
    if map:cc(x + 3, y, w, h) == false then  
      x = x + 5
    end
    
  end
  

 
 if map:cc(x, y, w, h) then  
  hp = hp - 1
 end
end
  





function love.draw()
  map2:draw()
  map:draw()
  
  love.graphics.draw(playerImg, x, y)
   
  love.graphics.rectangle('line', 0, 0, 832, 64)
  love.graphics.rectangle('line', 0, 0, 64, 640)
  love.graphics.rectangle('line', 0, 576, 832, 64)
  love.graphics.rectangle('line', 768, 0, 64, 640)
  love.graphics.rectangle('line', 384, 256, 128, 128)
   love.graphics.print(hp, 0, 0)
end
