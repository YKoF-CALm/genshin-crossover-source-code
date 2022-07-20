function onCreate()
    makeLuaSprite('bg', 'hypno/Hypno bg background', -300, -600)
    scaleObject('bg', 0.7, 0.7)
    updateHitbox('bg')
    addLuaSprite('bg', false)

    makeLuaSprite('mg', 'hypno/Hypno bg midground', -300, -600)
    scaleObject('mg', 0.7, 0.7)
    updateHitbox('mg')
    addLuaSprite('mg', false)

    makeLuaSprite('fg', 'hypno/Hypno bg foreground', -300, -600)
    scaleObject('fg', 0.7, 0.7)
    updateHitbox('fg')
    addLuaSprite('fg', true)

    close(true)
end