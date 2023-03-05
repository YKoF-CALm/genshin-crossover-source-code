local gfx = 0
local bfx = 0
local dadx = 0
local dady = 0
local bfy = 0

function onCreate()
    addCharacterToList('ganyu', 'dad')
    addCharacterToList('gf', 'gf')
    addCharacterToList('keqing-corr-player', 'boyfriend')
    addCharacterToList('keqing-player', 'boyfriend')
    addCharacterToList('ganyu-evil-sp1', 'dad')
    addCharacterToList('ganyu-evil-sp2', 'dad')
    addCharacterToList('ganyu-evil-sp3', 'dad')

    setProperty('boyfriend.x', getProperty('boyfriend.x') + 100)
    bfx = getProperty('boyfriend.x')
    setProperty('dad.y', getProperty('dad.y') + 15)
    setProperty('dad.x', getProperty('dad.x') - 50)
    dadx = getProperty('dad.x')
    dady = getProperty('dad.y')
    setProperty('gf.x', getProperty('gf.x') - 100)
    gfx = getProperty('gf.x')
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 20)
    bfy = getProperty('boyfriend.y')
    cameraSetTarget('dad')

    scaleObject('stagedfront', 1.3, 1.3)
    updateHitbox('stagedfront')
    setProperty('stagedfront.x', getProperty('stagedfront.x') - 200)

    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND', 450, 450)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
	addAnimationByPrefix('bf', '0', 'BF NOTE LEFT0', 24, false)
	addAnimationByPrefix('bf', '1', 'BF NOTE DOWN0', 24, false)
	addAnimationByPrefix('bf', '2', 'BF NOTE UP0', 24, false)
	addAnimationByPrefix('bf', '3', 'BF NOTE RIGHT0', 24, false)
    addOffset('bf', 'idle', -5, 0)
    addOffset('bf', '0', 5, -6)
    addOffset('bf', '1', -20, -51)
    addOffset('bf', '2', -46, 27)
    addOffset('bf', '3', -48, -7)
    addLuaSprite('bf', false)
    setObjectOrder('bf', getObjectOrder('gfGroup') + 1)
    setProperty('bf.visible', false)

    makeAnimatedLuaSprite('pico', 'characters/Pico_FNF_assetss', 1200, 300)
    addAnimationByPrefix('pico', 'idle', 'Pico Idle Dance', 24, false)
    addLuaSprite('pico', false)
    setProperty('pico.visible', false)

    if flashingLights then
        makeLuaSprite('preflash', '', 0, 0)
        makeGraphic('preflash', screenWidth, screenHeight, 'FFFFFF')
        setObjectCamera('preflash', 'hud')
        addLuaSprite('preflash', false)
        setProperty('preflash.alpha', 0)
    end

    makeLuaSprite('blackout', '', 0, 0)
    makeGraphic('blackout', screenWidth, screenHeight, '000000')
    setObjectCamera('blackout', 'hud')
    addLuaSprite('blackout', false)
    setProperty('blackout.alpha', 0)

    makeLuaText('justno', 'Not this time!', 1000, screenWidth / 2 - 500, screenHeight / 2)
    setTextSize('justno', 72)
    setProperty('justno.alpha', 0)
    setTextColor('justno', '31B1D1')
    setObjectCamera('justno', 'other')

    makeLuaText('bftext', 'Use your strength!', 1000, 20, 200)
    setTextSize('bftext', 48)
    setProperty('bftext.alpha', 0)
    setTextColor('bftext', '31B1D1')
    setObjectCamera('bftext', 'other')

    makeLuaText('gftext', 'Focus!', 1000, 200, 500)
    setTextSize('gftext', 48)
    setProperty('gftext.alpha', 0)
    setTextColor('gftext', 'A5004D')
    setObjectCamera('gftext', 'other')

    makeLuaText('picotext', 'Break through!', 1000, 500, 300)
    setTextSize('picotext', 48)
    setProperty('picotext.alpha', 0)
    setTextColor('picotext', 'B7D855')
    setObjectCamera('picotext', 'other')
end

local idleAllowed = true
local drain = true
local drain2 = false
local bfaid = false
local bfaid2 = false
local theBeat = 10000

function onBeatHit()
    if curBeat == 15 or curBeat == 47 or curBeat == 111 or curBeat == 175 or curBeat == 956 then
        if flashingLights then
            doTweenAlpha('preflash', 'preflash', 1, 0.8, 'quadIn')
        end
        theBeat = curBeat
    end

    if curBeat == (theBeat + 1) then
        if flashingLights then
            cameraFlash('hud', 'FFFFFF', 0.8, true)
            cancelTween('preflash')
            setProperty('preflash.alpha', 0)
        end
    end

    if curBeat == 142 then
        addLuaText('justno')
        doTweenAlpha('hi0', 'justno', 1, 0.2, 'quartIn')
    end

    if curBeat == 144 then
        setProperty('bf.visible', true)
        setProperty('pico.visible', true)
        setProperty('gf.x', gfx)
        drain = false
        drain2 = true
        bfaid = true
        if flashingLights then
            cameraFlash('game', 'FFFFFF', 0.8, true)
        end
        removeLuaText('justno')
        setProperty('dad.x', dadx)
        setProperty('dad.y', dady - 5)
    end

    if curBeat == 160 then
        bfaid = false
    end

    if curBeat == 176 then
        bfaid2 = true
    end

    if curBeat % 2 == 0 then
        if idleAllowed then
            playAnim('bf', 'idle', true)
        end
        playAnim('pico', 'idle', true)
    end

    if curBeat >= 160 and curBeat <= 174 then
        if flashingLights then
            cameraFlash('game', '000000', 0.5, true)
        end
    end

    if curBeat == 192 or curBeat == 208 then
        triggerEvent('Camera Follow Pos', '', '')
    end

    if curBeat == 184 or curBeat == 200 then
        triggerEvent('Camera Follow Pos', 600, 600)
    end

    if curBeat == 112 then
        setProperty('boyfriend.x', bfx)
    end

    if curBeat == 208 then
        setProperty('dad.x', dadx)
        setProperty('dad.y', dady - 5)
        setProperty('boyfriend.x', bfx)
        setProperty('boyfriend.y', bfy)
        drain2 = false
        bfaid2 = false
    end

    if curBeat == 244 then
        doTweenAlpha('blackout', 'blackout', 1, 1.8, 'cubeIn')
    end

    if curBeat == 245 then
        addLuaText('bftext')
        doTweenAlpha('hi', 'bftext', 1, 0.2, 'quartIn')
    end

    if curBeat == 246 then
        addLuaText('gftext')
        doTweenAlpha('hi2', 'gftext', 1, 0.2, 'quartIn')
    end

    if curBeat == 247 then
        addLuaText('picotext')
        doTweenAlpha('hi3', 'picotext', 1, 0.2, 'quartIn')
    end

    if curBeat == 248 then
        if flashingLights then
            cameraFlash('hud', 'FFFFFF', 0.8, true)
        end
        setProperty('blackout.alpha', 0)
        removeLuaText('bftext', true)
        removeLuaText('gftext', true)
        removeLuaText('picotext', true)
        setProperty('dad.x', dadx + 80)
        setProperty('dad.y', dady - 5)
    end

    if curBeat >= 296 and curBeat <= 299 then
        if flashingLights then
            cameraFlash('game', '000000', 0.5, true)
        end
    end

    if curBeat == 302 then
        if flashingLights then
            doTweenAlpha('preflash', 'preflash', 1, 1.8, 'quadIn')
        end
    end

    if curBeat == 304 then
        if flashingLights then
            cameraFlash('hud', 'FFFFFF', 0.8, true)
        end
        cancelTween('preflash')
        setProperty('preflash.alpha', 0)
        doTweenAlpha('bye', 'scoreTxt', 0, 0.8, 'quartIn')
        doTweenAlpha('bye1', 'healthBar', 0, 0.8, 'quartIn')
        doTweenAlpha('bye2', 'healthBarBG', 0, 0.8, 'quartIn')
        doTweenAlpha('bye3', 'iconP1', 0, 0.8, 'quartIn')
        doTweenAlpha('bye4', 'iconP2', 0, 0.8, 'quartIn')
        doTweenAlpha('bye5', 'timeBar', 0, 0.8, 'quartIn')
        doTweenAlpha('bye6', 'timeBarBG', 0, 0.8, 'quartIn')
        doTweenAlpha('bye7', 'timeTxt', 0, 0.8, 'quartIn')
        setProperty('botplayTxt.visible', false)
        for i=0,7 do
            noteTweenAlpha('thebye'..i, i, 0, 0.8, 'quartIn')
        end
        setProperty('dad.x', dadx + 80)
        setProperty('dad,y', dady)
    end
end

local theStep = 1200

function onStepHit()
    if curStep == 830 then
        if flashingLights then
            doTweenAlpha('preflash', 'preflash', 1, 0.3, 'quadIn')
        end
        theBeat = curBeat
    end

    if curStep == theStep and curStep < 1216 then
        if flashingLights then
            cameraFlash('game', '000000', 0.3, true)
        end
        theStep = theStep + 2
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Duet Note' or noteType == 'Special Sing' then
        playAnim('bf', direction, true)
        idleAllowed = false
        runTimer('resumeIdle', 0.5, 1)
    end
    if bfaid then
        setProperty('health', getProperty('health') + 0.05)
    end
    if bfaid2 then
        setProperty('health', getProperty('health') + 0.03)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if drain and getProperty('health') > 0.05 then
        setProperty('health', getProperty('health') - 0.05)
    end
    if drain2 and getProperty('health') > 0.02 then
        setProperty('health', getProperty('health') - 0.02)
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
		return Function_Stop
	end
	return Function_Continue
end

function onEndSong()
    if blockEnd then
		if not dia2 then
			dia2 = true
        	setProperty('inCutscene', true)
			startDialogue('dialogue2');
			runTimer('delayEnd', 300)
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
    if count == 25 then
        playSound('Lights_Turn_On', 0.6)
    end

	if dia2 and count >= 100 then
        runTimer('endthethingalready', 20)
        blockEnd = false
		cancelTimer('delayEnd')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeIdle' then
        idleAllowed = true
    end

    if tag == 'startDialogue' then
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