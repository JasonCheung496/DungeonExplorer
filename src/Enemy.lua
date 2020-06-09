Enemy = class{}
Enemy.layer = 0 -- render layer

---------------------------------------------------------------------------------------------------------

function Enemy:init(newAttri)
  local attri = newAttri or {}
  -- initialise enemy attributes according to attri
  self.x = attri.x or GAME_WIDTH/2
  self.y = attri.y  or GAME_HEIGHT/2
  if attri.type and ENEMY_DEFS[attri.type] then
    self.type = attri.type
  else
    self.type = "tiny_zombie"
  end

  local frame = "frame" .. ENEMY_DEFS[self.type].frame
  self.width = ENEMY_META[frame].width*SCALE_FACTOR
  self.height = ENEMY_META[frame].height*SCALE_FACTOR

  self.HP = 100
  self.invincibleTime = 0

  -- for movement
  self.speed = ENEMY_META.speed
  self.angle = 0
  self.dx = 0
  self.dy = 0
  self.push = 0 -- for random movement

  -- for animation
  self.state = "idle"
  self.isRight = 1 -- 1 if facing right, -1 if facing left
  self.animTimer = 0
  self.curFrame = 1
  self.animationQuads = {}
  -- cutting quads according to ENEMY_DEFS's animations
  for k, anim in pairs(ENEMY_DEFS[self.type].animations) do
    self.animationQuads[k] = sliceAnimToQuads(anim, SPRITE_SHEET)
  end

  gameWorld:add(self, self.x, self.y, self.width, self.height)

end

---------------------------------------------------------------------------------------------------------

function Enemy:update(dt)
  -- update invincibleTime
  self.invincibleTime = math.max(0, self.invincibleTime-dt)



  -- random movement
  if self.push > 0 then
    self.dx = self.speed * math.cos(self.angle) * dt * self.push
    self.dy = self.speed * math.sin(self.angle) * dt * self.push
  elseif math.random(1, 100) == 1 then
    -- 1% chance to initiate random movement
    self.push = math.random(80, 100)/100
    self.angle = math.random(0, 359)/180*math.pi
  else
    -- stop if no random movement
    self.dx, self.dy = 0, 0
  end
  self.push = math.max(0, self.push-dt)

  -- move the enemy & check collision using bump
  local enemyFilter = function(item, other)
    if other.__index == Floor then return "cross"
    else return "slide" end
  end

  local goalX, goalY = self.x + self.dx, self.y + self.dy
  local actualX, actualY = gameWorld:move(self, goalX, goalY, enemyFilter)
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
  local curAnim = ENEMY_DEFS[self.type].animations[self.state]
  self.animTimer = (self.animTimer + dt) % (curAnim.numOfFrames*curAnim.interval)
  self.curFrame = math.ceil(self.animTimer/curAnim.interval)

  -- remove itself in HP <= 0
  if self.HP <= 0 then
    gameWorld:remove(self)
  end

end

---------------------------------------------------------------------------------------------------------


function Enemy:render()
  love.graphics.setColor(COLORS.white)

  -- for debug
  if gDebug then
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
  end

  -- if in invincibleTime, render flashing sprite
  if self.invincibleTime % 0.3 <= 0.15 then
    -- correct direction according to self.isRight
    if self.isRight == 1 then
      love.graphics.draw(SPRITE_SHEET, self.animationQuads[self.state][self.curFrame],
        self.x, self.y, 0, SCALE_FACTOR)
    elseif self.isRight == -1 then
      love.graphics.draw(SPRITE_SHEET, self.animationQuads[self.state][self.curFrame],
        self.x+self.width, self.y, 0, SCALE_FACTOR*-1, SCALE_FACTOR)
    end
  end

end

---------------------------------------------------------------------------------------------------------

function Enemy:changeHealth(val)
  self.HP = self.HP + val
end

---------------------------------------------------------------------------------------------------------

function Enemy:hitByWeapon(val, invincibleTime)
  if self.invincibleTime <= 0 then
    self:changeHealth(-val)
    self.invincibleTime = invincibleTime
  end
end

---------------------------------------------------------------------------------------------------------
