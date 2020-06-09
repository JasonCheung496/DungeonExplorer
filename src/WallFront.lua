WallFront = class{}
WallFront.layer = 0 -- render layer

---------------------------------------------------------------------------------------------------------

function WallFront:init(newAttri)
  local attri = newAttri or {}

  self.x = attri.x or 0
  self.y = attri.y or 0
  self.type = attri.type or "left" -- "left", "mid", "right"

  self.width = WALL_META.w * SCALE_FACTOR
  self.height = WALL_META.w * SCALE_FACTOR

  local frame = WALL[self.type]
  frame.w, frame.h = WALL_META.w, WALL_META.h
  self.quad1 = love.graphics.newQuad(frame.x, frame.y, frame.w, frame.h, SPRITE_SHEET:getDimensions())
  local frame = WALL["top_" .. self.type]
  frame.w, frame.h = WALL_META.w, WALL_META.h
  self.quad2 = love.graphics.newQuad(frame.x, frame.y, frame.w, frame.h, SPRITE_SHEET:getDimensions())

  local hitbox = { width = self.width, height = self.height/2-20, x = self.x, }
  hitbox.y = self.y + self.height - hitbox.height
  gameWorld:add(self, hitbox.x, hitbox.y, hitbox.width, hitbox.height)

end

---------------------------------------------------------------------------------------------------------
function WallFront:update(dt) end
---------------------------------------------------------------------------------------------------------

function WallFront:render()
  love.graphics.setColor(COLORS.white)
  love.graphics.draw(SPRITE_SHEET, self.quad1, self.x, self.y, 0, SCALE_FACTOR)
  love.graphics.draw(SPRITE_SHEET, self.quad2, self.x, self.y-TILE_HEIGHT, 0, SCALE_FACTOR)

  -- for debug
  if gDebug then
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

    local x, y = love.mouse.getPosition()
    if x > self.x and x < self.x + self.width and y > self.y and y < self.y + self.height then
      love.graphics.setFont(FONTS.verySmall)
      love.graphics.print(tostring(self.type), 0, 500)
    end
  end

end

---------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------
