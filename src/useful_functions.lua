
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
-- mathematical
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

function prevType(curType, listType)
  for i, val in ipairs(listType) do
    if val == curType and listType[i-1] then
      return listType[i-1]
    end
  end
  return listType[#listType]
end

---------------------------------------------------------------------------------------------------------
-- for drawing order
function orderY(itemA, itemB)
  return itemA.y < itemB.y
end

---------------------------------------------------------------------------------------------------------
-- for creating room
function newRoom(x, y, numCol, numRow)
  -- creating a rectangular room with size x*y
  local room = {}
  for i = 0, numRow do room[i] = {} end

  -- build the floor
  for i = 2, numRow-1 do
    local newRow = {}
    for j = 2, numCol-1 do
      local newAttri = { x = x + (j-1)*TILE_WIDTH, y = y + (i-1)*TILE_HEIGHT }
      newAttri.type = tostring(math.random(1, 8))
      newRow[j] = Floor(newAttri)
    end
    room[i] = newRow
  end

  -- build the front wall
  for _, i in ipairs({ 1, numRow }) do
    for j = 2, numCol-1 do
      local newAttri = { x = x + (j-1)*TILE_WIDTH, y = y + (i-1)*TILE_HEIGHT, type = "mid" }
      room[i][j] = WallFront(newAttri)
    end
  end

  -- build the side wall
  for i = 0, numRow do
    for pos, j in pairs({ left = 1, right = numCol }) do
      local newAttri = { x = x + (j-1)*TILE_WIDTH, y = y + (i-1)*TILE_HEIGHT }
      if i == 0 then
        newAttri.type = "side_top_" .. pos
      elseif i == numRow then
        newAttri.type = "side_front_" .. pos
      else
        newAttri.type = "side_mid_" .. pos
      end
      room[i][j] = Wall(newAttri)

    end
  end



  return room
end

---------------------------------------------------------------------------------------------------------
