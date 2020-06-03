-- all sprites
spriteSheet = love.graphics.newImage("Sprite/DungeonTileset.png")

---------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------

PLAYER_DEFS = {
  elfF = {
    animations = {
      idle = newAnimation(128, 4, 16, 28, 4, 0.155),
      run = newAnimation(192, 4, 16, 28, 4, 0.155),
      hit = newAnimation(256, 4, 16, 28, 1, 0.155),
    }
  },
  elfM = {
    animations = {
      idle = newAnimation(128, 36, 16, 28, 4, 0.155),
      run = newAnimation(192, 36, 16, 28, 4, 0.155),
      hit = newAnimation(256, 36, 16, 28, 1, 0.155),
    }
  },
  knightF = {
    animations = {
      idle = newAnimation(128, 68, 16, 28, 4, 0.155),
      run = newAnimation(192, 68, 16, 28, 4, 0.155),
      hit = newAnimation(256, 68, 16, 28, 1, 0.155),
    }
  },
  knightM = {
    animations = {
      idle = newAnimation(128, 100, 16, 28, 4, 0.155),
      run = newAnimation(192, 100, 16, 28, 4, 0.155),
      hit = newAnimation(256, 100, 16, 28, 1, 0.155),
    }
  },
  wizzardF = {
    animations = {
      idle = newAnimation(128, 132, 16, 28, 4, 0.155),
      run = newAnimation(192, 132, 16, 28, 4, 0.155),
      hit = newAnimation(256, 132, 16, 28, 1, 0.155),
    }
  },
  wizzardM = {
    animations = {
      idle = newAnimation(128, 164, 16, 28, 4, 0.155),
      run = newAnimation(192, 164, 16, 28, 4, 0.155),
      hit = newAnimation(256, 164, 16, 28, 1, 0.155),
    }
  },
  lizzardF = {
    animations = {
      idle = newAnimation(128, 196, 16, 28, 4, 0.155),
      run = newAnimation(192, 196, 16, 28, 4, 0.155),
      hit = newAnimation(256, 196, 16, 28, 1, 0.155),
    }
  },
  lizzardM = {
    animations = {
      idle = newAnimation(128, 228, 16, 28, 4, 0.155),
      run = newAnimation(192, 228, 16, 28, 4, 0.155),
      hit = newAnimation(256, 228, 16, 28, 1, 0.155),
    }
  },


}
PLAYER_META = { width = 16, height = 28, speed = 300 }

---------------------------------------------------------------------------------------------------------
-- font data
fontPresets = {
  veryLarge = love.graphics.newFont("Font/stocky.ttf", 300),
  large = love.graphics.newFont("Font/stocky.ttf", 170),
  medium = love.graphics.newFont("Font/stocky.ttf", 80),
  small = love.graphics.newFont("Font/stocky.ttf", 50),
  verySmall = love.graphics.newFont("Font/stocky.ttf", 25),
}

---------------------------------------------------------------------------------------------------------
-- color data
colorPresets = {
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
-- input data
controlTable = {
  Confirm = {"x", "return"},
  Cancel = {"z", "backspace"},
  SpecialA = {"lshift"},
  SpecialB = {"c"},
  Up = {"up", "kp8"},
  Down = {"down", "kp2"},
  Left = {"left", "kp4"},
  Right = {"right", "kp6"},
}

---------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------
