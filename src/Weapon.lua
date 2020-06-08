Weapon = class{}

---------------------------------------------------------------------------------------------------------

function Weapon:init(newAttri)
  local attri = newAttri or {}
  -- initialise weapon attributes according to attri
  self.x = attri.x or GAME_WIDTH/2
  self.y = attri.y  or GAME_HEIGHT/2
  if attri.type and WEAPON_DEFS[attri.type] then
    self.type = attri.type
  else
    self.type = "knife"
  end
  self.lifetime = WEAPON_DEFS[self.type].attackTime

  local frame = WEAPON_DEFS[self.type].frame
  -- for hitbox
  self.width = frame.h * SCALE_FACTOR + 20
  self.height = frame.h * 2 * SCALE_FACTOR

  -- for render animations
  self.isRight = 1
  self.quad = love.graphics.newQuad(frame.x, frame.y, frame.w, frame.h, SPRITE_SHEET:getDimensions())
  self.timer = 0
  self.visible = {
    x = self.x,
    y = self.y,
    width = frame.w*SCALE_FACTOR,
    height = frame.h*SCALE_FACTOR,
    angle = 0
  }

end

---------------------------------------------------------------------------------------------------------

function Weapon:update(dt)
  local items, len = gameWorld:queryRect(self.x, self.y, self.width, self.height)
  for _, entity in pairs(items) do
    if entity.__index == Enemy then
      -- each time enemyies should only be hit by the same weapon once,
      -- so invincibleTime = self.lifetime-self.timer
      entity:hitByWeapon(WEAPON_DEFS[self.type].damage, self.lifetime-self.timer)
    end
  end

  -- destroy itself if timer > lifetime
  self.timer = self.timer + dt

  -- update animation according to self.isRight
  self.visible.angle = math.pi*self.timer/self.lifetime * self.isRight
  self.visible.x, self.visible.y = rotate(self.x, self.y, self.visible.width/2,
    self.visible.height, self.visible.angle)
  if self.isRight == -1 then
    self.visible.x = self.visible.x + self.width - self.visible.width
  end

end

---------------------------------------------------------------------------------------------------------

function Weapon:render()
  love.graphics.setColor(COLORS.white)
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

  -- correct direction according to self.isRight
  if self.isRight == 1 then
    love.graphics.draw(SPRITE_SHEET, self.quad, self.visible.x, self.visible.y,
      self.visible.angle, SCALE_FACTOR)
  elseif self.isRight == -1 then
    love.graphics.draw(SPRITE_SHEET, self.quad, self.visible.x, self.visible.y,
      self.visible.angle, -SCALE_FACTOR, SCALE_FACTOR, self.visible.width/SCALE_FACTOR)
  end

end

---------------------------------------------------------------------------------------------------------

function Weapon:transform(x, y, direction)
  self.x, self.y = x, y
  self.isRight = direction

end

---------------------------------------------------------------------------------------------------------
