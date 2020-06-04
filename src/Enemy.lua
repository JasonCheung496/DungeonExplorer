Enemy = class{}

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

  -- for movement
  self.dx = 0
  self.dy = 0
  self.speed = ENEMY_META.speed
  self.angle = 0
  self.push = 0

  -- for animation
  self.state = "idle"
  self.isRight = 1 -- 1 if facing right, -1 if facing left
  self.animTimer = 0
  self.curFrame = 1
  self.animationQuads = {}
  -- cutting quads according to ENEMY_DEFS's animations
  for k, anim in pairs(ENEMY_DEFS[self.type].animations) do
    self.animationQuads[k] = sliceAnimToQuads(anim, spriteSheet)
  end

  gameWorld:add(self, self.x, self.y, self.width, self.height)

end

---------------------------------------------------------------------------------------------------------

function Enemy:update(dt)
  -- random movement

  -- move the enemy & check collision using bump
  local enemyFilter = function(item, other)
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
  local curAnim = ENEMY_DEFS[self.type].animations[self.state]
  self.animTimer = (self.animTimer + dt) % (curAnim.numOfFrames*curAnim.interval)
  self.curFrame = math.ceil(self.animTimer/curAnim.interval)

end

---------------------------------------------------------------------------------------------------------


function Enemy:render()
  love.graphics.setColor(COLORS.white)
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

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
