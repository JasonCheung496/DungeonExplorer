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

  --[[
  wall = {}
  local cnt = 1
  while cnt <= #WALL_META.list do
    local newWallAttri = { x = 200+(cnt%5)*48, y = 200+(math.floor(cnt/5))*48, type = WALL_META.list[cnt] }
    table.insert(wall, Wall(newWallAttri))
    cnt = cnt + 1
  end
  ]]

  gameRoom = newRoom(200, 100, 50, 30)

  -- for gGameState:change() so it skips the update()
  items = gameWorld:getItems()

  -- for camera
  screenScroll = {}
  screenScroll.x = 0
  screenScroll.y = 0

end

---------------------------------------------------------------------------------------------------------

function PlayState:update(dt)
  items = gameWorld:getItems()

  -- update all items
  for key, item in pairs(items) do
    item:update(dt)
  end

  items = gameWorld:getItems() -- for render(), in case anything is removed in update()
  table.sort(items, renderOrder) -- draw items according to y-coordinate, for more logical visual

  updateCamera(screenScroll, player)

end

---------------------------------------------------------------------------------------------------------

function PlayState:render()
  love.graphics.setFont(FONTS.verySmall)
  love.graphics.setColor(COLORS.white)
  if gDebug then
    love.graphics.print(string.format("screenScroll.x:%d", screenScroll.x), 800, 10)
    love.graphics.print(string.format("screenScroll.y:%d", screenScroll.y), 800, 50)
  end
  
  love.graphics.translate(screenScroll.x, screenScroll.y)


  -- render all items
  for i, item in ipairs(items) do
    item:render(dt)
  end

end

---------------------------------------------------------------------------------------------------------

function PlayState:exit()

end

---------------------------------------------------------------------------------------------------------
