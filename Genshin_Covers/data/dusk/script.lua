function onCreate()
    makeAnimatedLuaSprite('bf', 'BOYFRIEND', 500, 400)
    luaSpriteAddAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, true)
    addLuaSprite('bf', true);

    makeAnimatedLuaSprite('bfscared', 'BOYFRIEND_TABI', 500, 400)
    luaSpriteAddAnimationByPrefix('bfscared', 'idle', 'BF idle dance', 24, true)
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
    luaSpritePlayAnimation('bf', 'idle', true)
    luaSpritePlayAnimation('bfscared', 'idle', true)
end