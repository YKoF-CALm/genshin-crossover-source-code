function onCreate()
    removeLuaSprite('agoti', false)
    removeLuaSprite('aldryx', false)

    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND', 400, 900)
    makeAnimatedLuaSprite('bfscared', 'characters/BOYFRIEND', 400, 900)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    addAnimationByPrefix('bfscared', 'scared', 'BF idle shaking', 24, true)
    addLuaSprite('bf', true)

    dady = getCharacterY('dad')
    setCharacterY('dad', dady + 70)
    setProperty('dad.x', getProperty('dad.x') + 100)
    cameraSetTarget('dad')
end

function onStepHit()
    if curStep == 894 or curStep == 916 or curStep == 928 or curStep == 948 or curStep == 960 or curStep == 980 or curStep == 992 or curStep == 1012 then
        removeLuaSprite('bf', false)
        addLuaSprite('bfscared', true)
        objectPlayAnimation('bfscared', 'scared', true)
    end
    if curStep == 898 or curStep == 920 or curStep == 932 or curStep == 952 or curStep == 964 or curStep == 984 or curStep == 996 or curStep == 1016 then
        removeLuaSprite('bfscared', false)
        addLuaSprite('bf', true)
    end
    if curStep % 8 == 0 then
        objectPlayAnimation('bf', 'idle', true)
    end
end