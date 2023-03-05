function onCreate()
    setProperty('dad.y', getProperty('dad.y') - 38)
    setProperty('introSoundsSuffix', '-h24')

    makeAnimatedLuaSprite('bf', 'characters/bf-h24', getProperty('gf.x') + 800, getProperty('gf.y') + 450)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    scaleObject('bf', 0.8, 0.8)
    updateHitbox('bf')
    addLuaSprite('bf', false)
    setObjectOrder('bf', getObjectOrder('gfGroup'))

    makeLuaSprite('black', '', 0, 0)
    makeGraphic('black', screenWidth, screenHeight, '000000')
    setObjectCamera('black', 'other')

    makeAnimatedLuaSprite('xiao', 'characters/xiao-indie-attack', screenWidth / 2 - 100, screenHeight / 2 - 200)
    addAnimationByPrefix('xiao', 'idle', 'idle xiao', 24, false)
    setObjectCamera('xiao', 'other')
    setProperty('xiao.alpha', 0.1)
    scaleObject('xiao', 0.5, 0.5)
    updateHitbox('xiao')
end

function onStepHit()
	if curStep == 60 then
		doTweenAlpha('circInOut', 'camGame', 0, 0.1, 'linear')
        doTweenAlpha('fadeInn', 'camHUD', 0, 0.1, 'linear')
	end

    if curStep == 64 then
		doTweenAlpha('circInOut', 'camGame', 1, 0.000001, 'linear')
        doTweenAlpha('fadeInn', 'camHUD', 1, 0.000001, 'linear')
	end

    if curStep == 494 then
        removeLuaSprite('xiao', true)
    end
end

function onBeatHit()
    if curBeat == 111 then
        cameraFlash('other', 'FFFFFF', 0.5, true)
        addLuaSprite('black', true)
        addLuaSprite('xiao', true)
        doTweenAlpha('hi', 'xiao', 1, 1.5, 'linear')
    end

    if curBeat == 128 then
        removeLuaSprite('black', true)
    end

    if curBeat % 2 == 0 then
        playAnim('xiao', 'idle', true)
        playAnim('bf', 'idle', true)
    end
end

function onEvent(name, value1, value2)
    if name == 'Lyrics Bf Side' then
        setObjectCamera("yappin", 'other')
        setTextSize('yappin', 30)
    end
end