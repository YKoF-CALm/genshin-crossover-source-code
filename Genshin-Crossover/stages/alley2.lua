function onCreate()
    makeLuaSprite('bg', 'corruption/alley/limosky2', -570, -70)
    scaleObject('bg', 1.3, 1.3)
    updateHitbox('bg')
    setScrollFactor('bg', 0.8, 0.8)
    addLuaSprite('bg', false)

    makeLuaSprite('mg', 'corruption/alley/walls', -520, -50)
    scaleObject('mg', 1.3, 1.3)
    updateHitbox('mg')
    addLuaSprite('mg', false)

    close(true)
end