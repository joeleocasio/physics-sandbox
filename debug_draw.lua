local Mats = require("materials")

local D = {
  enabled = true,   -- DEFAULT: debug mode
  showHelp = true,
  padding = 10,
  lineH = 18,
}

function D.toggle()
  D.enabled = not D.enabled
end

function D.toggleHelp()
  D.showHelp = not D.showHelp
end

local function fmt(n)
  return string.format("%.2f", n or 0)
end

function D.draw(World)
  if not D.enabled then return end

  local w, h = love.graphics.getDimensions()
  local mx, my = love.mouse.getPosition()

  local gx, gy = 0, 0
  if World and World.physics and World.physics.getGravity then
    gx, gy = World.physics:getGravity()
  end

  local lines = {
    "DEBUG (F1 toggles, H help)",
    "FPS: " .. tostring(love.timer.getFPS()),
    "Objects: " .. tostring(World and World.objects and #World.objects or 0),
    "Material: " .. tostring(Mats.current),
    "Gravity: " .. ((World and World.gravityOn) and "ON" or "OFF") ..
      "  (" .. fmt(gx) .. ", " .. fmt(gy) .. ")",
    "Mouse: (" .. tostring(mx) .. ", " .. tostring(my) .. ")",
  }

  if D.showHelp then
    table.insert(lines, "")
    table.insert(lines, "Controls:")
    table.insert(lines, "  LMB: spawn circle")
    table.insert(lines, "  RMB: spawn box")
    table.insert(lines, "  1/2/3: rubber/metal/sticky")
    table.insert(lines, "  G: toggle gravity")
    table.insert(lines, "  R: reset")
  end

  -- measure panel height
  local panelH = D.padding * 2 + (#lines * D.lineH)
  local panelW = math.min(420, w - 20)

  -- panel background
  love.graphics.push("all")
  love.graphics.setColor(0, 0, 0, 0.65)
  love.graphics.rectangle("fill", 10, 10, panelW, panelH, 8, 8)

  -- text
  love.graphics.setColor(1, 1, 1, 1)
  local y = 10 + D.padding
  for _, s in ipairs(lines) do
    love.graphics.print(s, 10 + D.padding, y)
    y = y + D.lineH
  end

  love.graphics.pop()
end

return D
