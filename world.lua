world = {}
block = {}

function world.load()
	world.loadData()
	segPos = 1
end

function world.update( dt )	
	for i, block in ipairs(worldData) do
		block.segmentx = block.segmentx - love.graphics.getWidth()*0.1 * dt
		if block.segmentx < -0.1 * love.graphics.getWidth() then
			block.segmentx = love.graphics.getWidth()
		end
	end
	if segPos == block.position and block.segmentx < 0 then
		block.segmentx = love.graphics.getWidth()
	end
	if segPos == block.position and block.segmentx == love.graphics.getWidth() - 0.1 * love.graphics.getWidth() then
		segPos = segPos + 1
	end
end

function world.draw() 
	for i, v in ipairs(worldData) do
		width = love.graphics.getWidth()
		love.graphics.setColor(0, 0, 255)
		if v.segmentx < width and -100 < v.segmentx then
			if v.C1 == true then
				love.graphics.rectangle("fill", v.segmentx, 0, 0.1 * width, love.graphics.getHeight()/6)
			end
			if v.C2 == true then
				love.graphics.rectangle("fill", v.segmentx, love.graphics.getHeight()/6, 0.1 * width, love.graphics.getHeight()/6)
			end
			if v.C3 == true then
				love.graphics.rectangle("fill", v.segmentx, 2*love.graphics.getHeight()/6, 0.1 * width, love.graphics.getHeight()/6)
			end
			if v.C4 == true then
				love.graphics.rectangle("fill", v.segmentx, 3*love.graphics.getHeight()/6, 0.1 * width, love.graphics.getHeight()/6)
			end
			if v.C5 == true then
				love.graphics.rectangle("fill", v.segmentx, 4*love.graphics.getHeight()/6, 0.1 * width, love.graphics.getHeight()/6)
			end
			if v.C6 == true then
				love.graphics.rectangle("fill", v.segmentx, 5*love.graphics.getHeight()/6, 0.1 * width, love.graphics.getHeight()/6)
			end
		end
	end
end

worldData = {}

function world.loadData()
	
	worldData.spawn(1, 1, true, true, true, true, false, true, 0) --an example segment piece
	worldData.spawn(1, 2, false, false, false, false, false, false, 0)
	worldData.spawn(1, 3, false, false, false, false, false, false, 0)
	worldData.spawn(1, 4, true, false, true, true, true, true, 0)
end

function worldData.spawn(segment, position, C1, C2, C3, C4, C5, C6, segmentx) --what segment number it is, position in the segment, column 1-6, length of that position in the segment
	table.insert(worldData, {segment = segment, position = position, C1 = C1, C2 = C2, C3 = C3, C4 = C4, C5 = C5, C6 = C6, segmentx = segmentx})
end