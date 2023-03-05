local sansIdle = true
local bfIdle = true

function onCreate()
    precacheImage('indie/sans/DodgeMechs')
    precacheImage('characters/BoyFriend_CRshader')
    precacheImage('characters/Sans')

    setProperty('introSoundsSuffix', '-sans')
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 30)
    cameraSetTarget('boyfriend')

    makeAnimatedLuaSprite('sans', 'characters/Sans', 300, 300)
    addAnimationByIndices('sans', 'idle', 'Sans FNF instance 1', '0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14', 24)
    addOffset('sans', 'idle', 0, 0)
    addAnimationByIndices('sans', 'idle2', 'Sans FNF instance 1', '15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30', 24)
    addOffset('sans', 'idle2', 0, 0)
    addAnimationByPrefix('sans', 'blueeye', 'Switch to UT mode instance 1', 24, false)
    addOffset('sans', 'blueeye', 20, -1)
    addAnimationByPrefix('sans', 'up', 'Up instance 1', 24, false)
    addOffset('sans', 'up', -17, 28)
    addAnimationByPrefix('sans', 'down', 'Down instance 1', 24, false)
    addOffset('sans', 'down', -12, -15)
    addAnimationByPrefix('sans', 'left', 'Left instance 1', 24, false)
    addOffset('sans', 'left', 48, 0)
    addAnimationByPrefix('sans', 'right', 'Right instance 1', 24, false)
    addOffset('sans', 'right', -18, -1)
    addAnimationByPrefix('sans', 'up2', 'Up 02 instance 1', 24, false)
    addOffset('sans', 'up2', 35, 29)
    addAnimationByPrefix('sans', 'down2', 'Down 02 instance 1', 24, false)
    addOffset('sans', 'down2', -12, -15)
    addAnimationByPrefix('sans', 'left2', 'Left 02 instance 1', 24, false)
    addOffset('sans', 'left2', 48, 0)
    addAnimationByPrefix('sans', 'right2', 'Right 02 instance 1', 24, false)
    addOffset('sans', 'right2', -18, -1)
    addAnimationByPrefix('sans', 'dodge', 'SansDodge instance 1', 24, false)
    addOffset('sans', 'dodge', 110, 20)

    makeAnimatedLuaSprite('boner', 'indie/sans/DodgeMechs', 1100, 330)
    addAnimationByPrefix('boner', 'warning', 'Alarm instance 1', 24, false)
    addAnimationByPrefix('boner', 'bones', 'Bones boi instance 1', 24, false)
    setProperty('boner.alpha', 0)

    makeAnimatedLuaSprite('bf', 'characters/BoyFriend_CRshader', 1200, 430)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance instance 1', 24, false)
    addOffset('bf', 'idle', 0, 0)
    addAnimationByPrefix('bf', 'up', 'BF NOTE UP instance 1', 24, false)
    addOffset('bf', 'up', -45, 58)
    addAnimationByPrefix('bf', 'down', 'BF NOTE DOWN instance 1', 24, false)
    addOffset('bf', 'down', -35, -31)
    addAnimationByPrefix('bf', 'left', 'BF NOTE LEFT instance 1', 24, false)
    addOffset('bf', 'left', 27, -3)
    addAnimationByPrefix('bf', 'right', 'BF NOTE RIGHT instance 1', 24, false)
    addOffset('bf', 'right', -34, 1)
    addAnimationByPrefix('bf', 'attack', '0BF attack instance 1', 24, false)
    addOffset('bf', 'attack', 1088, -5)

    makeAnimatedLuaSprite('bf2', 'indie/sans/DodgeMechs', 1200, 430)
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
            playAnim('sans', 'idle', true)
        end
        if bfIdle then
            playAnim('bf', 'idle', true)
        end
    end

    if curBeat % 2 == 1 then
        if sansIdle then
            playAnim('sans', 'idle2', true)
        end
    end
end

function onStepHit()
    if curStep == 232 or curStep == 348 or curStep == 350 or curStep == 730 then
        playAnim('sans', 'up', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 242 or curStep == 746 then
        playAnim('bf', 'down', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 244 or curStep == 381 or curStep == 654 or curStep == 672 or curStep == 712 or curStep == 716 then
        playAnim('bf', 'left', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 260 or curStep == 477 or curStep == 756 or curStep == 876 then
        playAnim('sans', 'left2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 354 or curStep == 356 or curStep == 536 or curStep == 538 or curStep == 540 or curStep == 684 or curStep == 890 then
        playAnim('bf', 'up', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 373 or curStep == 377 or curStep == 454 or curStep == 466 or curStep == 468 or curStep == 516 or curStep == 518 or curStep == 520 then
        playAnim('bf', 'right', true)
        bfIdle = false
        runTimer('idleresumebf', 0.5, 1)
    end

    if curStep == 388 or curStep == 390 or curStep == 392 then
        playAnim('sans', 'down2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 460 then
        playAnim('sans', 'right2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 502 or curStep == 504 or curStep == 506 or curStep == 668 then
        playAnim('sans', 'right', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 528 then
        playAnim('sans', 'up2', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 603 or curStep == 775 then
        playAnim('sans', 'blueeye', true)
        sansIdle = false
    end

    if curStep == 608 then
        setProperty('boner.alpha', 1)
        playAnim('boner', 'warning', true)
    end

    if curStep == 612 then
        sansIdle = true
        setProperty('boner.alpha', 0)
    end

    if curStep == 616 then
        setProperty('bf.alpha', 0)
        setProperty('bf2.alpha', 1)
        setProperty('boner.alpha', 1)
        playAnim('boner', 'bones', true)
        playAnim('bf2', 'dodge', true)
    end

    if curStep == 624 then
        setProperty('bf.alpha', 1)
        setProperty('bf2.alpha', 0)
        removeLuaSprite('boner', false)
    end

    if curStep == 628 or curStep == 630 or curStep == 695 or curStep == 700 then
        playAnim('sans', 'down', true)
        sansIdle = false
        runTimer('idleresumesans', 0.5, 1)
    end

    if curStep == 636 then
        playAnim('bf', 'attack', true)
        bfIdle = false
    end

    if curStep == 638 then
        playAnim('sans', 'dodge', true)
        sansIdle = false
    end

    if curStep == 644 then
        bfIdle = true
    end

    if curStep == 648 or curStep == 784 then
        sansIdle = true
    end
end

local xx = 520
local yy = 460
local xx2 = 820
local yy2 = 460
local ofs = 20
local followchars = true

function onUpdate(elapsed)
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

local dia1 = false
local dia2 = false
local blockEnd = true

function onStartCountdown()
	if not dia1 then
		setProperty('inCutscene', true)
		runTimer('startDialogue', 0.8)
        dia1 = true
		return Function_Stop;
	end
	return Function_Continue;
end

function onEndSong()
    if blockEnd then
		if not dia2 then
			dia2 = true
        	setProperty('inCutscene', true)
			runTimer('endDialogue', 0.8)
		end
		return Function_Stop;
	end
	return Funtion_Continue;
end

function onNextDialogue(count)
	if count >= 149 then
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

    if tag == 'startDialogue' then
		startDialogue('dialogue')
	end

    if tag == 'endDialogue' then
		startDialogue('dialogue2')
        runTimer('delayEnd', 300)
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