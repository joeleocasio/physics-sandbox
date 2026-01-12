local World = require("world")
local Input = require("input")
local Debug = require("debug_draw")

function love.load()
  love.window.setTitle("Physics Sandbox")
  love.physics.setMeter(64)
  World.init()
end

function love.update(dt)
  World.update(dt)
end

function love.draw()
  World.draw()
  Debug.draw(World)
end

function love.mousepressed(x, y, button)
  Input.mousepressed(World, x, y, button)
end

function love.keypressed(key)
  Input.keypressed(World, key)
end
