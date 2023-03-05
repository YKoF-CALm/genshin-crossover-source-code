function onCreate()
    makeAnimatedLuaSprite('bf', 'characters/bf-h24', getProperty('gf.x') + 800, getProperty('gf.y') + 450)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    scaleObject('bf', 0.8, 0.8)
    updateHitbox('bf')
    addLuaSprite('bf', false)
    setObjectOrder('bf', getObjectOrder('gfGroup'))

    setProperty('introSoundsSuffix', '-h24')
end

function onBeatHit()
    if curBeat % 4 == 0 then
        playAnim('bf', 'idle', true)
    end
end