require "src/dependencies"

GAME_WIDTH, GAME_HEIGHT = 1600, 900
local WINDOW_WIDTH, WINDOW_HEIGHT = love.window.getDesktopDimensions()
WINDOW_WIDTH, WINDOW_HEIGHT = WINDOW_WIDTH*0.8, WINDOW_HEIGHT*0.8

---------------------------------------------------------------------------------------------------------

function love.load()
  push:setupScreen(GAME_WIDTH, GAME_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = true,
    vsync = true
  })

  love.window.setTitle("Dungeon Explorer")

  math.randomseed(os.time())

  gGameState = StateMachine ({
    play = PlayState()
  })
  gGameState:change("play")
  gDebug = false

  inputTable = {}

end

---------------------------------------------------------------------------------------------------------

function love.update(dt)
  gGameState:update(dt)

  if checkInput("f1", "press") then
    gDebug = gDebug == false
  end

  inputTable = {}

end

---------------------------------------------------------------------------------------------------------

function love.draw()
  push:start()

  --love.graphics.clear(COLORS.white)

  gGameState:render()

  if gDebug then
    love.graphics.setColor(COLORS.yellow)
    love.graphics.setFont(FONTS.verySmall)
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)

    local stats = love.graphics.getStats()
    love.graphics.print(string.format("Texture memory used: %.2f MB", stats.texturememory/1024/1024), 10, 50)
  end

  push:finish()

end

---------------------------------------------------------------------------------------------------------
function love.resize(w, h) push:resize(w, h) end
---------------------------------------------------------------------------------------------------------

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end
  inputTable[key] = true

end

---------------------------------------------------------------------------------------------------------
