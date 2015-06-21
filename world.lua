world = {}

function world.load()
	world.loadData()
	segPos = 1
	segNo = 1
end

function world.update( dt )	
	for i, block in ipairs(worldData) do
		block.segmentx = block.segmentx - love.graphics.getWidth()*0.1 * dt
		if segPos == block.position and block.segmentx < 0 and segNo == block.segment then
			block.segmentx = love.graphics.getWidth()
		end
		if segPos == block.position and 
		block.segmentx >= love.graphics.getWidth() - 0.2 * love.graphics.getWidth() and 
		block.segmentx <= love.graphics.getWidth() then
			segPos = segPos + 1
		end
		if segPos == 13 then
			
			segNo = love.math.random(1, 2)
			segPos = 1
		end
	end
end

function world.draw() 
	love.graphics.print(segNo, 0, 0, 0, 5, 5)
	love.graphics.print(segPos, 100, 0, 0, 5, 5)
	for i, v in ipairs(worldData) do
		love.graphics.setColor(0, 0, 255)
		if v.segmentx < width and -width/10 < v.segmentx then
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

function worldData.spawn(segment, position, C1, C2, C3, C4, C5, C6, segmentx) --what segment number it is, position in the segment, column 1-6, length of that position in the segment
	table.insert(worldData, {segment = segment, position = position, C1 = C1, C2 = C2, C3 = C3, C4 = C4, C5 = C5, C6 = C6, segmentx = segmentx})
end

function world.loadData()
	
	worldData.spawn(1, 1, true, true, true, true, false, true, love.graphics.getWidth())
	worldData.spawn(1, 2, false, false, false, false, false, false, love.graphics.getWidth() + love.graphics.getWidth()/10)
	worldData.spawn(1, 3, false, false, false, false, false, false, love.graphics.getWidth()+ 2*love.graphics.getWidth()/10)
	worldData.spawn(1, 4, true, false, true, true, true, true, love.graphics.getWidth()+ 3*love.graphics.getWidth()/10)
	worldData.spawn(1, 5, false, false, false, false, false, false, love.graphics.getWidth() + 4*love.graphics.getWidth()/10)
	worldData.spawn(1, 6, false, false, false, false, false, false, love.graphics.getWidth()+ 5*love.graphics.getWidth()/10)
	worldData.spawn(1, 7, true, true, true, true, false, true, love.graphics.getWidth()+ 6*love.graphics.getWidth()/10)
	worldData.spawn(1, 8, false, false, false, false, false, false, love.graphics.getWidth() + 7*love.graphics.getWidth()/10)
	worldData.spawn(1, 9, false, false, false, false, false, false, love.graphics.getWidth()+ 8*love.graphics.getWidth()/10)
	worldData.spawn(1, 10, true, false, true, true, true, true, love.graphics.getWidth()+ 9*love.graphics.getWidth()/10)
	worldData.spawn(1, 11, false, false, false, false, false, false, love.graphics.getWidth() + 10*love.graphics.getWidth()/10)
	worldData.spawn(1, 12, false, false, false, false, false, false, love.graphics.getWidth()+ 11*love.graphics.getWidth()/10)
	
	worldData.spawn(2, 1, true, false, true, true, false, true, love.graphics.getWidth())
	worldData.spawn(2, 2, false, false, false, false, false, false, love.graphics.getWidth() + love.graphics.getWidth()/10)
	worldData.spawn(2, 3, false, true, false, false, true, false, love.graphics.getWidth()+ 2*love.graphics.getWidth()/10)
	worldData.spawn(2, 4, false, false, false, false, false, false, love.graphics.getWidth()+ 3*love.graphics.getWidth()/10)
	worldData.spawn(2, 5, true, false, true, true, false, true, love.graphics.getWidth()+ 4*love.graphics.getWidth()/10)
	worldData.spawn(2, 6, false, false, false, false, false, false, love.graphics.getWidth() + 5*love.graphics.getWidth()/10)
	worldData.spawn(2, 7, false, true, false, false, true, false, love.graphics.getWidth()+ 6*love.graphics.getWidth()/10)
	worldData.spawn(2, 8, false, false, false, false, false, false, love.graphics.getWidth()+ 7*love.graphics.getWidth()/10)
	worldData.spawn(2, 9, true, false, true, true, false, true, love.graphics.getWidth()+ 8*love.graphics.getWidth()/10)
	worldData.spawn(2, 10, false, false, false, false, false, false, love.graphics.getWidth() + 9*love.graphics.getWidth()/10)
	worldData.spawn(2, 11, false, false, false, false, false, false, love.graphics.getWidth()+ 10*love.graphics.getWidth()/10)
	worldData.spawn(2, 12, false, false, false, false, false, false, love.graphics.getWidth()+ 11*love.graphics.getWidth()/10)
end