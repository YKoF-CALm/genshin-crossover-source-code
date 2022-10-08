function onCreate()
    addCharacterToList('ganyu-evil-player', 'boyfriend')
    addCharacterToList('xiao-lament', 'dad')
    addCharacterToList('xiao-lament-crazy', 'dad')
    precacheImage('corruption/stagedback')
    precacheImage('corruption/ladder')
    precacheImage('corruption/stagedfront')
    precacheImage('corruption/stagedcurtains')
    precacheImage('psychic/vignette')
    precacheImage('notes/corruptednotes')
    precacheImage('notesplashes/CORRUPTnoteSplashes')

    makeLuaSprite('stagedback', 'corruption/stagedback', -600, -200)
    addLuaSprite('stagedback', false)
    setScrollFactor('stagedback', 0.9, 0.9);

    makeLuaSprite('ladder', 'corruption/ladder', -600, -200)
    addLuaSprite('ladder', false)
    setScrollFactor('ladder', 0.9, 0.9);

    makeLuaSprite('stagedfront', 'corruption/stagedfront', -650, 600)
    addLuaSprite('stagedfront', false)
    scaleObject('stagedfront', 1.1, 1.1)
    updateHitbox('stagedfront')
    setScrollFactor('stagedfront', 0.9, 0.9);

    makeLuaSprite('stagedcurtains', 'corruption/stagedcurtains', -600, -400)
    addLuaSprite('stagedcurtains', false)
    setScrollFactor('stagedcurtains', 1.3, 1.3);

    setProperty('stagedback.alpha', 0)
    setProperty('ladder.alpha', 0)
    setProperty('stagedfront.alpha', 0)
    setProperty('stagedcurtains.alpha', 0)

    makeLuaSprite('blackout', '', 0, 0)
    makeGraphic('blackout', screenWidth, screenHeight, '000000')
    setObjectCamera('blackout', 'hud')
    addLuaSprite('blackout', false)

    makeLuaSprite('blackout2', '', -300, -100)
    makeGraphic('blackout2', 2000, 1000, '000000')
    addLuaSprite('blackout2', false)

    makeLuaSprite('psychicVignette', 'psychic/vignette', 0, 0);
	setObjectCamera('psychicVignette', 'hud');
	setGraphicSize('psychicVignette', screenWidth, screenHeight);
	setScrollFactor('psychicVignette', 0, 0);
	addLuaSprite('psychicVignette', false);
	setProperty('psychicVignette.alpha', 0.00001);

    makeLuaText('sorry', "I'm sorry", 1000,  screenWidth / 2 - 500, screenHeight / 2)
    setTextSize('sorry', 72)
    setProperty('sorry.alpha', 0)
    setObjectCamera('sorry', 'other')

    makeLuaText('anotherone', "I couldn't save you...", 1000, screenWidth / 2 - 500, screenHeight / 2)
    setTextSize('anotherone', 72)
    setProperty('anotherone.alpha', 0)
    setObjectCamera('anotherone', 'other')

    setProperty('boyfriend.alpha', 0)
end

function onCreatePost()
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
end

local theStep2 = 10000
local drain = false

function onStepHit()
    if curStep == 1 then
        doTweenAlpha('bye', 'blackout', 0, 1, 'linear')
        doTweenAlpha('hii2', 'iconP2', 1, 1, 'linear')
    end

    if curStep == 114 then
        doTweenAlpha('hi', 'boyfriend', 0.5, 0.5, 'quartIn')
        doTweenAlpha('hii', 'iconP1', 0.5, 0.5, 'quartIn')
    end

    if curStep == 128 then
        cameraFlash('hud', 'FFFFFF', 0.8, true)
        setProperty('blackout2.alpha', 0)
    end

    if curStep == 400 then
        doTweenAlpha('in', 'blackout', 0.8, 1, 'quadIn')
    end

    if curStep == 416 then
        cameraFlash('hud', 'FFFFFF', 0.8, true)
        setProperty('blackout.alpha', 0)
        setProperty('stagedback.alpha', 1)
        setProperty('ladder.alpha', 1)
        setProperty('stagedfront.alpha', 1)
        setProperty('stagedcurtains.alpha', 1)
        setProperty('boyfriend.alpha', 1)
        setProperty('iconP1.alpha', 1)
    end

    if curStep == 880 or curStep == 884 or curStep == 888 or curStep == 892 or curStep == 1408 or curStep == 1412 or curStep == 1416 or curStep == 1420 then
        triggerEvent('Vignette Fade', 0.1, 100)
        theStep2 = curStep
    end

    if curStep == (theStep2 + 2) then
        triggerEvent('Vignette Fade', 0.1, 0)
    end

    if curStep == 896 or curStep == 1424 then
        setProperty('psychicVignette.alpha', 1)
        drain = true
    end

    if curStep == 896 then
        cameraFlash('hud', 'FFFFFF', 0.8, true)
    end

    if curStep == 1664 then
        setProperty('psychicVignette.alpha', 0)
        drain = false
    end

    if curStep == 1408 then
        doTweenAlpha('blacking', 'blackout', 0.8, 1, 'quadIn')
        drain = false
    end

    if curStep == 1424 then
        cameraFlash('hud', 'FFFFFF', 0.8, true)
        setProperty('blackout.alpha', 0)
    end

    if curStep == 1664 or curStep == 1984 then
        cameraFlash('hud', 'FFFFFF', 0.8, true)
    end

    if curStep == 1984 then
        doTweenAlpha('bye', 'camHUD', 0, 0.8, 'quartIn')
    end

    if curStep == 2016 then
        addLuaText('sorry')
        doTweenAlpha('hi', 'sorry', 1, 0.5, 'quartIn')
    end

    if curStep == 2032 then
        doTweenAlpha('bye', 'sorry', 0, 0.5, 'quartIn')
    end

    if curStep == 2048 then
        addLuaText('anotherone')
        doTweenAlpha('hi', 'anotherone', 1, 0.5, 'quartIn')
    end

    if curStep == 2080 then
        doTweenAlpha('bye', 'anotherone', 0, 1, 'quartIn')
    end
end

local xx = 500
local yy = 420
local xx2 = 900
local yy2 = 420
local followchar = true
function onUpdate(elapsed)
    if followchar then
        if mustHitSection then
            triggerEvent('Camera Follow Pos', xx2, yy2)
        else
            triggerEvent('Camera Follow Pos', xx, yy)
        end
    end
end

function onEvent(name, value1, value2)
    if name == "Vignette Fade" then
		duration = tonumber(value1)
		targetAlpha = tonumber(value2)

		if duration <= 0 then
			setProperty('psychicVignette.alpha', targetAlpha);
			if cameraZoomOnBeat then
				setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.07);
			end
		else
			doTweenAlpha('PsyVigAlphaTwn', 'psychicVignette', targetAlpha, duration, 'linear');
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if drain and getProperty('health') > 0.023 then
        setProperty('health', getProperty('health') - 0.023)
    end
end

local allowCountdown = false

function onStartCountdown()
    if not allowCountdown then
        setProperty('inCutscene', true)
        runTimer('startDialogue', 0.8)
        allowCountdown = true
        return Function_Stop
    end
    return Function_Continue
end

function onNextDialogue(count)
    if count == 35 then
        playSound('Lights_Turn_On', 0.6)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogue' then
        startDialogue('dialogue')
    end
end