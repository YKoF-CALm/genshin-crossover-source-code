function onEvent(name, value1, value2)
    if name == 'portraitframe' then
        if value1 == 1 then
            addLuaSprite('frame1', true)
            objectPlayAnimation('frame1', 'capture', true)
            runTimer('removeframe1', 3, 1)
        else
            addLuaSprite('frame2', true)
            objectPlayAnimation('frame2', 'capture', true)
            runTimer('removeframe2', 3, 1)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'removeframe1' then
        removeLuaSprite('frame1', false)
    end
    if tag == 'removeframe2' then
        removeLuaSprite('frame2', false)
    end
end
