local posY = 0

function start(song) -- HAACHAMA CHAMAAAAAAAAAA--
    print('HAACHAMA CHAMAAAAAAAAAA--')
end

function setDefault(id)
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function jebusSlideUpScroll()
    if curBeat % 8 == 0 then
        for i=0,7 do
            if i % 2 == 0 then
                tweenPosYAngle(i, 150, getActorAngle(i), 0.285, done)
            end
        end
    elseif curBeat % 8 == 2 then
        for i=0,7 do
            if i % 2 == 0 then
                tweenPosYAngle(i, 50, getActorAngle(i), 0.285, done)
            end
        end
    elseif curBeat % 8 == 4 then
        for i=0,7 do
            if i % 2 == 1 then
                tweenPosYAngle(i, 150, getActorAngle(i), 0.285, done)
            end
        end
    elseif curBeat % 8 == 6 then
        for i=0,7 do
            if i % 2 == 1 then
                tweenPosYAngle(i, 50, getActorAngle(i), 0.285, done)
            end
        end
    else
        error("bro wtf are you doing with the beat????")
    end
end

function jebusSlideDownScroll()
    if curBeat % 8 == 0 then
        for i=0,7 do
            if i % 2 == 0 then
                tweenPosYAngle(i, 455, getActorAngle(i), 0.285, done)
            end
        end
    elseif curBeat % 8 == 2 then
        for i=0,7 do
            if i % 2 == 0 then
                tweenPosYAngle(i, 555, getActorAngle(i), 0.285, done)
            end
        end
    elseif curBeat % 8 == 4 then
        for i=0,7 do
            if i % 2 == 1 then
                tweenPosYAngle(i, 455, getActorAngle(i), 0.285, done)
            end
        end
    elseif curBeat % 8 == 6 then
        for i=0,7 do
            if i % 2 == 1 then
                tweenPosYAngle(i, 555, getActorAngle(i), 0.285, done)
            end
        end
    else
        error("bro wtf are you doing with the beat????")
    end
end

function jebusSlideXAxis()
    if curBeat % 4 == 0 then
        for i=0,7 do
            tweenPos(i, _G['defaultStrum'..i..'X'] - 50, getActorY(i), 0.1, done)
        end
    elseif curBeat % 4 == 1 then
        for i=0,7 do
            tweenPos(i, _G['defaultStrum'..i..'X'], getActorY(i), 0.1, done)
        end
    elseif curBeat % 4 == 2 then
        for i=0,7 do
            tweenPos(i, _G['defaultStrum'..i..'X'] + 50, getActorY(i), 0.1, done)
        end
    elseif curBeat % 4 == 3 then
        for i=0,7 do
            tweenPos(i, _G['defaultStrum'..i..'X'], getActorY(i), 0.1, done)
        end
    else
        error("bro wtf are you doing with the beat????")
    end
end

function update (elapsed)

    local currentBeatHalf = (songPos / 1000)*((bpm/2)/60)
    local currentBeat = (songPos / 1000)*(bpm/60)
    local currentBeat2 = (songPos / 1000)*((bpm*2)/60)

    if swayCam then
        camHudAngle = 1 * math.sin(currentBeat / 1.5)
        cameraAngle = -1 * math.sin(currentBeat / 1.5)
    end
    
    if spookyArrows then
        for i=0,7 do
        setActorY(defaultStrum0Y + 10 * math.cos((currentBeat + i*0.25) * math.pi), i)
        end
    end

	if curStep >= 257 and curStep < 319 then 
		local currentBeat = (songPos / 1000)*(bpm/60)	
		for i=0,7,1 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin(currentBeat * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 4 * math.sin((currentBeat*2 + i*1.5)), i)
		end
	end
	if curStep >= 641 and curStep < 703 then 
		local currentBeat = (songPos / 1000)*(bpm/60)	
		for i=0,7,1 do
			setActorX(_G['defaultStrum'..i..'X'] + 16 * math.sin(currentBeat * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 4 * math.sin((currentBeat + i*1.5)), i)
		end
	end    
    
    if cosWave then
        for i=0,7 do
            setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i) * math.pi), i)
        end
    end

    if curStep == 192 or curStep == 641 then -- reset position
        for i=0,7 do
            setActorY(posY, i)
        end
    end

    if curStep >= 192 and curStep <= 255 then -- starts doing the jebus
        if posY <= 100 then
            jebusSlideUpScroll()
        else
            jebusSlideDownScroll()
        end
    end

    if curStep >= 320 and curStep <= 383 then -- starts doing the jebus
        if posY <= 100 then
            jebusSlideUpScroll()
        else
            jebusSlideDownScroll()
        end
    end

    if swaySlow then --starts slow swaying
        for i=0,7 do  
            setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin(currentBeatHalf * math.pi), i)
        end
    end

    if curStep >= 576 and curStep <= 640 then -- starts alternate moving left/up and down/right pt2
        for i=0,7 do
            setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i) * math.pi), i)
        end
    end

    if violentshakinghorizontal then
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'] + 24 * math.sin(currentBeat*8 * math.pi), i)
        end
    end

    if violentshakingvertical then
        for i=0,7 do
            setActorY(_G['defaultStrum'..i..'Y'] + 24 * math.sin(currentBeat*8 * math.pi), i)
        end
    end
    
    if HAACHAMACHAMA then -- HAACHAMA CHAMAAAAAAAAAAAAAAAAAAAAAAAAAA
        showOnlyStrums = true
        strumLine1Visible = false
        strumLine2Visible = false
    else
        showOnlyStrums = false
        strumLine1Visible = true
        strumLine2Visible = true
    end

end

function beatHit(beat) 
    if curStep >= 384 and curStep <= 496 then -- spins arrows at this part
        if beat % 8 == 0 then
            for i = 0, 7 do
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.11, done)
            end
        elseif beat % 8 == 4 then
            for i = 0, 7 do
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) - 360, 0.11, done)
            end
        else
            error("bro wtf are you doing with the beat????")
        end
    end

    if jebusSlideXBegin then --jebus slide on x axis on beat
        jebusSlideXAxis()
    end

end

function stepHit(step) -- just read comments

    if step == 1 then -- sets position for Y for cases of up and down scroll
        posY = getActorY(0)
    end

    if step == 158 then -- spin strum forward
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.15, done)
        end
    end

    if step == 188 then -- spin strum backward
        for i = 0, 7 do
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) - 360, 0.15, done)
        end
    end

    if step == 128 then
        cosWave = true
    end

    if step == 192 then
        cosWave = false
    end

    if step == 257 then
		violentshakingvertical = true
	end

	if step == 271 then
		violentshakingvertical = false
	end

    if step == 289 then
		violentshakinghorizontal = true
	end

	if step == 303 then
		swayCam = true
		spookyArrows = true
		violentshakinghorizontal = false
	end  

    if step == 384 then
        swaySlow = true
    end

    if step == 496 then
        swaySlow = false
    end

    if step == 641 then
		violentshakingvertical = true
	end

	if step == 655 then
		violentshakingvertical = false
	end 

    if step == 673 then
		violentshakinghorizontal = true
	end

	if step == 687 then
		violentshakinghorizontal = false
	end

    if step == 704 then
        jebusSlideXBegin = true
    end

    if step == 959 then
        jebusSlideXBegin = false
    end
	
    if step == 1336 then
        HAACHAMACHAMA = true
    end

    if step == 1360 then
        HAACHAMACHAMA = false
    end
end