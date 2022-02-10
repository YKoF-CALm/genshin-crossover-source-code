function onCreate()
    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND', 500, 400)
    luaSpriteAddAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('bf', true);

    makeAnimatedLuaSprite('bfscared', 'characters/BOYFRIEND_TABI', 500, 400)
    luaSpriteAddAnimationByPrefix('bfscared', 'idle', 'BF idle dance', 24, false)
end

function onBeatHit()
    if curBeat == 128 or curBeat == 256 then
        removeLuaSprite('bf', false)
        addLuaSprite('bfscared', true)
    end

    if curBeat == 224 or curBeat == 276  then
        removeLuaSprite('bfscared', false)
        addLuaSprite('bf', true)
    end

    if curBeat % 2 == 0 then
        luaSpritePlayAnimation('bf', 'idle', true)
        luaSpritePlayAnimation('bfscared', 'idle', true)
    end
end