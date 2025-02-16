local Map = require 'core/map'
local Util = require 'core/util'



function love.load()
  x = 384
  y = 100
  w = 64   
  h = 55   
  hp = 100   
  playerImg = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  
  xS1 = 400
  yS1 = 400
  wS1 = 20
  hS1 = 30
  skeletonImg1 = love.graphics.newImage('assets-2/UNUSED/monsters/skeleton_small.png')
  
  xS2 = 400
  yS2 = 400
  wS2 = 20
  hS2 = 30
  skeletonImg2 = love.graphics.newImage('assets-2/UNUSED/monsters/skeleton_small.png')
  
  xS3 = 400
  yS3 = 400
  wS3 = 20
  hS3 = 30
  skeletonImg3 = love.graphics.newImage('assets-2/UNUSED/monsters/skeleton_small.png')
  
  xSh1 = 745
  ySh1 = 545
  wSh1 = 20
  hSh1 = 40
  r1 = 0.5
  shootythingImg1 = love.graphics.newImage('assets-1/effect/drain_1_old.png')

  xSh2 = 85 
  ySh2 = 85
  wSh2 = 20
  hSh2 = 40
  r2 = 0.5
  shootythingImg2 = love.graphics.newImage('assets-1/effect/drain_1_old.png')

  xSh3 = 85
  ySh3 = 545
  wSh3 = 20
  hSh3 = 40
  r3 = 0.5
  shootythingImg3 = love.graphics.newImage('assets-1/effect/drain_1_old.png')

  xSh4 = 745
  ySh4 = 85
  wSh4 = 20
  hSh4 = 40
  r4 = 0.5
  shootythingImg4 = love.graphics.newImage('assets-1/effect/drain_1_old.png')
  
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
    { wall, nil, nil, nil, wall, wall, nil, nil, nil, wall},
    { wall, nil, nil, nil, wall, wall, nil, nil, nil, wall},
    { wall, nil, nil, nil, wall, wall, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, nil, nil, nil, nil, nil, nil, nil, nil, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  }
        --left
  floors = {
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},   -- top
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
    { floor, floor, floor, floor, floor, floor, floor, floor, floor, floor},
  }
                                                         --right
  map = Map:new(walls) 
  map2 = Map:new(floors) 
end




function love.update(dt)
  r1 = r1 + 0.5
  r2 = r2 + 0.5
  r3 = r3 + 0.5
  r4 = r4 + 0.5
  
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
    
  
  if (yS1 >= y) then
      if map:cc(xS1, yS1 - 5, wS1, hS1) == false then  
        yS1 = yS1 - 0.5
       end
      end
    if (yS1 <= y) then
      if map:cc(xS1, yS1 + 5, wS1, hS1) == false then  
        yS1 = yS1 + 0.5
       end
    end
    if (xS1 >= x) then
      if map:cc(xS1 - 5, yS1, wS1, hS1) == false then  
        xS1 = xS1 - 0.5
       end
    end
    if (xS1 <= x) then
      if map:cc(xS1 + 5, yS1, wS1, hS1) == false then  
        xS1 = xS1 + 0.5
      end
    
  end

  if (yS2 >= y) then
    if map:cc(xS2, yS2 - 5, wS2, hS2) == false then  
      yS2 = yS2 - 1
     end
  end
  if (yS2 <= y) then
    if map:cc(xS2, yS2 + 5, wS2, hS2) == false then  
      yS2 = yS2 + 1
     end
  end
  if (xS2 >= x) then
    if map:cc(xS2 - 5, yS2, wS2, hS2) == false then  
      xS2 = xS2 - 1
     end
  end
  if (xS2 <= x) then
    if map:cc(xS2 + 5, yS2, wS2, hS2) == false then  
      xS2 = xS2 + 1
    end
  
  end

  
  if (yS3 >= y) then
    if map:cc(xS3, yS3 - 5, wS3, hS3) == false then  
      yS3 = yS3 - 1.5
     end
  end
  if (yS3 <= y) then
    if map:cc(xS3, yS3 + 5, wS3, hS3) == false then  
      yS3 = yS3 + 1.5
     end
  end
  if (xS3 >= x) then
    if map:cc(xS3 - 5, yS3, wS3, hS3) == false then  
      xS3 = xS3 - 1.5
     end
  end
  if (xS3 <= x) then
    if map:cc(xS3 + 5, yS3, wS3, hS3) == false then  
      xS3 = xS3 + 1.5
    end
  
  end

  if love.keyboard.isDown('w') then
    if map:cc(x2, y2 - 5 , w2, h2) == false then  
      y2 = y2 - 5
     end
  end
  if love.keyboard.isDown('s') then
    if map:cc(x2, y2 + 5, w2, h2) == false then  
      y2 = y2 + 5
     end
  end
  if love.keyboard.isDown('a') then
    if map:cc(x2 - 5, y2, w2, h2) == false then  
      x2 = x2 - 5
     end
  end
  if love.keyboard.isDown('d') then
    if map:cc(x2 + 5, y2, w2, h2) == false then  
      x2 = x2 + 5
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
  love.graphics.draw(skeletonImg1, xS1, yS1)
  love.graphics.draw(skeletonImg2, xS2, yS2)
  love.graphics.draw(skeletonImg3, xS3, yS3)
  love.graphics.draw(shootythingImg1, xSh1, ySh1, r1, 1, 1, 10, 20)
  love.graphics.draw(shootythingImg2, xSh2, ySh2, r2, 1, 1, 10, 20)
  love.graphics.draw(shootythingImg3, xSh3, ySh3, r3, 1, 1, 10, 20)
  love.graphics.draw(shootythingImg4, xSh4, ySh4, r4, 1, 1, 10, 20)
   
   love.graphics.print(hp, 0, 0)
end
