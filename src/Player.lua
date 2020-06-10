Player = class{}
Player.layer = 0 -- render layer

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
  self.height = 7*SCALE_FACTOR

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
    self.animationQuads[k] = sliceAnimToQuads(anim, SPRITE_SHEET)
  end
  self.visible = {
    x = self.x,
    y = self.y,
    width = PLAYER_META.width*SCALE_FACTOR,
    height = PLAYER_META.height*SCALE_FACTOR,
  }

  -- normal xy is for hitbox, visible xy is for visual

  gameWorld:add(self, self.x, self.y, self.width, self.height)

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
  -- input player attack
  if checkInput("Confirm", "press") and not self.weapon then
    self.weapon = Weapon({ type = self.weaponType })
  end
  -- input to change weapon
  if checkInput("s", "press") then
    self.weaponType = nextType(self.weaponType, WEAPON_META.list)
  elseif checkInput("a", "press") then
    self.weaponType = prevType(self.weaponType, WEAPON_META.list)
  end

  -- move the player & check collision using bump
  local playerFilter = function(item, other)
    if other.__index == Floor then return "cross"
    else return "slide" end
  end

  local goalX, goalY = self.x + self.dx, self.y + self.dy
  local actualX, actualY = gameWorld:move(self, goalX, goalY, playerFilter)
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
  self.visible.x = self.x + self.width/2 - self.visible.width/2
  self.visible.y = self.y + self.height - self.visible.height

  -- update weapon
  local vx, vy, vw, vh = self.visible.x, self.visible.y, self.visible.width, self.visible.height
  if self.weapon then
    if self.isRight == 1 then
      self.weapon:transform(vx+vw-30, vy+vh/4*3-self.weapon.visible.height, 1)
    elseif self.isRight == -1 then
      self.weapon:transform(vx-self.weapon.width+30, vy+vh/4*3-self.weapon.visible.height, -1)
    end
    self.weapon:update(dt)
    if self.weapon.timer > self.weapon.lifetime then
      self.weapon = nil
    end
  end


end

---------------------------------------------------------------------------------------------------------


function Player:render()
  local vx, vy, vw, vh = self.visible.x, self.visible.y, self.visible.width, self.visible.height

  -- for debug
  if gDebug then
    love.graphics.setColor(COLORS.red)
    love.graphics.rectangle("line", vx, vy, vw, vh)

    love.graphics.setColor(COLORS.white)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
  end

  love.graphics.setColor(COLORS.white)

  -- render weapon if any
  if self.weapon then
    self.weapon:render()
  end

  -- correct direction according to self.isRight
  if self.isRight == 1 then
    love.graphics.draw(SPRITE_SHEET, self.animationQuads[self.state][self.curFrame],
      vx, vy, 0, SCALE_FACTOR)
  elseif self.isRight == -1 then
    love.graphics.draw(SPRITE_SHEET, self.animationQuads[self.state][self.curFrame],
      vx, vy, 0, SCALE_FACTOR*-1, SCALE_FACTOR, vw/SCALE_FACTOR)
  end

end

---------------------------------------------------------------------------------------------------------
