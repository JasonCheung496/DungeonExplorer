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
-- walls sprite
WALL = {
  top_left = { x = 16, y = 0 },
  top_mid = { x = 32, y = 0 },
  top_right = { x = 48, y = 0 },

  left = { x = 16, y = 16 },
  mid = { x = 32, y = 16 },
  right = { x = 48, y = 16 },

  side_top_left = { x = 0, y = 112 },
  side_top_right = { x = 16, y = 112 },
  side_mid_left = { x = 0, y = 128 },
  side_mid_right = { x = 16, y = 128 },
  side_front_left = { x = 0, y = 144 },
  side_front_right = { x = 16, y = 144 },

  corner_top_left = { x = 32, y = 112 },
  corner_top_right = { x = 48, y = 112 },
  corner_left = { x = 32, y = 128 },
  corner_right = { x = 48, y = 128 },
  corner_bottom_left = { x = 32, y = 144 },
  corner_bottom_right = { x = 48, y = 144 },
  corner_front_left = { x = 32, y = 160 },
  corner_front_right = { x = 48, y = 160 },

  inner_corner_l_top_left = { x = 80, y = 128 },
  inner_corner_l_top_rigth = { x = 64, y = 128 },
  inner_corner_mid_left = { x = 80, y = 144 },
  inner_corner_mid_rigth = { x = 64, y = 144 },
  inner_corner_t_top_left = { x = 80, y = 160 },
  inner_corner_t_top_rigth = { x = 64, y = 160 },
}

WALL_META = {
  w = 16, h = 16,
  list = { "top_left", "top_mid", "top_right", "left", "mid", "right", "side_top_left",
  "side_top_right", "side_mid_left", "side_mid_right", "side_front_left", "side_front_right",
  "corner_top_left", "corner_top_right", "corner_left", "corner_right", "corner_bottom_left",
  "corner_bottom_right", "corner_front_left", "corner_front_right", "inner_corner_l_top_left",
  "inner_corner_l_top_rigth", "inner_corner_mid_left", "inner_corner_mid_rigth",
  "inner_corner_t_top_left", "inner_corner_t_top_rigth" }
}

---------------------------------------------------------------------------------------------------------
-- floor sprite
FLOOR = {}
FLOOR["1"] = { x = 16, y = 64 }
FLOOR["2"] = { x = 32, y = 64 }
FLOOR["3"] = { x = 48, y = 64 }
FLOOR["4"] = { x = 16, y = 80 }
FLOOR["5"] = { x = 32, y = 80 }
FLOOR["6"] = { x = 48, y = 80 }
FLOOR["7"] = { x = 16, y = 96 }
FLOOR["8"] = { x = 32, y = 96 }
FLOOR["ladder"] = { x = 48, y = 96 }

FLOOR_META = {
  w = 16, h = 16,
  list = {"1", "2", "3", "4", "5", "6", "7", "8", "ladder"},
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
