function onCreate()
    makeAnimatedLuaSprite('girlfriend', 'characters/gf-reanimated', getProperty('gf.x'), getProperty('gf.y'))
    addAnimationByIndices('girlfriend', 'left', 'GF Dancing Beat', '30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14', 24)
    addAnimationByIndices('girlfriend', 'right', 'GF Dancing Beat', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29', 24)
    addAnimationByPrefix('girlfriend', 'hey', 'GF Cheer', 24, false)
    addOffset('girlfriend', 'hey', 0, 9)
    addLuaSprite('girlfriend', false)
    setProperty('gf.visible', false)
end

function onBeatHit()
    if curBeat % 4 == 0 then
        if curBeat == 12 then
            playAnim('girlfriend', 'hey', true)
        else
            playAnim('girlfriend', 'left', true)
        end
    end

    if curBeat % 4 == 2 then
        playAnim('girlfriend', 'right', true)
    end
end