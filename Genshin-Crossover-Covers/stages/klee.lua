function onCreate()
    makeLuaSprite('fondo', 'genshin/bg', -900, -700);
    setScrollFactor('fondo', 1, 1);

    makeAnimatedLuaSprite('gf', 'characters/gf_genshin', 300, 105);
    setScrollFactor('gf', 1, 1);

    addLuaSprite('fondo')
    addLuaSprite('gf', false)
    addAnimationByIndices('gf', 'left', 'GF Dancing Beat', '30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14', 24)
    addAnimationByIndices('gf', 'right', 'GF Dancing Beat', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29', 24)
end
--
--function onStepHit()
  --if curStep == 711 then
    --setProperty('static.alpha', 0.5)
  --end
--end

function onBeatHit()
    if curBeat % 4 == 0 then
        objectPlayAnimation('gf', 'left', true)
    end

    if curBeat % 4 == 2 then
        objectPlayAnimation('gf', 'right', true)
    end
end
