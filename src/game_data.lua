---------------------------------------------------------------------------------------------------------
-- player data
PLAYER_DEFS = {
  elf_f = {
    animations = {
      idle = newAnimation(128, 4, 16, 28, 4, 0.155),
      run = newAnimation(192, 4, 16, 28, 4, 0.155),
      hit = newAnimation(256, 4, 16, 28, 1, 0.155),
    }
  },
  elf_m = {
    animations = {
      idle = newAnimation(128, 36, 16, 28, 4, 0.155),
      run = newAnimation(192, 36, 16, 28, 4, 0.155),
      hit = newAnimation(256, 36, 16, 28, 1, 0.155),
    }
  },
  knight_f = {
    animations = {
      idle = newAnimation(128, 68, 16, 28, 4, 0.155),
      run = newAnimation(192, 68, 16, 28, 4, 0.155),
      hit = newAnimation(256, 68, 16, 28, 1, 0.155),
    }
  },
  knight_m = {
    animations = {
      idle = newAnimation(128, 100, 16, 28, 4, 0.155),
      run = newAnimation(192, 100, 16, 28, 4, 0.155),
      hit = newAnimation(256, 100, 16, 28, 1, 0.155),
    }
  },
  wizzard_f = {
    animations = {
      idle = newAnimation(128, 132, 16, 28, 4, 0.155),
      run = newAnimation(192, 132, 16, 28, 4, 0.155),
      hit = newAnimation(256, 132, 16, 28, 1, 0.155),
    }
  },
  wizzard_m = {
    animations = {
      idle = newAnimation(128, 164, 16, 28, 4, 0.155),
      run = newAnimation(192, 164, 16, 28, 4, 0.155),
      hit = newAnimation(256, 164, 16, 28, 1, 0.155),
    }
  },
  lizzard_f = {
    animations = {
      idle = newAnimation(128, 196, 16, 28, 4, 0.155),
      run = newAnimation(192, 196, 16, 28, 4, 0.155),
      hit = newAnimation(256, 196, 16, 28, 1, 0.155),
    }
  },
  lizzard_m = {
    animations = {
      idle = newAnimation(128, 228, 16, 28, 4, 0.155),
      run = newAnimation(192, 228, 16, 28, 4, 0.155),
      hit = newAnimation(256, 228, 16, 28, 1, 0.155),
    }
  }
}
PLAYER_META = { width = 16, height = 28, speed = 300,
  list = {"elf_f", "elf_m", "knight_f", "knight_m",
    "wizzard_f","wizzard_m", "lizzard_f", "lizzard_m"},
}

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
  imp = {
    frame = "A",
    animations = {
      idle = newAnimation(368, 48, 16, 16, 4, 0.155),
      run = newAnimation(432, 48, 16, 16, 4, 0.155),
    },
  },
  skelet = {
    frame = "A",
    animations = {
      idle = newAnimation(368, 80, 16, 16, 4, 0.155),
      run = newAnimation(432, 80, 16, 16, 4, 0.155),
    },
  },
}
ENEMY_META = {
  list = { "tiny_zombie",  "goblin", "imp", "skelet"},
  frameA = { width = 16, height = 16},
  frameB = { width = 16, height = 20},
  speed = 200,
}

---------------------------------------------------------------------------------------------------------
-- weapon data
WEAPON_DEFS = {
  knife = {
    damage = 10, attackTime = 0.20,
    frame = { x = 293, y = 18, w = 6, h = 13}
  },
  rusty_sword = {
    damage = 12, attackTime = 0.50,
    frame = { x = 307, y = 26, w = 10, h = 21}
  },
  regular_sword = {
    damage = 15, attackTime = 0.40,
    frame = { x = 323, y = 26, w = 10, h = 21}
  },
  red_gem_sword = {
    damage = 18, attackTime = 0.42,
    frame = { x = 339, y = 26, w = 10, h = 21}
  },
  big_hammer = {
    damage = 20, attackTime = 1.00,
    frame = { x = 291, y = 42, w = 10, h = 37}
  },
}
WEAPON_META = {
  list = { "knife", "rusty_sword", "regular_sword", "red_gem_sword", "big_hammer",},
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
