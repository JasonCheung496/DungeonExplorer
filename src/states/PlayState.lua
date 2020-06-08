PlayState = class{}

---------------------------------------------------------------------------------------------------------

function PlayState:enter()
  gameWorld = bump.newWorld()

  local newPlayerAttri = { type = "lizzard_f", weaponType = "big_hammer" }
  player = Player(newPlayerAttri)
  local newEnemyAttri = { x = 600, y = 300, type = "tiny_zombie"}
  enemy1 = Enemy(newEnemyAttri)
  local newEnemyAttri = { x = 600, y = 500, type = "imp"}
  enemy2 = Enemy(newEnemyAttri)

  items = gameWorld:getItems()

end

---------------------------------------------------------------------------------------------------------

function PlayState:update(dt)
  items = gameWorld:getItems()

  -- update all items
  for key, item in pairs(items) do
    item:update(dt)
  end

  items = gameWorld:getItems() -- for render, in case anything is removed in update

end

---------------------------------------------------------------------------------------------------------

function PlayState:render()
  -- render all items
  for key, item in pairs(items) do
    item:render(dt)
  end

end

---------------------------------------------------------------------------------------------------------

function PlayState:exit()

end

---------------------------------------------------------------------------------------------------------
