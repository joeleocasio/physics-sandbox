local Mats = require("materials")
local Obj = require("object")

local W = {
  physics = nil,
  objects = {},
  gravityOn = true,
}

local function createBoundaries()
  local w, h = love.graphics.getDimensions()

  local body = love.physics.newBody(W.physics, 0, 0, "static")

  -- floor
  love.physics.newFixture(body, love.physics.newEdgeShape(0, h - 40, w, h - 40))
  -- left wall
  love.physics.newFixture(body, love.physics.newEdgeShape(40, 0, 40, h))
  -- right wall
  love.physics.newFixture(body, love.physics.newEdgeShape(w - 40, 0, w - 40, h))
end

function W.init()
  W.physics = love.physics.newWorld(0, 9.81 * 64, true)
  W.objects = {}
  W.gravityOn = true
  createBoundaries()
end

function W.update(dt)
  W.physics:update(dt)
end

function W.draw()
  for _, o in ipairs(W.objects) do
    o:draw()
  end
end

function W.spawn(shapeType, x, y)
  local o = Obj.new(W.physics, shapeType, x, y, Mats.current, Mats)
  table.insert(W.objects, o)
end

function W.toggleGravity()
  W.gravityOn = not W.gravityOn
  if W.gravityOn then
    W.physics:setGravity(0, 9.81 * 64)
  else
    W.physics:setGravity(0, 0)
  end
end

function W.reset()
  W.init()
end

return W
