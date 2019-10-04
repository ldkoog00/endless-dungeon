local Map = require 'core/map'



function love.load()
  x1 = 400
  y1 = 300
  playerImg1 = love.graphics.newImage('assets-1/player/base/octopode_1.png')
  x2 = 200
  y2 = 575
  playerImg2 = love.graphics.newImage('assets-1/player/base/octopode_2.png')
  map = Map:new(13, 13)
  wall = love.graphics.newImage('assets-1/dungeon/wall/cobalt_stone_12.png')
  template = {
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    { wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall}, 
    }
  map = Map:new(template) 
end






function love.update(dt)
  if love.keyboard.isDown('up') then
    y1 = y1 - 5
  end
  if love.keyboard.isDown('down') then
    y1 = y1 + 5
  end
  if love.keyboard.isDown('left') then
    x1 = x1 - 5
  end
  if love.keyboard.isDown('right') then
    x1 = x1 + 5
  end

  
   if love.keyboard.isDown('w') then
     y2 = y2 - 5
   end
   if love.keyboard.isDown('s') then
     y2 = y2 + 5
   end
  
   
  if love.keyboard.isDown('a') then
     x2 = x2 - 5
   end
   if love.keyboard.isDown('d') then
    x2 = x2 + 5
   end


end
  

function love.draw()
  map:draw()
  love.graphics.draw(playerImg1, x1, y1)
  love.graphics.draw(playerImg2, x2, y2)
end
