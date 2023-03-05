local defx = 0
local defy = 0
local allowIdle = true
local bfx = 0
local bfy = 0

function onCreate()
	bfx = getProperty('boyfriend.x')
	bfy = getProperty('boyfriend.y')
	setProperty('boyfriend.x', getProperty('dad.x') - 280)
	setProperty('boyfriend.y', getProperty('dad.y') - 80)
	setProperty('dad.x', bfx - 100)
	setProperty('dad.y', bfy - 130)
	setProperty('gf.x', getProperty('gf.x') - 400)
	setProperty('gf.y', getProperty('gf.y') - 150)
	cameraSetTarget('boyfriend')
	makeAnimatedLuaSprite('Dad2', 'characters/ayato-duality', 450, -180);
	addAnimationByPrefix('Dad2', 'idle', 'ayato idle', 24, false);
    addAnimationByPrefix('Dad2', '0', 'ayato right', 24, false);
    addAnimationByPrefix('Dad2', '1', 'ayato down', 24, false);
    addAnimationByPrefix('Dad2', '2', 'ayato up', 24, false);
    addAnimationByPrefix('Dad2', '3', 'ayato left', 24, false);
	objectPlayAnimation('Dad2', 'idle'); 
	setProperty('Dad2.flipX', true);
	addLuaSprite('Dad2', true);

	makeLuaSprite('overlay', 'corruption/alley/stageoverlay', 0, 0)
	setObjectCamera('overlay', 'hud')
	addLuaSprite('overlay', false)

	makeLuaSprite('overlay2', 'corruption/alley/stageoverlay', 0, 0)
	setObjectCamera('overlay2', 'other')

	makeLuaSprite('ready', 'corruption/fcr/ready', screenWidth / 4 - 50, screenHeight / 4)
    setObjectCamera('ready', 'other')
    makeLuaSprite('set', 'corruption/fcr/set', screenWidth / 4 - 20, screenHeight / 4)
    setObjectCamera('set', 'other')
    makeLuaSprite('go', 'corruption/fcr/go', screenWidth / 4, screenHeight / 4 - 20)
    setObjectCamera('go', 'other')
end

function onCreatePost()
	defx = getProperty('Dad2.x')
	defy = getProperty('Dad2.y')
    setProperty('iconP1.flipX', 1)
    setProperty('iconP2.flipX', 1)
    setProperty('healthBar.flipX', 1)
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

function onBeatHit()
	if curBeat % 2 == 0 and allowIdle then
		objectPlayAnimation('Dad2', 'idle');
	end
end

function onStepHit()
	if curStep == 1 then
		setProperty("defaultCamZoom", 1.15)
		setProperty('camGame.zoom', 1.15)
	end

	if curStep == 1024 then
		doTweenAlpha('bye', 'camHUD', 0, 0.5, 'linear')
		addLuaSprite('overlay2', true)
	end

	if curStep == 1152 then
		cameraFade('other', '000000', 4, true)
	end
end

function onUpdatePost()
    setProperty('iconP1.x', -593+getProperty('healthBar.x') + (getProperty('healthBar.width')*(remapToRange(getProperty('healthBar.percent'), 0, -100, 100, 0)*0.01))-(150 * getProperty('iconP1.scale.x'))/2 - 26*2)
    setProperty('iconP2.x', -593+getProperty('healthBar.x') + (getProperty('healthBar.width')*(remapToRange(getProperty('healthBar.percent'), 0, -100, 100, 0)*0.01))+(150 * getProperty('iconP2.scale.x')-150)/2 - 26)
end

function remapToRange(value, start1, stop1, start2, stop2)
    return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end

lastNote = {0, ""}

function opponentNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "Special Sing" then
		objectPlayAnimation('Dad2', lastNote[1])
		allowIdle = false
		runTimer('resumeIdle', 0.5, 1)
    end

    if getProperty('health') > 0.023 then
        setProperty('health', getProperty('health') - 0.023)
    end
end

function onUpdate(elapsed)
	if getProperty('Dad2.animation.curAnim.name') == '0' then
		setProperty('Dad2.x', defx - 39)
		setProperty('Dad2.y', defy + 1)
	elseif getProperty('Dad2.animation.curAnim.name') == '1' then
		setProperty('Dad2.x', defx + 20)
		setProperty('Dad2.y', defy + 8)
	elseif getProperty('Dad2.animation.curAnim.name') == '2' then
		setProperty('Dad2.x', defx + 36)
		setProperty('Dad2.y', defy - 1)
	elseif getProperty('Dad2.animation.curAnim.name') == '3' then
		setProperty('Dad2.x', defx + 28)
		setProperty('Dad2.y', defy - 1)
	else
		setProperty('Dad2.x', defx)
		setProperty('Dad2.y', defy)
	end
end

function onEvent(name, value1, value2)
	if name == 'Add Camera Flash' then
		cameraFlash('other', 'FFFFFF', 0.3, true)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'resumeIdle' then
		allowIdle = true
	end
end

function onTweenCompleted(tag)
	if tag == 'Ready' then
        removeLuaSprite('2', true)
    end
    if tag == 'Set' then
        removeLuaSprite('1', true)
    end
    if tag == 'Go' then
        removeLuaSprite('go', true)
    end
end