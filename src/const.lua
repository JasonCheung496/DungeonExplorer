---------------------------------------------------------------------------------------------------------
-- scale factor const
SCALE_FACTOR = 3

---------------------------------------------------------------------------------------------------------
-- all sprites
SPRITE_SHEET = love.graphics.newImage("Sprite/DungeonTileset.png")

---------------------------------------------------------------------------------------------------------
-- font const
FONTS = {
  veryLarge = love.graphics.newFont("Font/stocky.ttf", 300),
  large = love.graphics.newFont("Font/stocky.ttf", 170),
  medium = love.graphics.newFont("Font/stocky.ttf", 80),
  small = love.graphics.newFont("Font/stocky.ttf", 50),
  verySmall = love.graphics.newFont("Font/stocky.ttf", 25),
}

---------------------------------------------------------------------------------------------------------
-- color const
COLORS = {
  white = {1, 1, 1},
  red = {1, 0, 0},
  yellow = {1, 1, 0},
  green = {0, 1, 0},
  cyan = {0, 1, 1},
  blue = {0, 0, 1},
  purple = {1, 0, 1},
  black = {0, 0, 0}
}

---------------------------------------------------------------------------------------------------------
-- tiles const
TILE_WIDTH = 16*SCALE_FACTOR
TILE_HEIGHT = 16*SCALE_FACTOR

---------------------------------------------------------------------------------------------------------
