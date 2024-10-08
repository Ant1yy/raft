function love.run()

  local tge = require("tge.tge")

  local v = tge.vec3.new(1, 3, 2)

  --if love.load then love.load(love.arg.parseGameArguments(arg), arg) end

  if not love.timer then error("Missing module love.timer.") end

  -- We don't want the first frame's dt to include time taken by love.load.
  --if love.timer then love.timer.step() end

  love.timer.step()

  local dt = 0

  -- Main loop time.
  return function()
    -- Process events.
    if love.event then
      love.event.pump()
      for name, a,b,c,d,e,f in love.event.poll() do
        if name == "quit" then
          if not love.quit or not love.quit() then
            return a or 0
          end
        end
        love.handlers[name](a,b,c,d,e,f)
      end
    end

    -- Update dt, as we'll be passing it to update
    --if love.timer then dt = love.timer.step() end

    dt = love.timer.step()

    -- Call update and draw
    --if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled

    if love.graphics and love.graphics.isActive() then
      love.graphics.origin()
      love.graphics.clear(love.graphics.getBackgroundColor())

      --if love.draw then love.draw()

      do
        love.graphics.print(v:length(), 20, 20)
      end

      love.graphics.present()
    end

    --if love.timer then love.timer.sleep(0.001) end
    love.timer.sleep(0.001)
  end
end
