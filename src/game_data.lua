-- all sprites
spriteSheet = love.graphics.newImage("Sprite/DungeonTileset.png")

---------------------------------------------------------------------------------------------------------
-- const scale factor
SCALE_FACTOR = 3

---------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------
-- player data
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
  }
}
PLAYER_META = { width = 16, height = 28, speed = 300 }

---------------------------------------------------------------------------------------------------------
-- enemy data
ENEMY_DEFS = {
  tiny_zombie = {
    frame = "A",
    animations = {
      idle = newAnimation(368, 16, 16, 16, 4, 0.155),
      run = newAnimation(432, 16, 16, 16, 4, 0.155),
    },
  },
  goblin = {
    frame = "A",
    animations = {
      idle = newAnimation(368, 32, 16, 16, 4, 0.155),
      run = newAnimation(432, 32, 16, 16, 4, 0.155),
    },
  },
}
ENEMY_META = {
  list = { "tiny_zombie",  "goblin", },
  frameA = { width = 16, height = 16},
  frameB = { width = 16, height = 20},
  speed = 200,
}

---------------------------------------------------------------------------------------------------------
-- weapon data
WEAPON_DEFS = {
  knife = {
    damage = 10, hitbox = "S", attackTime = 0.2,
    frame = { x = 293, y = 18, w = 6, h = 13}
  },
  rusty_sword = {
    damage = 15, hitbox = "M", attackTime = 0.4,
    frame = { x = 307, y = 26, w = 10, h = 21}
  },
  regular_sword = {
    damage = 12, hitbox = "M", attackTime = 0.5,
    frame = { x = 323, y = 26, w = 10, h = 21}
  },
}
WEAPON_META = {
  list = { "knife", "rusty_sword", "regular_sword", },
  hitboxS = {w = 30*SCALE_FACTOR, h = 30*SCALE_FACTOR},
  hitboxM = {w = 50*SCALE_FACTOR, h = 50*SCALE_FACTOR},
  hitboxL = {w = 80*SCALE_FACTOR, h = 80*SCALE_FACTOR},
}

---------------------------------------------------------------------------------------------------------
-- input defs
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



---------------------------------------------------------------------------------------------------------
