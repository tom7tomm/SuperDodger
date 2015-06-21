require "player"
require "menu"
require "world"

function love.load()
	width = love.graphics.getWidth()
	gamestate = "menu"
	menu.load()
	player.load()
	world.load()
end

function love.update(dt)
	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
	
	if gamestate == "menu" then
		menu.update()
	end
	
	if gamestate == "playing" then
		player.update()
		world.update(dt)
	end
end

function love.draw()
	if gamestate == "menu" then
		menu.draw()
	end
	
	if gamestate == "playing" then
		player.draw()
		world.draw()
	end
end