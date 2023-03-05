function onCreate()
    setProperty('gf.flipX', false)

    makeAnimatedLuaSprite('hutao', 'characters/Hutao-half-corrupted', 350, 250)
    addAnimationByPrefix('hutao', 'idle', 'idle hutao', 24, false)
    addLuaSprite('hutao', false)
    playAnim('hutao', 'idle', true)

    makeLuaSprite('ready', 'corruption/fcr/ready', screenWidth / 4 - 50, screenHeight / 4)
    setObjectCamera('ready', 'other')
    makeLuaSprite('set', 'corruption/fcr/set', screenWidth / 4 - 20, screenHeight / 4)
    setObjectCamera('set', 'other')
    makeLuaSprite('go', 'corruption/fcr/go', screenWidth / 4, screenHeight / 4 - 20)
    setObjectCamera('go', 'other')
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
local yy = 400
local xx2 = 1200
local yy2 = 550

function onUpdate(elapsed)
    if not mustHitSection then
        triggerEvent('Camera Follow Pos', xx, yy)
    else
        triggerEvent('Camera Follow Pos', xx2, yy2)
    end
end

function onBeatHit()
    playAnim('hutao', 'idle', true)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    setProperty('health', getProperty('health') - 0.02)
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
    removeLuaText('ammocount')
    removeLuaSprite('crosshair')
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('scoreTxt.visible', false)
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
	if count >= 108 then
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