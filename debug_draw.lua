local D = {}

function D.draw(World)
  love.graphics.print("Objects: " .. tostring(#World.objects), 10, 10)
  love.graphics.print("Gravity: " .. (World.gravityOn and "ON" or "OFF"), 10, 30)
  love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 50)
end

return D
