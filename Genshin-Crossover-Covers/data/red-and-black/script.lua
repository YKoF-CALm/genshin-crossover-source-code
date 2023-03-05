function onCreate()
    precacheSound('Lights_Shut_off')

    setProperty('dad.x', getProperty('dad.x') + 150)
    setProperty('dad.y', getProperty('dad.y') + 140)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 50)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 100)

    makeLuaSprite('overlay', 'holofunk/christmas/overlayEvil', 0, 0)
    setObjectCamera('overlay', 'hud')
    scaleObject('overlay', 0.667, 0.68)
    updateHitbox('overlay')
    addLuaSprite('overlay', false)

    makeLuaSprite('blackthing', '', 0, 0)
    makeGraphic('blackthing', screenWidth, screenHeight, '000000')
    setObjectCamera('blackthing', 'other')

    makeLuaSprite('ready', 'holofunk/ready', screenWidth / 4 + 50, screenHeight / 4 + 20)
    scaleObject('ready', 0.6, 0.6)
    updateHitbox('ready')
    setObjectCamera('ready', 'other')
    makeLuaSprite('set', 'holofunk/set', screenWidth / 4 + 10, screenHeight / 4 + 10)
    scaleObject('set', 0.6, 0.6)
    updateHitbox('set')
    setObjectCamera('set', 'other')
    makeLuaSprite('go', 'holofunk/go', screenWidth / 4 + 40, screenHeight / 4 + 20)
    scaleObject('go', 0.6, 0.6)
    updateHitbox('go')
    setObjectCamera('go', 'other')
end

function onCountdownTick(counter)
	setProperty('countdownReady.visible', false)
    setProperty('countdownSet.visible', false)
    setProperty('countdownGo.visible', false)
	if counter == 1 then
        addLuaSprite('ready', true)
        doTweenAlpha('Ready', 'ready', '0', crochet/1000, 'cubeInOut')
    end
    if counter == 2 then
        addLuaSprite('set', true)
        doTweenAlpha('Set', 'set', '0', crochet/1000, 'cubeInOut')
    end
    if counter == 3 then
        addLuaSprite('go', true)
        doTweenAlpha('Go', 'go', '0', crochet/1000, 'cubeInOut')
    end
end

local cosWave = false
local violentshakinghorizontal = false
local violentshakingvertical = false
local swayCam = false
local spookyArrows = false
local swaySlow = false
local jebusSlideXBegin = false
local HAACHAMACHAMA = false

function onBeatHit()
    --[[
    if curStep >= 384 and curStep <= 496 then -- spins arrows at this part
        if curBeat % 8 == 0 then
            for i = 0, 7 do
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.11, done)
            end
        elseif curBeat % 8 == 4 then
            for i = 0, 7 do
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) - 360, 0.11, done)
            end
        else
            error("bro wtf are you doing with the beat????")
        end
    end
    ]]
    if jebusSlideXBegin then --jebus slide on x axis on beat
        jebusSlideXAxis()
    end
end

function onStepHit() -- just read comments
    --[[
        if curStep == 1 then -- sets position for Y for cases of up and down scroll
            posY = getActorY(0)
        end
    
        if curStep == 158 then -- spin strum forward
            for i = 0, 7 do
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) + 360, 0.15, done)
            end
        end
    
        if curStep == 188 then -- spin strum backward
            for i = 0, 7 do
                tweenPosXAngle(i, _G['defaultStrum'..i..'X'],getActorAngle(i) - 360, 0.15, done)
            end
        end
    ]]
    if curStep == 128 then
        cosWave = true
        setProperty('defaultCamZoom', 0.65)
        objectPlayAnimation('fire1', 'burn', true)
        objectPlayAnimation('fire2', 'burn', true)
        setProperty('fireglow.alpha', 1)
        doTweenAlpha('glow', 'fireglow', '0', crochet/1000, 'cubeInOut')
    end

    if curStep == 192 then
        cosWave = false
    end

    if curStep == 257 then
        violentshakingvertical = true
        setProperty('defaultCamZoom', 0.8)
        objectPlayAnimation('fire1', 'burn', true)
        objectPlayAnimation('fire2', 'burn', true)
        setProperty('fireglow.alpha', 1)
        doTweenAlpha('glow', 'fireglow', '0', crochet/1000, 'cubeInOut')
    end

    if curStep == 271 then
        violentshakingvertical = false
    end

    if curStep == 289 then
        violentshakinghorizontal = true
    end

    if curStep == 303 then
        swayCam = true
        spookyArrows = true
        violentshakinghorizontal = false
    end  

    if curStep == 384 then
        swaySlow = true
        setProperty('defaultCamZoom', 0.65)
        objectPlayAnimation('fire1', 'burn', true)
        objectPlayAnimation('fire2', 'burn', true)
        setProperty('fireglow.alpha', 1)
        doTweenAlpha('glow', 'fireglow', '0', crochet/1000, 'cubeInOut')
    end

    if curStep == 496 then
        swaySlow = false
    end

    if curStep == 640 then
        setProperty('defaultCamZoom', 0.8)
        objectPlayAnimation('fire1', 'burn', true)
        objectPlayAnimation('fire2', 'burn', true)
        setProperty('fireglow.alpha', 1)
        doTweenAlpha('glow', 'fireglow', '0', crochet/1000, 'cubeInOut')
    end

    if curStep == 641 then
        violentshakingvertical = true
    end

    if curStep == 655 then
        violentshakingvertical = false
    end 

    if curStep == 673 then
        violentshakinghorizontal = true
    end

    if curStep == 687 then
        violentshakinghorizontal = false
    end

    if curStep == 704 then
        jebusSlideXBegin = true
    end

    if curStep == 959 then
        jebusSlideXBegin = false
    end
    
    if curStep == 1336 then
        HAACHAMACHAMA = true
        setProperty('defaultCamZoom', 1.3)
        objectPlayAnimation('fire1', 'burn', true)
        objectPlayAnimation('fire2', 'burn', true)
        setProperty('fireglow.alpha', 1)
        doTweenAlpha('glow', 'fireglow', '0', crochet/1000, 'cubeInOut')
    end

    if curStep == 1360 then
        HAACHAMACHAMA = false
        addLuaSprite('blackthing', false)
        playSound('Lights_Shut_off', 1)
    end
end

local xx = 600;
local yy = 480;
local xx2 = 1200;
local yy2 = 480;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate(elapsed)
    if mustHitSection then
        triggerEvent('Camera Follow Pos', 1200, 500)
    else
        triggerEvent('Camera Follow Pos', 600, 500)
    end

    songPos = getSongPosition()
    local currentBeatHalf = (songPos / 1000)*((bpm/2)/60)
    local currentBeat = (songPos / 1000)*(bpm/60)
    local currentBeat2 = (songPos / 1000)*((bpm*2)/60)

    if swayCam then
        doTweenAngle('camHudAngle', 'camHUD', 1 * math.sin(currentBeat / 1.5), 0.1, 'linear')
        doTweenAngle('camGameAngle', 'camGame', -1 * math.sin(currentBeat / 1.5), 0.1, 'linear')
    end
    
    if spookyArrows then
        for i=0,3 do
            noteTweenY(i..'l1oy', i, _G['defaultOpponentStrumY'..i] + 10 * math.cos((currentBeat + i*0.25) * math.pi), 0.1, 'linear')
            noteTweenY(i..'l1py', i+4, _G['defaultPlayerStrumY'..i] + 10 * math.cos((currentBeat + (i+4)*0.25) * math.pi), 0.1, 'linear')
        end
    end

	if curStep >= 257 and curStep < 319 then 	
		for i=0,3 do
            noteTweenX(i..'l2ox', i, _G['defaultOpponentStrumX'..i] + 32 * math.sin(currentBeat * math.pi), 0.1, 'linear')
            noteTweenX(i..'l2px', i+4, _G['defaultPlayerStrumX'..i] + 32 * math.sin(currentBeat * math.pi), 0.1, 'linear')
            noteTweenY(i..'l2oy', i, _G['defaultOpponentStrumY'..i] + 4 * math.sin((currentBeat*2 + i*1.5)), 0.1, 'linear')
            noteTweenY(i..'l2py', i+4, _G['defaultPlayerStrumY'..i] + 4 * math.sin((currentBeat*2 + (i+4)*1.5)), 0.1, 'linear')
		end
	end
	if curStep >= 641 and curStep < 703 then 	
		for i=0,3 do
            noteTweenX(i..'l3ox', i, _G['defaultOpponentStrumX'..i] + 16 * math.sin(currentBeat * math.pi), 0.1, 'linear')
            noteTweenX(i..'l3px', i+4, _G['defaultPlayerStrumX'..i] + 16 * math.sin(currentBeat * math.pi), 0.1, 'linear')
            noteTweenY(i..'l3oy', i, _G['defaultOpponentStrumY'..i] + 4 * math.sin((currentBeat + i*1.5)), 0.1, 'linear')
            noteTweenY(i..'l3py', i+4, _G['defaultPlayerStrumY'..i] + 4 * math.sin((currentBeat + (i+4)*1.5)), 0.1, 'linear')
		end
	end    
    
    if cosWave then
        for i=0,3 do
            noteTweenY(i..'l4oy', i, _G['defaultOpponentStrumY'..i] + 32 * math.cos((currentBeat + i) * math.pi), 0.1, 'linear')
            noteTweenY(i..'l4py', i+4, _G['defaultPlayerStrumY'..i] + 32 * math.cos((currentBeat + (i+4)) * math.pi), 0.1, 'linear')
        end
    end

    if curStep == 192 or curStep == 641 then -- reset position
        for i=0,3 do
            noteTweenY(i..'l5oy', i, _G['defaultOpponentStrumY'..i], 0.1, 'linear')
            noteTweenY(i..'l5py', i+4, _G['defaultPlayerStrumY'..i], 0.1, 'linear')
        end
    end

    if curStep >= 192 and curStep <= 255 then -- starts doing the jebus
        if not downscroll then
            jebusSlideUpScroll()
        else
            jebusSlideDownScroll()
        end
    end
--[[
    if curStep >= 320 and curStep <= 383 then -- starts doing the jebus
        if not downscroll then
            jebusSlideUpScroll()
        else
            jebusSlideDownScroll()
        end
    end
]]
    if swaySlow then --starts slow swaying
        for i=0,3 do  
            noteTweenX(i..'l6ox', i, _G['defaultOpponentStrumX'..i] + 32 * math.sin(currentBeatHalf * math.pi), 0.1, 'linear')
            noteTweenX(i..'l6px', i+4, _G['defaultPlayerStrumX'..i] + 32 * math.sin(currentBeatHalf * math.pi), 0.1, 'linear')
        end
    end

    if curStep >= 576 and curStep <= 640 then -- starts alternate moving left/up and down/right pt2
        for i=0,3 do
            noteTweenY(i..'l7oy', i, _G['defaultOpponentStrumY'..i] + 32 * math.cos((currentBeat + i) * math.pi), 0.1, 'linear')
            noteTweenY(i..'l7py', i+4, _G['defaultPlayerStrumY'..i] + 32 * math.cos((currentBeat + (i+4)) * math.pi), 0.1, 'linear')
        end
    end

    if violentshakinghorizontal then
        for i=0,3 do
            noteTweenX(i..'l8ox', i, _G['defaultOpponentStrumX'..i] + 24 * math.sin(currentBeat*8 * math.pi), 0.1, 'linear')
            noteTweenX(i..'l8px', i+4, _G['defaultPlayerStrumX'..i] + 24 * math.sin(currentBeat*8 * math.pi), 0.1, 'linear')
        end
    end

    if violentshakingvertical then
        for i=0,3 do
            noteTweenY(i..'l9oy', i, _G['defaultOpponentStrumY'..i] + 24 * math.sin(currentBeat*8 * math.pi), 0.1, 'linear')
            noteTweenY(i..'l9py', i+4, _G['defaultPlayerStrumY'..i] + 24 * math.sin(currentBeat*8 * math.pi), 0.1, 'linear')
        end
    end
    
    if HAACHAMACHAMA then -- HAACHAMA CHAMAAAAAAAAAAAAAAAAAAAAAAAAAA
        setProperty('scoreTxt.visible', false);
		setProperty('healthBar.visible', false);
		setProperty('healthBarBG.visible', false);
		setProperty('iconP1.visible', false);
		setProperty('iconP2.visible', false);
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    else
        setProperty('scoreTxt.visible', true);
		setProperty('healthBar.visible', true);
		setProperty('healthBarBG.visible', true);
		setProperty('iconP1.visible', true);
		setProperty('iconP2.visible', true);
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
    end

    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

function jebusSlideUpScroll()
    if curBeat % 8 == 0 then
        for i=0,3 do
            if i % 2 == 0 then
                noteTweenY(i..'l10oy', i, 150, 0.285, 'linear')
                noteTweenY(i..'l10py', i+4, 150, 0.285, 'linear')
            end
        end
    elseif curBeat % 8 == 2 then
        for i=0,3 do
            if i % 2 == 0 then
                noteTweenY(i..'l11oy', i, 50, 0.285, 'linear')
                noteTweenY(i..'l11py', i+4, 50, 0.285, 'linear')
            end
        end
    elseif curBeat % 8 == 4 then
        for i=0,3 do
            if i % 2 == 1 then
                noteTweenY(i..'l12oy', i, 150, 0.285, 'linear')
                noteTweenY(i..'l12py', i+4, 150, 0.285, 'linear')
            end
        end
    elseif curBeat % 8 == 6 then
        for i=0,3 do
            if i % 2 == 1 then
                noteTweenY(i..'l13oy', i, 50, 0.285, 'linear')
                noteTweenY(i..'l13py', i+4, 50, 0.285, 'linear')
            end
        end
    end
end

function jebusSlideDownScroll()
    if curBeat % 8 == 0 then
        for i=0,3 do
            if i % 2 == 0 then
                noteTweenY(i..'l14oy', i, 455, 0.285, 'linear')
                noteTweenY(i..'l14py', i+4, 455, 0.285, 'linear')
            end
        end
    elseif curBeat % 8 == 2 then
        for i=0,3 do
            if i % 2 == 0 then
                noteTweenY(i..'l15oy', i, 555, 0.285, 'linear')
                noteTweenY(i..'l15py', i+4, 555, 0.285, 'linear')
            end
        end
    elseif curBeat % 8 == 4 then
        for i=0,3 do
            if i % 2 == 1 then
                noteTweenY(i..'l16oy', i, 455, 0.285, 'linear')
                noteTweenY(i..'l16py', i+4, 455, 0.285, 'linear')
            end
        end
    elseif curBeat % 8 == 6 then
        for i=0,3 do
            if i % 2 == 1 then
                noteTweenY(i..'l17oy', i, 555, 0.285, 'linear')
                noteTweenY(i..'l17py', i+4, 555, 0.285, 'linear')
            end
        end
    end
end

function jebusSlideXAxis()
    if curBeat % 4 == 0 then
        for i=0,3 do
            noteTweenX(i..'l18ox', i, _G['defaultOpponentStrumX'..i] - 50, 0.1, 'linear')
            noteTweenX(i..'l18px', i+4, _G['defaultPlayerStrumX'..i] - 50, 0.1, 'linear')
        end
    elseif curBeat % 4 == 1 then
        for i=0,3 do
            noteTweenX(i..'l19ox', i, _G['defaultOpponentStrumX'..i], 0.1, 'linear')
            noteTweenX(i..'l19px', i+4, _G['defaultPlayerStrumX'..i], 0.1, 'linear')
        end
    elseif curBeat % 4 == 2 then
        for i=0,3 do
            noteTweenX(i..'l20ox', i, _G['defaultOpponentStrumX'..i] + 50, 0.1, 'linear')
            noteTweenX(i..'l20px', i+4, _G['defaultPlayerStrumX'..i] + 50, 0.1, 'linear')
        end
    elseif curBeat % 4 == 3 then
        for i=0,3 do
            noteTweenX(i..'l21ox', i, _G['defaultOpponentStrumX'..i], 0.1, 'linear')
            noteTweenX(i..'l21px', i+4, _G['defaultPlayerStrumX'..i], 0.1, 'linear')
        end
    end
end