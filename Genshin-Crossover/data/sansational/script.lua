local sansIdle = true
local bfIdle = true
local sansx = 300
local sansy = 300
local bfx = 1200
local bfy = 430

function onCreate()
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 30)
    cameraSetTarget('boyfriend')

    makeAnimatedLuaSprite('sans', 'characters/Sans', sansx, sansy)
    addAnimationByIndices('sans', 'idle', 'Sans FNF instance 1', '0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14', 24)
    addAnimationByIndices('sans', 'idle2', 'Sans FNF instance 1', '15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30', 24)
    addAnimationByPrefix('sans', 'blueeye', 'Switch to UT mode instance 1', 24, false)
    addAnimationByPrefix('sans', 'up', 'Up instance 1', 24, false)
    addAnimationByPrefix('sans', 'down', 'Down instance 1', 24, false)
    addAnimationByPrefix('sans', 'left', 'Left instance 1', 24, false)
    addAnimationByPrefix('sans', 'right', 'Right instance 1', 24, false)
    addAnimationByPrefix('sans', 'up2', 'Up 02 instance 1', 24, false)
    addAnimationByPrefix('sans', 'down2', 'Down 02 instance 1', 24, false)
    addAnimationByPrefix('sans', 'left2', 'Left 02 instance 1', 24, false)
    addAnimationByPrefix('sans', 'right2', 'Right 02 instance 1', 24, false)
    addAnimationByPrefix('sans', 'dodge', 'SansDodge instance 1', 24, false)

    makeAnimatedLuaSprite('boner', 'indie/sans/DodgeMechs', bfx - 100, bfy - 100)
    addAnimationByPrefix('boner', 'warning', 'Alarm instance 1', 24, false)
    addAnimationByPrefix('boner', 'bones', 'Bones boi instance 1', 24, false)
    setProperty('boner.alpha', 0)

    makeAnimatedLuaSprite('bf', 'characters/BoyFriend_CRshader', bfx, bfy)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance instance 1', 24, false)
    addAnimationByPrefix('bf', 'up', 'BF NOTE UP instance 1', 24, false)
    addAnimationByPrefix('bf', 'down', 'BF NOTE DOWN instance 1', 24, false)
    addAnimationByPrefix('bf', 'left', 'BF NOTE LEFT instance 1', 24, false)
    addAnimationByPrefix('bf', 'right', 'BF NOTE RIGHT instance 1', 24, false)
    addAnimationByPrefix('bf', 'attack', '0BF attack instance 1', 24, false)

    makeAnimatedLuaSprite('bf2', 'indie/sans/DodgeMechs', bfx, bfy)
    addAnimationByPrefix('bf2', 'dodge', 'Dodge instance 1', 24, false)
    setProperty('bf2.alpha', 0)

    addLuaSprite('bf', false)
    addLuaSprite('boner', false)
    addLuaSprite('bf2', false)
    addLuaSprite('sans', false)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        if sansIdle then
            objectPlayAnimation('sans', 'idle', true)
        end
        if bfIdle then
            objectPlayAnimation('bf', 'idle', true)
        end
    end

    if curBeat % 2 == 1 then
        if sansIdle then
            objectPlayAnimation('sans', 'idle2', true)
        end
    end
end

function onStepHit()
    if curStep == 232 then
        objectPlayAnimation('sans', 'up', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 242 then
        objectPlayAnimation('bf', 'down', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 244 then
        objectPlayAnimation('bf', 'left', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 260 then
        objectPlayAnimation('sans', 'left2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 348 then
        objectPlayAnimation('sans', 'up', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 350 then
        objectPlayAnimation('sans', 'up', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 354 then
        objectPlayAnimation('bf', 'up', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 356 then
        objectPlayAnimation('bf', 'up', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 373 then
        objectPlayAnimation('bf', 'right', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 377 then
        objectPlayAnimation('bf', 'right', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 381 then
        objectPlayAnimation('bf', 'left', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 388 then
        objectPlayAnimation('sans', 'down2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 390 then
        objectPlayAnimation('sans', 'down2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 392 then
        objectPlayAnimation('sans', 'down2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 454 then
        objectPlayAnimation('bf', 'right', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 460 then
        objectPlayAnimation('sans', 'right2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 466 then
        objectPlayAnimation('bf', 'right', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 468 then
        objectPlayAnimation('bf', 'right', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 477 then
        objectPlayAnimation('sans', 'left2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 502 then
        objectPlayAnimation('sans', 'right', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 504 then
        objectPlayAnimation('sans', 'right', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 506 then
        objectPlayAnimation('sans', 'right', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 516 then
        objectPlayAnimation('bf', 'right', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 518 then
        objectPlayAnimation('bf', 'right', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 520 then
        objectPlayAnimation('bf', 'right', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 528 then
        objectPlayAnimation('sans', 'up2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 536 then
        objectPlayAnimation('bf', 'up', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 538 then
        objectPlayAnimation('bf', 'up', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 540 then
        objectPlayAnimation('bf', 'up', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 603 then
        objectPlayAnimation('sans', 'blueeye', true)
        sansIdle = false
    end

    if curStep == 608 then
        setProperty('boner.alpha', 1)
        objectPlayAnimation('boner', 'warning', true)
    end

    if curStep == 612 then
        sansIdle = true
        setProperty('boner.alpha', 0)
    end

    if curStep == 616 then
        setProperty('bf.alpha', 0)
        setProperty('bf2.alpha', 1)
        setProperty('boner.alpha', 1)
        objectPlayAnimation('boner', 'bones', true)
        objectPlayAnimation('bf2', 'dodge', true)
    end

    if curStep == 624 then
        setProperty('bf.alpha', 1)
        setProperty('bf2.alpha', 0)
        removeLuaSprite('boner', false)
    end

    if curStep == 628 then
        objectPlayAnimation('sans', 'down', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 630 then
        objectPlayAnimation('sans', 'down', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 636 then
        objectPlayAnimation('bf', 'attack', true)
        bfIdle = false
    end

    if curStep == 638 then
        objectPlayAnimation('sans', 'dodge', true)
        sansIdle = false
    end

    if curStep == 644 then
        bfIdle = true
    end

    if curStep == 648 then
        sansIdle = true
    end

    if curStep == 654 then
        objectPlayAnimation('bf', 'left', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 668 then
        objectPlayAnimation('sans', 'right', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 672 then
        objectPlayAnimation('bf', 'left', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 684 then
        objectPlayAnimation('bf', 'up', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 695 then
        objectPlayAnimation('sans', 'down', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 700 then
        objectPlayAnimation('sans', 'down', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 712 then
        objectPlayAnimation('bf', 'left', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 716 then
        objectPlayAnimation('bf', 'left', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 730 then
        objectPlayAnimation('sans', 'up', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 746 then
        objectPlayAnimation('bf', 'down', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 756 then
        objectPlayAnimation('sans', 'left2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 775 then
        objectPlayAnimation('sans', 'blueeye', true)
        sansIdle = false
    end

    if curStep == 784 then
        sansIdle = true
    end

    if curStep == 876 then
        objectPlayAnimation('sans', 'left2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 890 then
        objectPlayAnimation('bf', 'up', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end
end

local xx = 520;
local yy = 460;
local xx2 = 820;
local yy2 = 460;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate(elapsed)
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

    if getProperty('sans.animation.curAnim.name') == 'left' or getProperty('sans.animation.curAnim.name') == 'left2' then
        setProperty('sans.x', sansx - 48)
        setProperty('sans.y', sansy)
    elseif getProperty('sans.animation.curAnim.name') == 'up' then
        setProperty('sans.x', sansx + 17)
        setProperty('sans.y', sansy - 28)
    elseif getProperty('sans.animation.curAnim.name') == 'right' or getProperty('sans.animation.curAnim.name') == 'right2' then
        setProperty('sans.x', sansx + 18)
        setProperty('sans.y', sansy + 1)
    elseif getProperty('sans.animation.curAnim.name') == 'down' or getProperty('sans.animation.curAnim.name') == 'down2' then
        setProperty('sans.x', sansx + 12)
        setProperty('sans.y', sansy + 15)
    elseif getProperty('sans.animation.curAnim.name') == 'up2' then
        setProperty('sans.x', sansx - 35)
        setProperty('sans.y', sansy - 29)
    elseif getProperty('sans.animation.curAnim.name') == 'blueeye' then
        setProperty('sans.x', sansx - 20)
        setProperty('sans.y', sansy + 1)
    elseif getProperty('sans.animation.curAnim.name') == 'dodge' then
        setProperty('sans.x', sansx - 110)
        setProperty('sans.y', sansy - 20)
    else
        setProperty('sans.x', sansx)
        setProperty('sans.y', sansy)
    end

    if getProperty('bf.animation.curAnim.name') == 'left' then
        setProperty('bf.x', bfx - 27)
        setProperty('bf.y', bfy + 3)
    elseif getProperty('bf.animation.curAnim.name') == 'down' then
        setProperty('bf.x', bfx + 35)
        setProperty('bf.y', bfy + 31)
    elseif getProperty('bf.animation.curAnim.name') == 'up' then
        setProperty('bf.x', bfx + 45)
        setProperty('bf.y', bfy - 58)
    elseif getProperty('bf.animation.curAnim.name') == 'right' then
        setProperty('bf.x', bfx + 34)
        setProperty('bf.y', bfy - 1)
    elseif getProperty('bf.animation.curAnim.name') == 'attack' then
        setProperty('bf.x', bfx - 1088)
        setProperty('bf.y', bfy + 5)
    else
        setProperty('bf.x', bfx)
        setProperty('bf.y', bfy)
    end
end

local allowCountdown = false
local dia1 = false
local dia2 = false
local blockEnd = true

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not dia1 then
		setProperty('inCutscene', true)
		runTimer('startDialogue', 0.8)
        dia1 = true
		return Function_Stop
	end
	return Function_Continue
end

function onEndSong()
    if not allowCountdown and blockEnd then
		if not dia2 then
			dia2 = true
        	setProperty('inCutscene', true)
			startDialogue('dialogue2');
			runTimer('delayEnd', 600)
		end
		if keyJustPressed('back') then
			blockEnd = false
			cancelTimer('delayEnd')
			endSong()
    		return Function_Continue;
		end
		return Function_Stop;
	end
	return Funtion_Continue;
end

function onNextDialogue(count)
	if dia2 and count >= 149 then
        runTimer('endthethingalready', 20)
        blockEnd = false
		cancelTimer('delayEnd')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'idleresumesans' then
        sansIdle = true
    end

    if tag == 'idleresumebf' then
        bfIdle = true
    end

    if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue')
	end

    if tag == 'delayEnd' then
		blockEnd = false
		endSong()
	end

    if tag == 'endthethingalready' then
        blockEnd = false
        endSong()
    end
    
end