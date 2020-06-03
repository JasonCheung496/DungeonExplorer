PlayState = class{}

---------------------------------------------------------------------------------------------------------

function PlayState:enter()
  world = bump.newWorld()

  local newPlayerAttri = { type = "knightM"}
  player = Player(newPlayerAttri)

  items = world:getItems()

end

---------------------------------------------------------------------------------------------------------

function PlayState:update(dt)
  items = world:getItems()

  -- update all items
  for key, item in pairs(items) do
    item:update(dt)
  end


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
