function onCreate()
    setProperty('dad.x', getProperty('dad.x') + 100)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 70)
end

local xx = 500
local yy = 420
local xx2 = 900
local yy2 = 420
local followchar = true
function onUpdate(elapsed)
    if followchar then
        if mustHitSection then
            triggerEvent('Camera Follow Pos', xx2, yy2)
        else
            triggerEvent('Camera Follow Pos', xx, yy)
        end
    end
end