
---------------------------------------------------------------------------------------------------------
-- handle animation
function newAnimation(x, y, w, h, num, interval)
  return {
    frame = {x = x, y = y, w = w, h = h},
    numOfFrames = num,
    interval = interval
  }
end

function sliceAnimToQuads(animation, image)
  local t = {}
  for i = 1, animation.numOfFrames do
    table.insert(t, love.graphics.newQuad(animation.frame.x + animation.frame.w*(i-1),
      animation.frame.y, animation.frame.w, animation.frame.h, image:getDimensions()))
  end
  return t
end

---------------------------------------------------------------------------------------------------------

function sign(num)
  if num > 0 then
    return 1
  elseif num == 0 then
    return 0
  else
    return -1
  end
end

---------------------------------------------------------------------------------------------------------
-- handle input
function checkInput(key, method)
  local ans = false

  if controlTable[key] and method == "press" then
    for k,v in pairs(controlTable[key]) do ans = ans or inputTable[v] end
  elseif controlTable[key] and method == "hold" then
    for k,v in pairs(controlTable[key]) do ans = ans or love.keyboard.isDown(v) end
  elseif method == "press" then
    ans = inputTable[key]
  elseif method == "hold" then
    ans = love.keyboard.isDown(key)
  end

  return ans

end

---------------------------------------------------------------------------------------------------------
