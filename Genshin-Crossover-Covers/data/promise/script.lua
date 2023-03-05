function onCreate()
    setProperty('gf.x', getProperty('gf.x') - 200)
    setProperty('gf.y', getProperty('gf.y') - 100)
    setProperty('gf.flipX', true)
    setProperty('boyfriend.y', getProperty('boyfriend.y') - 30)
    setProperty('boyfriend.x', getProperty('boyfriend.x') - 100)
    setProperty('dad.x', getProperty('dad.x') + 100)
end

local xx = 500;
local yy = 400;
local xx2 = 800;
local yy2 = 400;

function onUpdate(elapsed)
    if not mustHitSection then
        triggerEvent('Camera Follow Pos', xx, yy)
    else
        triggerEvent('Camera Follow Pos', xx2, yy2)
    end
end

function onBeatHit()
    if curBeat == 240 then
        setProperty('dad.x', getProperty('dad.x') + 100)
    end
end