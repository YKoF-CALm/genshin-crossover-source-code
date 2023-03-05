function onEvent(name, value1, value2)
    if name == 'HUD Fade' then
        if value1 == 0 then
            doTweenAlpha('hi', 'camHUD', 1, 0.7, 'quadInOut')
        end

        if value1 == 1 then
            doTweenAlpha('bye', 'camHUD', 0, 0.7, 'quadInOut')
        end
    end
end