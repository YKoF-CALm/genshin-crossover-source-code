alreadySwapped = false;

function onCreate()
    precacheSound('charswitch')
    precacheImage('shaggy/burst')
    precacheImage('characters/mona')
    precacheImage('characters/kazuha')
    precacheImage('characters/xinyan')
    addCharacterToList('kazuha-player', 'boyfriend')
    addCharacterToList('xinyan-player', 'boyfriend')
    addCharacterToList('mona-player', 'boyfriend')
    addCharacterToList('fischl-player', 'boyfriend')
    precacheImage('psychic/vignette')

    makeLuaSprite('blackbox', '', 0, 0)
    makeGraphic('blackbox', screenWidth, screenHeight, '000000')
    setObjectCamera('blackbox', 'hud')
    addLuaSprite('blackbox', false)

    makeLuaSprite('blackbox2', '', 0, 0)
    makeGraphic('blackbox2', screenWidth, screenHeight, '000000')
    setObjectCamera('blackbox2', 'other')
    addLuaSprite('blackbox2', true)

    makeAnimatedLuaSprite('burst', 'shaggy/burst', getProperty('boyfriend.x') + 50, getProperty('boyfriend.y') + 450)
	addAnimationByPrefix('burst', 'burst', 'burst', 24, false)
    addLuaSprite('burst', false)
    setProperty('burst.alpha', 0)
    setObjectOrder('burst', getObjectOrder('gfGroup') + 1)

    makeAnimatedLuaSprite('static', 'badending/clubroom/staticshock', 0, 0)
    addAnimationByPrefix('static', 'static', 'hueh', 24, false)
    setObjectCamera('static', 'hud')
    addLuaSprite('static', false)
    setProperty('static.alpha', 0)

    makeLuaSprite('psychicVignette', 'psychic/vignette', 0, 0);
	setObjectCamera('psychicVignette', 'hud');
	setGraphicSize('psychicVignette', screenWidth, screenHeight);
	setScrollFactor('psychicVignette', 0, 0);
	addLuaSprite('psychicVignette', false);
	setProperty('psychicVignette.alpha', 0.00001);

    makeAnimatedLuaSprite('mona', 'characters/mona', 550, 1000)
    addAnimationByPrefix('mona', 'idle', 'mona idle', 24, false)
    addOffset('mona', 'idle', -7, -1)
    addAnimationByPrefix('mona', '0', 'mona right', 24, false)
    addOffset('mona', '0', '36', '-2')
    addAnimationByPrefix('mona', '1', 'mona down', 24, false)
    addOffset('mona', '1', -4, -1)
    addAnimationByPrefix('mona', '2', 'mona up', 24, false)
    addOffset('mona', '2', -8, -1)
    addAnimationByPrefix('mona', '3', 'mona left', 24, false)
    addOffset('mona', '3', -6, 1)
    addLuaSprite('mona', false)
    setObjectOrder('mona', getObjectOrder('gfGroup') + 1)
    setProperty('mona.flipX', true)

    makeAnimatedLuaSprite('kazuha', 'characters/kazuha', 1000, 1000)
    addAnimationByPrefix('kazuha', 'idle', 'kazuha idle', 24, false)
    addAnimationByPrefix('kazuha', '0', 'kazuha right', 24, false)
    addOffset('kazuha', '0', -10, 3)
    addAnimationByPrefix('kazuha', '1', 'kazuha down', 24, false)
    addOffset('kazuha', '1', -15, 4)
    addAnimationByPrefix('kazuha', '2', 'kazuha up', 24, false)
    addOffset('kazuha', '2', -88, 5)
    addAnimationByPrefix('kazuha', '3', 'kazuha left', 24, false)
    addOffset('kazuha', '3', -88, 7)
    addLuaSprite('kazuha', false)
    setObjectOrder('kazuha', getObjectOrder('gfGroup') + 1)
    setProperty('kazuha.flipX', true)

    makeAnimatedLuaSprite('xinyan', 'characters/xinyan', 1200, 1000)
    addAnimationByPrefix('xinyan', 'idle', 'xinyan idle', 24, false)
    addOffset('xinyan', 'idle', -7, -1)
    addAnimationByPrefix('xinyan', '0', 'xinyan right', 24, false)
    addOffset('xinyan', '0', 38, -6)
    addAnimationByPrefix('xinyan', '1', 'xinyan down', 24, false)
    addOffset('xinyan', '1', -10, -1)
    addAnimationByPrefix('xinyan', '2', 'xinyan up', 24, false)
    addOffset('xinyan', '2', -10, -1)
    addAnimationByPrefix('xinyan', '3', 'xinyan left', 24, false)
    addOffset('xinyan', '3', -7, -1)
    addLuaSprite('xinyan', false)
    setObjectOrder('xinyan', getObjectOrder('kazuha') + 1)
    setProperty('xinyan.flipX', true)

    setProperty('skipCountdown', true)
end

function onCreatePost()
    for i=0,3 do
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
    end
end

local monaIdleAllowed = true
local kazuhaIdleAllowed = true
local xinyanIdleAllowed = true

function onBeatHit()
    if curBeat % 2 == 0 then
        if monaIdleAllowed then
            playAnim('mona', 'idle', true)
        end

        if kazuhaIdleAllowed then
            playAnim('kazuha', 'idle', true)
        end

        if xinyanIdleAllowed then
            playAnim('xinyan', 'idle', true)
        end
    end
end

local theStep = 10000
local theStep2 = 10000
local theStep3 = 10000
local theStep4 = 10000
local monasing = false
local kazuhasing = false
local xinyansing = false
local healthdrain = false

function onStepHit()
    if curStep == 1 then
        doTweenAlpha('unblacken', 'blackbox2', 0, 5, 'linear')
    end

    if curStep == 128 then
        for i=0,3 do
            noteTweenAlpha('hi'..i, i, 1, 3, 'circOut')
        end
    end

    if curStep == 406 then
        for i=0,7 do
            noteTweenAlpha('bye'..i, i, 0, 3, 'circOut')
        end
    end

    if curStep == 448 then
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
    end

    if curStep == 424 or curStep == 991 then
        setProperty('static.alpha', 0.5)
        objectPlayAnimation('static', 'static', true)
        theStep3 = curStep
    end

    if curStep == (theStep3 + 1) then
        setProperty('blackbox.alpha', 0)
    end

    if curStep == (theStep3 + 2) then
        setProperty('static.alpha', 0)
    end

    if curStep == 720 or curStep == 832 or curStep == 992 or curStep == 1308 or curStep == 1536 or curStep == 1816 or curStep == 2016 or curStep == 2200 then
        setProperty('burst.alpha', 1)
        objectPlayAnimation('burst', 'burst', false)
		playSound('charswitch', 2)
        setProperty('boyfriend.color', 'FFFFFF')
        doTweenColor('switch', 'boyfriend', '0xFFFFFFFF', 0.1, 'linear')
        theStep = curStep
    end

    if curStep == (theStep + 2) then
        setProperty('burst.alpha', 0)
    end

    if curStep == 688 or curStep == 692 or curStep == 696 or curStep == 700 or curStep == 976 or curStep == 980 or curStep == 984 or curStep == 988 or curStep == 1232 or curStep == 1236 or curStep == 1240 or curStep == 1244 or curStep == 1488 or curStep == 1492 or curStep == 1496 or curStep == 1500 or curStep == 2000 or curStep == 2004 or curStep == 2008 or curStep == 2012 then
        triggerEvent('Vignette Fade', 0.1, 100)
        theStep2 = curStep
    end

    if curStep == (theStep2 + 2) then
        triggerEvent('Vignette Fade', 0.1, 0)
    end

    if curStep == 704 then
        triggerEvent('Must Press Swap', '', '')
    end

    if curStep == 960 then
        doTweenAlpha('blacken', 'blackbox', 1, 2, 'linear')
    end

    if curStep == 992 then
        triggerEvent('Force Middlescroll', 'On', 0.1)
    end

    if curStep == 1248 then
        triggerEvent('Must Press Swap', '', '')
        noteTweenAlpha("o1",0,1,0.5,"smoothStepInOut")
		noteTweenAlpha("o2",1,1,0.5,"smoothStepInOut")
		noteTweenAlpha("o3",2,1,0.5,"smoothStepInOut")
		noteTweenAlpha("o4",3,1,0.5,"smoothStepInOut")
        setProperty('psychicVignette.alpha', 1)
    end

    if curStep == 1504 then
        triggerEvent('Must Press Swap', '', '')
        setProperty('blackbox.alpha', 1)
        doTweenAlpha('unblacken', 'blackbox', 0.5, 1, 'linear')
        setProperty('psychicVignette.alpha', 0)
        healthdrain = false
    end

    if curStep == 1632 or curStep == 2268 then
        setProperty('static.alpha', 0.5)
        objectPlayAnimation('static', 'static', true)
        theStep4 = curStep
    end

    if curStep == (theStep4 + 2) then
        setProperty('static.alpha', 0)
    end

    if curStep == 1760 then
        doTweenAlpha('unblacked', 'blackbox', 0, 0.5, 'linear')
    end

    if curStep == 2016 then
        triggerEvent('Must Press Swap', '', '')
    end

    if curStep == 992 or curStep == 2272 then
        setProperty('psychicVignette.alpha', 1)
        healthdrain = true
    end

    if curStep == 2592 then
        doTweenY('him', 'mona', 0, 0.5, 'elasticInOut')
        monasing = true
    end

    if curStep == 2656 then
        doTweenY('hix', 'xinyan', 0, 0.5, 'elasticInOut')
        xinyansing = true
        monasing = false
    end

    if curStep == 2720 then
        doTweenY('hik', 'kazuha', 0, 0.5, 'elasticInOut')
        kazuhasing = true
        xinyansing = false
    end

    if curStep == 2784 then
        monasing = true
        kazuhasing = false
    end

    if curStep == 2792 then
        xinyansing = true
        monasing = false
    end

    if curStep == 2800 then
        kazuhasing = true
        xinyansing = false
    end

    if curStep == 2808 then
        monasing = true
        xinyansing = true
    end

    if curStep == 2816 then
        setProperty('blackbox.alpha', 1)
        setProperty('psychicVignette.alpha', 0)
        healthdrain = false
        for i=0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    end

    if curStep == 2825 then
        for i=0,3 do
            noteTweenAlpha('hi'..i, i+4, 1, 0.5, 'circOut')
        end
    end

    if curStep == 2832 then
        setProperty('blackbox.alpha', 0)
    end

    if curStep == 2864 then
        doTweenAlpha('bye', 'dad', 0, 0.8, 'linear')
        doTweenAlpha('byeicon', 'iconP2', 0, 0.8, 'linear')
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

    if name == "Must Press Swap" then
		for i = 0, 3 do
			j = (i + 4)

			iPos = _G['defaultPlayerStrumX'..i];
			jPos = _G['defaultOpponentStrumX'..i];
			if alreadySwapped then
				iPos = _G['defaultOpponentStrumX'..i];
				jPos = _G['defaultPlayerStrumX'..i];
			end
			noteTweenX('note'..i..'TwnX', i, iPos, 0.35, 'quadInOut');
			noteTweenX('note'..j..'TwnX', j, jPos, 0.35, 'quadInOut');
		end
		alreadySwapped = not alreadySwapped;
    end

    if name == 'Force Middlescroll' then
		duration = value2
		if value1 == 'On' then
			if middlescroll == false then
				noteTweenX("om1",0,412,duration,"smoothStepInOut")
				noteTweenX("om2",1,524,duration,"smoothStepInOut")
				noteTweenX("om3",2,636,duration,"smoothStepInOut")
				noteTweenX("om4",3,748,duration,"smoothStepInOut")
				noteTweenX("p1",4,412,duration,"smoothStepInOut")
				noteTweenX("p2",5,524,duration,"smoothStepInOut")
				noteTweenX("p3",6,636,duration,"smoothStepInOut")
				noteTweenX("p4",7,748,duration,"smoothStepInOut")
			end
			noteTweenAlpha("o1",0,0,duration,"smoothStepInOut")
			noteTweenAlpha("o2",1,0,duration,"smoothStepInOut")
			noteTweenAlpha("o3",2,0,duration,"smoothStepInOut")
			noteTweenAlpha("o4",3,0,duration,"smoothStepInOut")
		elseif value1 == 'Off' then
			if middlescroll == false then
				noteTweenX("om1",0,92,duration,"smoothStepInOut")
				noteTweenX("om2",1,204,duration,"smoothStepInOut")
				noteTweenX("om3",2,316,duration,"smoothStepInOut")
				noteTweenX("om4",3,428,duration,"smoothStepInOut")
				noteTweenAlpha("o1",0,1,duration,"smoothStepInOut")
				noteTweenAlpha("o2",1,1,duration,"smoothStepInOut")
				noteTweenAlpha("o3",2,1,duration,"smoothStepInOut")
				noteTweenAlpha("o4",3,1,duration,"smoothStepInOut")
				noteTweenX("p1",4,732,duration,"smoothStepInOut")
				noteTweenX("p2",5,844,duration,"smoothStepInOut")
				noteTweenX("p3",6,956,duration,"smoothStepInOut")
				noteTweenX("p4",7,1068,duration,"smoothStepInOut")
			else
				noteTweenAlpha("o1",0,0.5,duration,"smoothStepInOut")
				noteTweenAlpha("o2",1,0.5,duration,"smoothStepInOut")
				noteTweenAlpha("o3",2,0.5,duration,"smoothStepInOut")
				noteTweenAlpha("o4",3,0.5,duration,"smoothStepInOut")
			end
		else
			debugPrint('Invalid Force Middlescroll value.')
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if healthdrain then
        setProperty('health', getProperty('health') - 0.023)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Duet Note' then
        if monasing then
            playAnim('mona', direction, true)
            monaIdleAllowed = false
            runTimer('resumeMonaIdle', 0.5, 1)
        end

        if kazuhasing then
            playAnim('kazuha', direction, true)
            kazuhaIdleAllowed = false
            runTimer('resumeKazuhaIdle', 0.5, 1)
        end

        if xinyansing then
            playAnim('xinyan', direction, true)
            xinyanIdleAllowed = false
            runTimer('resumeXinyanIdle', 0.5, 1)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resumeMonaIdle' then
        monaIdleAllowed = true
    end

    if tag == 'resumeKazuhaIdle' then
        kazuhaIdleAllowed = true
    end

    if tag == 'resumeXinyanIdle' then
        xinyanIdleAllowed = true
    end
end