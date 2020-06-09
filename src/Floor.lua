Floor = class{}
Floor.layer = -1 -- render layer

---------------------------------------------------------------------------------------------------------

function Floor:init(newAttri)
  local attri = newAttri or {}

  self.x = attri.x or 0
  self.y = attri.y or 0
  self.type = attri.type or "1"

  self.width = FLOOR_META.w * SCALE_FACTOR
  self.height = FLOOR_META.w * SCALE_FACTOR

  local frame = FLOOR[self.type]
  frame.w, frame.h = FLOOR_META.w, FLOOR_META.h
  self.quad = love.graphics.newQuad(frame.x, frame.y, frame.w, frame.h, SPRITE_SHEET:getDimensions())

  gameWorld:add(self, self.x, self.y, self.width, self.height)

end

---------------------------------------------------------------------------------------------------------
function Floor:update(dt) end
---------------------------------------------------------------------------------------------------------

function Floor:render()
  love.graphics.setColor(COLORS.white)
  love.graphics.draw(SPRITE_SHEET, self.quad, self.x, self.y, 0, SCALE_FACTOR)

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
