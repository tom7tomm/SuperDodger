menu = {}

function menu.load()
	menu.font = love.graphics.newFont("LeagueGothic.ttf", 20)
	menu.state = "play"
end

function menu.draw()
	love.graphics.setFont(menu.font)
	love.graphics.print("Hello World!", 100, 100)

	if menu.state == "play" and
	gamestate == "menu" then
		-- draw "play"
		love.graphics.print("Play", love.graphics.getWidth()/2, love.graphics.getHeight()/2, 0, 5, 5)
	end
end

function menu.update()
	--check if space is being pressed
	if love.keyboard.isDown( ' ' ) then
		--check what menu state
		if menu.state == "play" then
			gamestate = "playing"
		end
	end
end