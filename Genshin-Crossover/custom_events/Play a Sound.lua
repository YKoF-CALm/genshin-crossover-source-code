function onEvent(name, value1, value2)
    if name == 'Play a Sound' then
        if value1 == '' then
            --do nothing
        else
            soundName = value1
        end
        if value2 == '' then
            volume = 0.6
        else
            volume = value2
        end
        playSound(soundName, volume)
    end
end