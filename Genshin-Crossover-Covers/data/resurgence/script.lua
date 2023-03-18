local bfx = 0
local bfy = 0
local dadx = 0
local dady = 0
local allowFlash = true

function onCreate()
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 115)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 400)
    bfy = getProperty('boyfriend.y')
    bfx = getProperty('boyfriend.x')
    dadx = getProperty('dad.x')
    dady = getProperty('dad.y')
    setProperty('gf.flipX', false)
    setProperty('gf.y', getProperty('gf.y') + 20)
    setProperty('gf.x', getProperty('gf.x') + 400)
    setProperty('dad.y', getProperty('dad.y') + 100)
    cameraSetTarget('dad')

    makeLuaSprite('ready', 'corruption/fcr/ready', screenWidth / 4 - 50, screenHeight / 4)
    setObjectCamera('ready', 'other')
    makeLuaSprite('set', 'corruption/fcr/set', screenWidth / 4 - 20, screenHeight / 4)
    setObjectCamera('set', 'other')
    makeLuaSprite('go', 'corruption/fcr/go', screenWidth / 4, screenHeight / 4 - 20)
    setObjectCamera('go', 'other')

    makeAnimatedLuaSprite('girlfriend', 'characters/Mad Gf', 900, 400)
    addAnimationByPrefix('girlfriend', 'idle', 'idle mad gf', 24, false)
    addLuaSprite('girlfriend', false)

    makeAnimatedLuaSprite('ganyu', 'characters/MAD GANYU', 1500, 200)
    addAnimationByPrefix('ganyu', 'idle', 'idle ganyu', 24, false)
    setProperty('ganyu.flipX', true)
    addLuaSprite('ganyu', false)

    makeLuaSprite('preflash', '', 0, 0)
    makeGraphic('preflash', screenWidth, screenHeight, 'FFFFFF')
    setObjectCamera('preflash', 'hud')
    addLuaSprite('preflash', false)
    setProperty('preflash.alpha', 0)
end

function onCountdownTick(counter)
	setProperty('countdownReady.visible', 0)
    setProperty('countdownSet.visible', 0)
    setProperty('countdownGo.visible', 0)
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

local xx = 500
local yy = 500
local xx2 = 1200
local yy2 = 500

function onUpdate(elapsed)
    if not mustHitSection then
        triggerEvent('Camera Follow Pos', xx, yy)
    else
        triggerEvent('Camera Follow Pos', xx2, yy2)
    end
end

function onBeatHit()
    if curBeat == 128 then
        setProperty('boyfriend.x', bfx - 150)
        setProperty('boyfriend.y', bfy - 180)
        setProperty('dad.y', dady + 150)
        if allowFlash then
            cameraFlash('hud', '000000', 0.3, true)
        end
        cancelTween('preflash')
        setProperty('preflash.alpha', 0)
    end

    if curBeat == 288 then
        setProperty('dad.y', dady + 150)
    end

    if curBeat == 340 then
        if allowFlash then
            cameraFlash('hud', 'FFFFFF', 1, true)
        end
        playAnim('dad', 'idle-alt', true)
    end

    if curBeat % 2 == 0 then
        playAnim('ganyu', 'idle', true)
        playAnim('girlfriend', 'idle', true)
        if getProperty('health') > 0.01 and curBeat >= 128 and curBeat < 340 then
            setProperty('health', getProperty('health') - 0.01)
        end
    end
end

function onStepHit()
    if curStep == 511 then
        if allowFlash then
            doTweenAlpha('preflash', 'preflash', 1, 0.1, 'quadIn')
        end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if curBeat < 128 and getProperty('health') > 0.03 then
        setProperty('health', getProperty('health') - 0.03)
    end

    if curBeat >= 128 and getProperty('health') > 0.015 then
        setProperty('health', getProperty('health') - 0.015)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if curBeat >= 128 then
        setProperty('health', getProperty('health') + 0.05)
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
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('scoreTxt.visible', false)
    flashAllow = false
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
	if count >= 92 then
        runTimer('endthethingalready', 20)
        blockEnd = false
		cancelTimer('delayEnd')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
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