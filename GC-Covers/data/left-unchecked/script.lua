function onCreate()
    setProperty('introSoundsSuffix', '-hypno')
    makeAnimatedLuaSprite('monika', 'characters/Monika_Worried', 1500, -200)
    addAnimationByPrefix('monika', 'idle', 'Monika Returns Idle', 24, false)
    setProperty('monika.flipX', true)
    scaleObject('monika', 0.8, 0.8)
    updateHitbox('monika')
    addLuaSprite('monika', false)
end

function onBeatHit()
    if curBeat % 4 == 0 then
        objectPlayAnimation('monika', 'idle', true)
    end
end