PlayState = class{}

---------------------------------------------------------------------------------------------------------

function PlayState:enter()
  gameWorld = bump.newWorld()

  local newPlayerAttri = { type = "knightM"}
  player = Player(newPlayerAttri)

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
