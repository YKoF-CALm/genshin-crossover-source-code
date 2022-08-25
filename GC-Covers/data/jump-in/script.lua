function onCreate()
    setProperty('boyfriend.y', getProperty('boyfriend.y') - 35)
    setProperty('dad.y', getProperty('dad.y') + 40)
    setProperty('dad.x', getProperty('dad.x') + 50)

    setProperty('introSoundsSuffix', '-bob')
    makeLuaSprite('3', 'b&b/3', 0, 0)
    setObjectCamera('3', 'other')
    makeLuaSprite('2', 'b&b/2', 0, 0)
    setObjectCamera('2', 'other')
    makeLuaSprite('1', 'b&b/1', 0, 0)
    setObjectCamera('1', 'other')
    makeLuaSprite('go', 'b&b/go', 0, 0)
    setObjectCamera('go', 'other')

    setProperty('skipCountdown', true)

    makeAnimatedLuaSprite('albedo', 'characters/albedo', -600, -200)
    addAnimationByPrefix('albedo', 'idle', 'albedo idle', 24, false)
    addLuaSprite('albedo', false)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('albedo', 'idle', true)
    end

    if curBeat == 16 then
        addLuaSprite('3', true)
        doTweenAlpha('beforeReady', '3', '0', crochet/1000, 'cubeInOut')
    end
    if curBeat == 17 then
        addLuaSprite('2', true)
        doTweenAlpha('Ready', '2', '0', crochet/1000, 'cubeInOut')
    end
    if curBeat == 18 then
        addLuaSprite('1', true)
        doTweenAlpha('Set', '1', '0', crochet/1000, 'cubeInOut')
    end
    if curBeat == 19 then
        addLuaSprite('go', true)
        doTweenAlpha('Go', 'go', '0', crochet/1000, 'cubeInOut')
    end
end

function onStepHit()
    if curStep == 63 then
        playSound('intro3-bob')
    end
    if curStep == 67 then
        playSound('intro2-bob')
    end
    if curStep == 72 then
        playSound('intro1-bob')
    end
    if curStep == 75 then
        runTimer('gosound', 0.1, 1)
    end
end

function onUpdate(elapsed)
    if mustHitSection then
        triggerEvent('Camera Follow Pos', 800, 390)
    elseif not mustHitSection then
        triggerEvent('Camera Follow Pos', 500, 390)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'gosound' then
        playSound('introGo-bob')
    end
end