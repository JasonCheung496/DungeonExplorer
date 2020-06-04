
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
--handle rotation
function rotate(x, y, width, height, angle)
  -- rotate rectangle (x, y, width, height) with angle clockwise about its bottom-right corner
  -- return x, y (top-left corner of the rectangle) after rotation
  local r = math.sqrt(math.pow(width, 2) + math.pow(height, 2))
  local theta = math.atan2(height, width)
  newX = x + width - r*math.cos(theta + angle)
  newY = y + height - r*math.sin(theta + angle)
  return newX, newY
end

---------------------------------------------------------------------------------------------------------
-- for transversing table
function nextType(curType, listType)
  for i, val in ipairs(listType) do
    if val == curType and listType[i+1] then
      return listType[i+1]
    end
  end
  return listType[1]
end

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
