function onCreate()
    makeLuaSprite('bg', 'exe/SunkBG', -670, -260)
    setScrollFactor('bg', 0.91, 0.91)
    scaleObject('bg', 0.8, 0.8)
    updateHitbox('bg')
    addLuaSprite('bg', false)

    close(true)
end