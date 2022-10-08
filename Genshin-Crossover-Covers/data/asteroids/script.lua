function onCreate()
    precacheImage('void/ready')
    precacheImage('void/set')
    precacheImage('void/go')

    setProperty('dad.x', getProperty('dad.x') + 300)
    setProperty('dad.y', getProperty('dad.y') + 55)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 105)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 100)
    cameraSetTarget('boyfriend')
    setProperty('boyfriend.scale.x', 0.8)
    setProperty('boyfriend.scale.y', 0.8)

    makeLuaSprite('ready', 'void/ready', screenWidth / 4 + 70, screenHeight / 4 + 100)
    scaleObject('ready', 0.7, 0.7)
    updateHitbox('ready')
    setObjectCamera('ready', 'other')
    makeLuaSprite('set', 'void/set', screenWidth / 4 + 100, screenHeight / 4 + 100)
    scaleObject('set', 0.7, 0.7)
    updateHitbox('set')
    setObjectCamera('set', 'other')
    makeLuaSprite('go', 'void/go', screenWidth / 4 + 110, screenHeight / 4 + 60)
    scaleObject('go', 0.7, 0.7)
    updateHitbox('go')
    setObjectCamera('go', 'other')
    setProperty('introSoundsSuffix', '-void')
end

function onCountdownTick(counter)
	setProperty('countdownReady.visible', false)
    setProperty('countdownSet.visible', false)
    setProperty('countdownGo.visible', false)
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