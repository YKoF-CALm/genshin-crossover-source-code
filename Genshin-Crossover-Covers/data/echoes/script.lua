function onCreate()
    setProperty('dad.x', getProperty('dad.x') + 100)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 100)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 5)
end

function onUpdate(elapsed)
    if not mustHitSection then
        triggerEvent('Camera Follow Pos', 500, 500)
    else
        triggerEvent('Camera Follow Pos', 900, 500)
    end
end
