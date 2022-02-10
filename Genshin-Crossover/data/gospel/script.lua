function onCreate()
    makeAnimatedLuaSprite('sarv', 'characters/sarvente_dark', 1400, -200)
    setProperty('sarv.flipX', true)
    luaSpriteAddAnimationByPrefix('sarv', 'idle', 'SarvDarkIdle', 24, false)
    addLuaSprite('sarv', false)

    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND_TABI', 1400, 300)
    luaSpriteAddAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bf', false)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        luaSpritePlayAnimation('sarv', 'idle', true)
        luaSpritePlayAnimation('bf', 'idle', true)
    end
end