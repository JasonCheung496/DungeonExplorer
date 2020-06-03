Player = class{}

---------------------------------------------------------------------------------------------------------

function Player:init(newAttri)
  local attri = newAttri or {}

  self.x = attri.x or GAME_WIDTH/2
  self.y = attri.y  or GAME_HEIGHT/2
  if attri.type and PLAYER_DEFS[attri.type] then
    self.type = attri.type
  else
    self.type = "elfF"
  end

  self.width = PLAYER_META.width*gScaleFactor
  self.height = PLAYER_META.height*gScaleFactor

  -- for movement
  self.dx = 0
  self.dy = 0

  -- for animation
  self.state = "idle"
  self.isRight = 1 -- 1 if facing right, -1 if facing left
  self.animTimer = 0
  self.curFrame = 1
  self.animationQuads = {}
  -- cutting quads according to PLAYER_DEFS's animations
  for k, v in pairs(PLAYER_DEFS[self.type].animations) do
    self.animationQuads[k] = sliceAnimToQuads(v, spriteSheet)
  end

  world:add(self, self.x, self.y, self.width, self.height)

end

---------------------------------------------------------------------------------------------------------

function Player:update(dt)

  -- input player movement
  self.dx, self.dy = 0, 0
  local speed = PLAYER_META.speed
  if checkInput("Right", "hold") then
    self.dx = speed * dt
  elseif checkInput("Left", "hold") then
    self.dx = -speed * dt
  end
  if checkInput("Down", "hold") then
    self.dy = speed * dt
  elseif checkInput("Up", "hold") then
    self.dy = -speed * dt
  end


  --move the player & check collision using bump
  local playerFilter = function(item, other)
    if other.__index == Bullet then return "cross"
    else return "slide"
    end
  end

  local goalX, goalY = self.x + self.dx, self.y + self.dy
  local actualX, actualY = world:move(self, goalX, goalY)
  self.x, self.y = actualX, actualY

  -- calculating animations
  if self.dx ~= 0 then
    self.isRight = sign(self.dx)
  end
  if self.dx ~= 0 or self.dy ~= 0 then
    self.state = "run"
  else
    self.state = "idle"
  end
  local curAnim = PLAYER_DEFS[self.type].animations[self.state]
  self.animTimer = (self.animTimer + dt) % (curAnim.numOfFrames*curAnim.interval)
  self.curFrame = math.ceil(self.animTimer/curAnim.interval)


end

---------------------------------------------------------------------------------------------------------


function Player:render()
  love.graphics.setColor(colorPresets.white)
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

  -- correct direction according to self.isRight
  if self.isRight == 1 then
    love.graphics.draw(spriteSheet, self.animationQuads[self.state][self.curFrame],
      self.x, self.y, 0, gScaleFactor)
  elseif self.isRight == -1 then
    love.graphics.draw(spriteSheet, self.animationQuads[self.state][self.curFrame],
      self.x+self.width, self.y, 0, gScaleFactor*-1, gScaleFactor)
  end

end

---------------------------------------------------------------------------------------------------------
