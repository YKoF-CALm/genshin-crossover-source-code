function onCreate()
    makeAnimatedLuaSprite('sarv', 'characters/sarvente_dark', 1400, 100)
    setProperty('sarv.flipX', true)
    luaSpriteAddAnimationByPrefix('sarv', 'idle', 'SarvDarkIdle', 24, false)
    addLuaSprite('sarv', false)

    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND_TABI', 1400, 600)
    luaSpriteAddAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bf', false)

    precacheImage('characters/sarvente_dark')
    precacheImage('chcracters/BOYFRIEND_TABI')
end

function onBeatHit()
    if curBeat % 2 == 0 then
        luaSpritePlayAnimation('sarv', 'idle', true)
        luaSpritePlayAnimation('bf', 'idle', true)
    end
end