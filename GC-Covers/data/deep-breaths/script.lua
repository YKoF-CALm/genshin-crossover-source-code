function onCreate()
    addLuaSprite('yuri', false)
    setProperty('yuri.x', 420)
    setProperty('yuri.y', 176)
    addLuaSprite('natsuki', false)
    setProperty('natsuki.x', -60)
    setProperty('natsuki.y', 276)
    addLuaSprite('monika', false)
    setProperty('monika.x', 1250)
    setProperty('monika.y', 176)

    makeAnimatedLuaSprite('bf', 'characters/DDLCBoyFriend_Assets', 500, 500)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bf', true)

    makeLuaSprite('purplething', '', 0, 0)
    makeGraphic('purplething', screenWidth, screenHeight, 'C8A2C8')
    setProperty('purplething.alpha', 0.2)
    setObjectCamera('purplething', 'hud')

    setProperty('boyfriend.x', getProperty('boyfriend.x') + 50)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 10)
end

function onCountdownTick(counter)
    if counter == 0 then
        characterPlayAnim('gf', 'three', true)
    end

    if counter == 1 then
        characterPlayAnim('gf', 'two', true)
    end

    if counter == 2 then
        characterPlayAnim('gf', 'one', true)
    end
    
    if counter == 3 then
        characterPlayAnim('gf', 'cheer', true)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('yuri', 'idle', true)
        objectPlayAnimation('natsuki', 'idle', true)
        objectPlayAnimation('monika', 'idle', true)
        objectPlayAnimation('bf', 'idle', true)
    end
end

function onStepHit()
    if curStep == 416 then
        addLuaSprite('purplething', false)
        addLuaSprite('sparklebg', false)
        addLuaSprite('sparklefg', false)
    end

    if curStep == 800 then
        doTweenAlpha('bye', 'purplething', 0, 2.1, 'linear')
        doTweenAlpha('bye1', 'sparklebg', 0, 2.1, 'linear')
        doTweenAlpha('bye2', 'sparklefg', 0, 2.1, 'linear')
    end

    if curStep == 928 then
        setProperty('purplething.alpha', 0.2)
        setProperty('sparklebg.alpha', 1)
        setProperty('sparklefg.alpha', 1)
    end

    if curStep == 1151 then
        doTweenAlpha('bye', 'purplething', 0, 3.75, 'linear')
        doTweenAlpha('bye1', 'sparklebg', 0, 3.75, 'linear')
        doTweenAlpha('bye2', 'sparklefg', 0, 3.75, 'linear')
    end
end