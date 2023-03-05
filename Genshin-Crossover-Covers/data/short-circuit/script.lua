local bfx = 0
local dadx = 0
local dady = 0
local bfy = 0

function onCreate()
    precacheImage('secondicons/bf-normal')
    precacheImage('secondicons/bf-danger')
    precacheImage('secondicons/keqing-normal')
    precacheImage('secondicons/keqing-danger')
    addCharacterToList('keqing-evil-sp1', 'dad')
    addCharacterToList('keqing-evil-sp2', 'dad')

    for i = 0, getProperty('unspawnNotes.length')-1 do
		setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.05')
	end

    makeAnimatedLuaSprite('girlfriend', 'characters/Mad Gf', 1100, 300)
    addAnimationByPrefix('girlfriend', 'idle', 'idle mad gf', 24, false)
    addLuaSprite('girlfriend', false)

    makeAnimatedLuaSprite('pico', 'characters/Pico-Bedeviled', 1100, 400)
    addAnimationByPrefix('pico', 'idle', 'Pico Idle Dance', 24, false)
    addLuaSprite('pico', false)

    bfx = getProperty('boyfriend.x')
    setProperty('dad.y', getProperty('dad.y') + 10)
    setProperty('dad.x', getProperty('dad.x') - 50)
    dadx = getProperty('dad.x')
    dady = getProperty('dad.y')
    bfy = getProperty('boyfriend.y')

    makeLuaSprite('blackout', '', 0, 0)
    makeGraphic('blackout', screenWidth, screenHeight, '000000')
    setObjectCamera('blackout', 'hud')
    addLuaSprite('blackout', false)
    setProperty('blackout.alpha', 0)

    makeLuaText('bftext', 'Keep your focus', 500, 400, 300)
    setTextSize('bftext', 48)
    setProperty('bftext.alpha', 0)
    setTextColor('bftext', '31B1D1')
    setObjectCamera('bftext', 'other')

    makeLuaSprite('psychicVignette', 'psychic/vignette', 0, 0);
	setObjectCamera('psychicVignette', 'hud');
	setGraphicSize('psychicVignette', screenWidth, screenHeight);
	setScrollFactor('psychicVignette', 0, 0);
	addLuaSprite('psychicVignette', false);
	setProperty('psychicVignette.alpha', 0.00001);

    scaleObject('stagedfront', 1.3, 1.3)
    updateHitbox('stagedfront')
    setProperty('stagedfront.x', getProperty('stagedfront.x') - 200)
end

function onCreatePost()
    makeLuaSprite('bfIcon', 'secondicons/bf-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('bfIcon', 'hud')
    addLuaSprite('bfIcon', true)
    setObjectOrder('bfIcon', getObjectOrder('iconP1') + 1)
    setProperty('bfIcon.flipX', true)
    setProperty('bfIcon.visible', true)

    makeLuaSprite('bfDangerIcon', 'secondicons/bf-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('bfDangerIcon', 'hud')
    addLuaSprite('bfDangerIcon', true)
    setObjectOrder('bfDangerIcon', getObjectOrder('iconP1') + 1)
    setProperty('bfDangerIcon.flipX', true)
    setProperty('bfDangerIcon.visible', false)

    makeLuaSprite('keqingIcon', 'secondicons/keqing-normal', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('keqingIcon', 'hud')
    addLuaSprite('keqingIcon', true)
    setObjectOrder('keqingIcon', getObjectOrder('iconP1') + 1)
    setProperty('keqingIcon.flipX', true)
    setProperty('keqingIcon.visible', true)
    setProperty('keqingIcon.alpha', 0.5)

    makeLuaSprite('keqingDangerIcon', 'secondicons/keqing-danger', getProperty('iconP1.x'), getProperty('iconP1.y'))
    setObjectCamera('keqingDangerIcon', 'hud')
    addLuaSprite('keqingDangerIcon', true)
    setObjectOrder('keqingDangerIcon', getObjectOrder('iconP1') + 1)
    setProperty('keqingDangerIcon.flipX', true)
    setProperty('keqingDangerIcon.visible', false)
    setProperty('keqingDangerIcon.alpha', 0.5)
end

function onUpdate(elapsed)
    if curStep >= 1472 and curStep <= 1727 then
        setProperty('iconP1.visible', false)
        if getProperty('health') < 0.4 then
            setProperty('bfIcon.visible', false)
            setProperty('bfDangerIcon.visible', true)
            setProperty('keqingIcon.visible', false)
            setProperty('keqingDangerIcon.visible', true)
        else
            setProperty('bfIcon.visible', true)
            setProperty('bfDangerIcon.visible', false)
            setProperty('keqingIcon.visible', true)
            setProperty('keqingDangerIcon.visible', false)
        end
    else
        setProperty('bfIcon.visible', false)
        setProperty('bfDangerIcon.visible', false)
        setProperty('keqingIcon.visible', false)
        setProperty('keqingDangerIcon.visible', false)
    end
end

function onUpdatePost(elapsed)
    setProperty('bfIcon.x', getProperty('iconP1.x') - 25)
    setProperty('bfIcon.angle', getProperty('iconP1.angle'))
    setProperty('bfIcon.y', getProperty('iconP1.y') + 25) 
    setProperty('bfIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('bfIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)

    setProperty('bfDangerIcon.x', getProperty('iconP1.x') - 25)
    setProperty('bfDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('bfDangerIcon.y', getProperty('iconP1.y') + 25)
    setProperty('bfDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('bfDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)

    setProperty('keqingIcon.x', getProperty('iconP1.x') + 25)
    setProperty('keqingIcon.angle', getProperty('iconP1.angle'))
    setProperty('keqingIcon.y', getProperty('iconP1.y') - 25)
    setProperty('keqingIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('keqingIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)

    setProperty('keqingDangerIcon.x', getProperty('iconP1.x') + 25)
    setProperty('keqingDangerIcon.angle', getProperty('iconP1.angle'))
    setProperty('keqingDangerIcon.y', getProperty('iconP1.y') - 25)
    setProperty('keqingDangerIcon.scale.x', getProperty('iconP1.scale.x')/2 + 0.2)
    setProperty('keqingDangerIcon.scale.y', getProperty('iconP1.scale.y')/2 + 0.2)
end

local drain = false
local drain2 = false
local theStep = 10000

function onStepHit()
    if curStep == 1456 then
        if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
            -- middle scroll on
            noteTweenX("Mdx5", 0, 410, 1.4, "quartInOut");
            noteTweenAngle("Mdr5", 0, 360, 1.4, "quartInOut");
            noteTweenAlpha("Mdo5", 0, 0, 1.4, "quartInOut");
            noteTweenX("Mdx6", 1, 522, 1.4, "quartInOut");
            noteTweenAngle("Mdr6", 1, 360, 1.4, "quartInOut");
            noteTweenAlpha("Mdo6", 1, 0, 1.4, "quartInOut");
            noteTweenX("Mdx7", 2, 633, 1.4, "quartInOut");
            noteTweenAngle("Mdr7", 2, -360, 1.4, "quartInOut");
            noteTweenAlpha("Mdo7", 2, 0, 1.4, "quartInOut");
            noteTweenX("Mdx8", 3, 745, 1.4, "quartInOut");
            noteTweenAngle("Mdr8", 3, -360, 1.4, "quartInOut");
            noteTweenAlpha("Mdo8", 3, 0, 1.4, "quartInOut");
        end
        if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
                    -- your? note 1
                    
            noteTweenX("x5", 0, 410, 1.4, "quartInOut");
            noteTweenAngle("r5", 0, 360, 1.4, "quartInOut");
            noteTweenAlpha("o5", 0, 0, 1.4, "quartInOut");
                    -- your? note 2
            noteTweenX("x6", 1, 522, 1.4, "quartInOut");
            noteTweenAngle("r6", 1, 360, 1.4, "quartInOut");
            noteTweenAlpha("o6", 1, 0, 1.4, "quartInOut");
                    -- your? note 3
            noteTweenX("x7", 2, 633, 1.4, "quartInOut");
            noteTweenAngle("r7", 2, 360, 1.4, "quartInOut");
            noteTweenAlpha("o7", 2, 0, 1.4, "quartInOut");
                    -- your? note 4
            noteTweenX("x8", 3, 745, 1.4, "quartInOut");
            noteTweenAngle("r8", 3, 360, 1.4, "quartInOut");
            noteTweenAlpha("o8", 3, 0, 1.4, "quartInOut");
                    -- !your note 1
            noteTweenX("Mx5", 4, 410, 1.4, "quartInOut");
            noteTweenAngle("Mr5", 4, 360, 1.4, "quartInOut");
            noteTweenAlpha("Mo5", 4, 1, 16,"quartInOut");
                    -- !your note 2
            noteTweenX("Mx6", 5, 522, 1.4, "quartInOut");
            noteTweenAngle("Mr6", 5, 360, 1.4, "quartInOut");
            noteTweenAlpha("Mo6", 5, 1, 1.4, "quartInOut");
                    -- !your note 3
            noteTweenX("Mx7", 6, 633, 1.4, "quartInOut");
            noteTweenAngle("Mr7", 6, 360, 1.4, "quartInOut");
            noteTweenAlpha("Mo7", 6, 1, 1.4, "quartInOut");
                    -- !your note 4
            noteTweenX("Mx8", 7, 745, 1.4, "quartInOut");
            noteTweenAngle("Mr8", 7, 360, 1.4, "quartInOut");
            noteTweenAlpha("Mo8", 7, 1, 1.4, "quartInOut");
        end
    end

    if curStep == 400 or curStep == 404 or curStep == 408 or curStep == 412 or curStep == 912 or curStep == 916 or curStep == 920 or curStep == 924 then
        triggerEvent('Vignette Fade', 0.1, 100)
        theStep = curStep
    end

    if curStep == (theStep + 2) then
        triggerEvent('Vignette Fade', 0.1, 0)
    end

    if curStep == 416 or curStep == 928 then
        cameraFlash('game', '000000', 0.8, true)
        setProperty('psychicVignette.alpha', 1)
        drain = true
        doTweenAlpha('curout', 'stagedcurtains', 0, 1, 'quadInOut')
    end

    if curStep == 672 or curStep == 1184 then
        cameraFlash('game', '000000', 0.8, true)
        setProperty('psychicVignette.alpha', 0)
        drain = false
        doTweenAlpha('curin', 'stagedcurtains', 1, 1, 'quadInOut')
    end

    if curStep == 1424 then
        doTweenAlpha('blackout', 'blackout', 1, 1.4, 'cubeIn')
    end

    if curStep == 1448 then
        addLuaText('bftext')
        doTweenAlpha('hi', 'bftext', 1, 0.2, 'quartIn')
    end

    if curStep == 1464 then
        doTweenAlpha('hi', 'bftext', 0, 0.2, 'quartIn')
    end

    if curStep == 1472 then
        removeLuaSprite('blackout')
        setProperty('dad.color', '000000')
        setProperty('iconP2.color', '000000')
        setProperty('gf.alpha', 0.5)
        setProperty('gf.flipX', true)
        setProperty('gf.x', getProperty('gf.x') + 200)
        setProperty('gf.y', getProperty('gf.y') - 50)
        cameraFlash('game', 'FFFFFF', 0.8, true)
        drain2 = true
        setProperty('dad.x', dadx)
        setProperty('dad.y', dady)
    end

    if curStep == 1728 then
        for i = 0, 3 do
			j = (i + 4)

			iPos = _G['defaultPlayerStrumX'..i];
			jPos = _G['defaultOpponentStrumX'..i];
			noteTweenX('note'..i..'TwnX', j, iPos, 0.5, 'quadInOut');
			noteTweenX('note'..j..'TwnX', i, jPos, 0.5, 'quadInOut');
		end
        for i=0,7 do
            noteTweenAlpha('bye'..i, i, 1, 0.5, 'circOut')
        end
        setProperty('dad.color', getColorFromHex('0xFFFFFFFF'))
        setProperty('iconP2.color', getColorFromHex('0xFFFFFFFF'))
        cameraFlash('game', 'FFFFFF', 0.8, true)
        drain2 = false
        setProperty('boyfriend.x', bfx)
        setProperty('boyfriend.y', bfy)
        setProperty('iconP1.visible', true)
        setProperty('bfIcon.visible', false)
        setProperty('bfDangerIcon.visible', false)
        setProperty('keqingIcon.visible', false)
        setProperty('keqingDangerIcon.visible', false)
    end

    if curStep == 1184 then
        triggerEvent('Change Character', '1', 'keqing-evil-sp1')
        setProperty('dad.x', dadx)
        setProperty('dad.y', dady)
    end
end

function onBeatHit()
    if drain2 then
        setProperty('health', getProperty('health') - 0.2)
    end

    if curBeat % 2 == 0 then
        playAnim('pico', 'idle', true)
        playAnim('girlfriend', 'idle', true)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if drain and getProperty('health') > 0.03 then
        setProperty('health', getProperty('health') - 0.03)
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
    if count == 27 then
        playSound('Lights_Turn_On', 0.6)
    end

	if count >= 85 then
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