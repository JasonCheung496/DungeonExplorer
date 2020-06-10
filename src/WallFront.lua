WallFront = class{}
WallFront.layer = 0 -- render layer

---------------------------------------------------------------------------------------------------------

function WallFront:init(newAttri)
  local attri = newAttri or {}

  self.visible = {}
  self.visible.x = attri.x or 0
  self.visible.y = attri.y or 0
  self.type = attri.type or "left" -- "left", "mid", "right"

  self.visible.width = WALL_META.w * SCALE_FACTOR
  self.visible.height = WALL_META.w * SCALE_FACTOR

  local frame = WALL[self.type]
  frame.w, frame.h = WALL_META.w, WALL_META.h
  self.quad1 = love.graphics.newQuad(frame.x, frame.y, frame.w, frame.h, SPRITE_SHEET:getDimensions())
  local frame = WALL["top_" .. self.type]
  frame.w, frame.h = WALL_META.w, WALL_META.h
  self.quad2 = love.graphics.newQuad(frame.x, frame.y, frame.w, frame.h, SPRITE_SHEET:getDimensions())

  self.width = self.visible.width
  self.height = self.visible.height/2-10
  self.x = self.visible.x
  self.y = self.visible.y + self.visible.height - self.height
  gameWorld:add(self, self.x, self.y, self.width, self.height)

end

---------------------------------------------------------------------------------------------------------
function WallFront:update(dt) end
---------------------------------------------------------------------------------------------------------

function WallFront:render()
  love.graphics.setColor(COLORS.white)
  love.graphics.draw(SPRITE_SHEET, self.quad1, self.visible.x, self.visible.y, 0, SCALE_FACTOR)
  love.graphics.draw(SPRITE_SHEET, self.quad2, self.visible.x, self.visible.y-TILE_HEIGHT, 0, SCALE_FACTOR)

  -- for debug
  if gDebug then
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

    local x, y = love.mouse.getPosition()
    if x > self.visible.x and x < self.visible.x + self.visible.width and y > self.visible.y and y < self.visible.y + self.visible.height then
      love.graphics.setFont(FONTS.verySmall)
      love.graphics.print(tostring(self.type), 0, 500)
    end
  end

end

---------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------
