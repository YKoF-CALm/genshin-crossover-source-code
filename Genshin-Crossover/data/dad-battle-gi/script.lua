function onCreate()
    makeAnimatedLuaSprite('ganyu', 'characters/ganyu', 200, -100)
    addAnimationByPrefix('ganyu', 'idle', 'ganyu idle', 24, false)
    addLuaSprite('ganyu', false)
end

function onStartCountdown()
    setCharacterY('boyfriend', 130)
    cameraSetTarget('boyfriend')
    return Function_Continue;
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('ganyu', 'idle', true)
    end
end

function onUpdate(elapsed)
    if mustHitSection then
        setProperty('ganyu.flipX', false)
    elseif not mustHitSection then
        setProperty('ganyu.flipX', true)
    end
end
    