local bfy = 0
local dady = 0

function onCreate()
    setProperty('boyfriend.y', getProperty('boyfriend.y') - 320)
    setProperty('dad.y', getProperty('dad.y') - 320)
    bfy = getProperty('boyfriend.y')
    dady = getProperty('dad.y')
    setProperty('introSoundsSuffix', '-h24')
end

function onBeatHit()
    setProperty('boyfriend.y', bfy + 30)
    doTweenY('bfbounce','boyfriend',bfy,0.4,'circOut')
    setProperty('dad.y', dady + 30)
    doTweenY('dadbounce','dad',dady,0.4,'circOut')
end