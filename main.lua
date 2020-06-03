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


  gGameState = StateMachine ({
    play = PlayState()
  })
  gGameState:change("play")

end

---------------------------------------------------------------------------------------------------------

function love.update(dt)
  gGameState:update(dt)

end

---------------------------------------------------------------------------------------------------------

function love.draw()
  push:start()

  gGameState:render()

  push:finish()

end

---------------------------------------------------------------------------------------------------------
function love.resize(w, h) push:resize(w, h) end
---------------------------------------------------------------------------------------------------------
