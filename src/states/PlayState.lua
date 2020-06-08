PlayState = class{}

---------------------------------------------------------------------------------------------------------

function PlayState:enter()
  gameWorld = bump.newWorld()

  local newPlayerAttri = { type = "lizzard_f", weaponType = "rusty_sword" }
  player = Player(newPlayerAttri)
  local newEnemyAttri = { type = "tiny_zombie"}
  enemy = Enemy(newEnemyAttri)

  items = gameWorld:getItems()

end

---------------------------------------------------------------------------------------------------------

function PlayState:update(dt)
  items = gameWorld:getItems()

  -- update all items
  for key, item in pairs(items) do
    item:update(dt)
  end

  items = gameWorld:getItems()

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
