StateMachine = Class{}
local baseStates = {
  enter = function () end,
  update = function () end,
  render = function () end,
  exit = function () end,
}

-- Each states contain at least 4 functions:
-- enter(): execute once when entering the state
-- update(): execute every frames
-- render(): execute every frames but should mainly be used for drawing
-- exit(): execute when changing to the next state

-- !Note that when changing state A to B in A:update(),
-- in the same frame, B:render() will be executed right after. Be careful when changing state.

function StateMachine:init(states)
  --[[states should be in the form
  {
    menuState = MenuState(),
    playState = PlayState()
  }
  where MenuState() and PlayState() are tables/classes containing the 4 functions
  ]]
  self.states = states or {}
  self.curState = baseStates

end

function StateMachine:update(dt)
  self.curState:update(dt)
end

function StateMachine:render()
  self.curState:render()
end

function StateMachine:change(nextState, ...) -- allow parameters for the next state
  if self.states[nextState] == nil then
    error("Invalid State") -- throw error if nextState does not exit
  end
  self.curState:exit()
  self.curState = self.states[nextState]
  self.curState:enter(...)

end
