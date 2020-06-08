Player = class{}

---------------------------------------------------------------------------------------------------------

function Player:init(newAttri)
  local attri = newAttri or {}
  -- initialise player attributes according to attri
  self.x = attri.x or GAME_WIDTH/2
  self.y = attri.y  or GAME_HEIGHT/2
  if attri.type and PLAYER_DEFS[attri.type] then
    self.type = attri.type
  else
    self.type = "elf_f"
  end
  self.weaponType = attri.weaponType or "knife"

  self.width = PLAYER_META.width*SCALE_FACTOR
  self.height = PLAYER_META.height*SCALE_FACTOR

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
  for k, anim in pairs(PLAYER_DEFS[self.type].animations) do
    self.animationQuads[k] = sliceAnimToQuads(anim, spriteSheet)
  end

  gameWorld:add(self, self.x, self.y, self.width, self.height)

end

---------------------------------------------------------------------------------------------------------

function Player:update(dt)

  -- input player action
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
  if checkInput("Confirm", "press") and not self.weapon then
    self.weapon = Weapon({ type = self.weaponType })
  end

  -- move the player & check collision using bump
  local playerFilter = function(item, other)
    return "slide"
  end

  local goalX, goalY = self.x + self.dx, self.y + self.dy
  local actualX, actualY = gameWorld:move(self, goalX, goalY)
  self.x, self.y = actualX, actualY

  -- update animations
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

  -- update weapon
  if self.weapon then
    if self.isRight == 1 then
      self.weapon:transform(self.x + self.width - 20,
        self.y + self.height/4*3 - self.weapon.visible.height, 1)
    elseif self.isRight == -1 then
      self.weapon:transform(self.x - self.weapon.width + 20,
        self.y + self.height/4*3 - self.weapon.visible.height, -1)
    end
    self.weapon:update(dt)
    if self.weapon.timer > self.weapon.lifetime then
      self.weapon = nil
    end
  end


end

---------------------------------------------------------------------------------------------------------


function Player:render()
  love.graphics.setColor(COLORS.white)
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

  -- render weapon if any
  if self.weapon then
    self.weapon:render()
  end

  -- correct direction according to self.isRight
  if self.isRight == 1 then
    love.graphics.draw(spriteSheet, self.animationQuads[self.state][self.curFrame],
      self.x, self.y, 0, SCALE_FACTOR)
  elseif self.isRight == -1 then
    love.graphics.draw(spriteSheet, self.animationQuads[self.state][self.curFrame],
      self.x+self.width, self.y, 0, SCALE_FACTOR*-1, SCALE_FACTOR)
  end

end

---------------------------------------------------------------------------------------------------------
