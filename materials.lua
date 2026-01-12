local M = {}

M.materials = {
  rubber = { restitution = 0.9, friction = 0.5, density = 1 },
  metal  = { restitution = 0.1, friction = 0.2, density = 3 },
  sticky = { restitution = 0.0, friction = 1.0, density = 1 }
}

M.current = "rubber"

function M.apply(fixture, nameOrMat)
  local mat = nameOrMat
  if type(nameOrMat) == "string" then
    mat = M.materials[nameOrMat]
  end
  assert(mat, "Unknown material: " .. tostring(nameOrMat))

  fixture:setRestitution(mat.restitution or 0)
  fixture:setFriction(mat.friction or 0.2)

  if fixture.setDensity and mat.density then
    fixture:setDensity(mat.density)
    fixture:getBody():resetMassData()
  end
end

return M
