function onEvent(name, value1, value2)
    if name == 'Toogus Sax' then
        setProperty('saxguy.x', -550)
        setProperty('saxguy.y', 275)
        addLuaSprite('saxguy', true)
    end
end