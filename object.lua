local Obj = {}
Obj.__index = Obj

-- physicsWorld: love.physics World
-- shapeType: "circle" or "box"
-- x, y: spawn position
-- materialName: "rubber" | "metal" | "sticky"
-- Mats: the materials module (so we can call Mats.apply)
function Obj.new(physicsWorld, shapeType, x, y, materialName, Mats)
  local self = setmetatable({}, Obj)

  self.shapeType = shapeType
  self.materialName = materialName

  self.body = love.physics.newBody(physicsWorld, x, y, "dynamic")

  if shapeType == "circle" then
    self.shape = love.physics.newCircleShape(20)
  else
    self.shape = love.physics.newRectangleShape(40, 40)
  end

  self.fixture = love.physics.newFixture(self.body, self.shape, 1)

  -- apply material properties (restitution/friction/density)
  if Mats and Mats.apply then
    Mats.apply(self.fixture, materialName)
  end

  return self
end

function Obj:draw()
  local x, y = self.body:getPosition()
  local a = self.body:getAngle()

  if self.shapeType == "circle" then
    local r = self.shape:getRadius()
    love.graphics.circle("line", x, y, r)

    -- little radius line so you can see rotation
    love.graphics.line(x, y, x + math.cos(a) * r, y + math.sin(a) * r)
  else
    -- RectangleShape points are local to body; convert to world points
    local pts = { self.body:getWorldPoints(self.shape:getPoints()) }
    love.graphics.polygon("line", pts)
  end
end

return Obj
