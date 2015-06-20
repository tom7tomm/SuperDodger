player = {}

function player.load()
	player.x = 50
	player.y = love.graphics.getHeight()/2
end

function player.update()
	player.keypress()
	player.boundary()
end

function player.keypress()
	if love.keyboard.isDown( 'up' ) then
		player.y = player.y - 5
	end
	
	if love.keyboard.isDown( 'down' ) then
		player.y = player.y + 5
	end
end

function player.boundary()
	if player.y > love.graphics.getHeight() then
		player.y = 1
	end
	
	if player.y < 1 then
		player.y = love.graphics.getHeight()
	end
end

function player.draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.rectangle("fill", player.x, player.y, 25, 25)
end