local Mats = require("materials")
local Debug = require("debug_draw")

local I = {}

function I.mousepressed(World, x, y, button)
  if button == 1 then
    World.spawn("circle", x, y)
  elseif button == 2 then
    World.spawn("box", x, y)
  end
end

function I.keypressed(World, key)
  if key == "f1" then
    Debug.toggle()
    return
  elseif key == "h" then
    Debug.toggleHelp()
    return
  end

  if key == "g" then
    World.toggleGravity()
  elseif key == "r" then
    World.reset()
  elseif key == "1" then
    Mats.current = "rubber"
  elseif key == "2" then
    Mats.current = "metal"
  elseif key == "3" then
    Mats.current = "sticky"
  end
end

return I
