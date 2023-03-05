function onCreate()
    setProperty('dad.y', getProperty('dad.y') + 70)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 35)
    setProperty('dad.x', getProperty('dad.x') + 100)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 100)
    --setProperty('gf.x', getProperty('gf.x') + 30)
    --setProperty('gf.y', getProperty('gf.y') - 30)
end

local xx = 600
local yy = 500
local xx2 = 900
local yy2 = 400

function onUpdate(elapsed)
    if not mustHitSection then
        triggerEvent('Camera Follow Pos', xx, yy)
    else
        triggerEvent('Camera Follow Pos', xx2, yy2)
    end
end