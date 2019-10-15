local Map = require 'core/map'
local Util = require 'core/util'



function love.load()
  x = 100
  y = 100
  w = 64   
  h = 55   
  hp = 100   
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  
  xS = 100
  yS = 100
  wS = 20
  hS = 30
  enemyImg = love.graphics.newImage('assets-2/UNUSED/monsters/skeleton_small.png')
  
  map = Map:new(10, 13)
  map = Map:new(10, 13)
  floor = love.graphics.newImage('assets-1/dungeon/floor/crypt_domino_8a.png')
  wall  = love.graphics.newImage('assets-1/dungeon/wall/lab-metal_0.png')
  door  = love.graphics.newImage('assets-1/dungeon/doors/runed_door.png')

  walls = {
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { door, nil, nil, nil, nil, nil, nil, nil, nil, wall},
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
    if map:cc(x + 5, y, w, h) == false then  
      x = x + 5
    end
  end
    
  
  if love.keyboard.isDown('w') then
      if map:cc(xS, yS - 5, wS, hS) == false then  
        yS = yS - 5
       end
    end
    if love.keyboard.isDown('s') then
      if map:cc(xS, yS + 5, wS, hS) == false then  
        yS = yS + 5
       end
    end
    if love.keyboard.isDown('a') then
      if map:cc(xS - 5, yS, wS, hS) == false then  
        xS = xS - 5
       end
    end
    if love.keyboard.isDown('d') then
      if map:cc(xS + 5, yS, wS, hS) == false then  
        xS = xS + 5
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
  love.graphics.draw(enemyImg, xS, yS)
   
   love.graphics.print(hp, 0, 0)
end
