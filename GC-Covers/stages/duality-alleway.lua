function onCreate()
    makeLuaSprite('bg', 'corruption/alley/limosky2', -570, -70)
    setScrollFactor('bg', 0.8, 0.8)
    addLuaSprite('bg', false)

    makeLuaSprite('mg', 'corruption/alley/walls', -520, -50)
    addLuaSprite('mg', false)

    close(true)
end