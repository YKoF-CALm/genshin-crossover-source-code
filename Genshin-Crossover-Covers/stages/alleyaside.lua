function onCreate()
    makeLuaSprite('bg', 'aside/whitty/street', -800, -350)
    scaleObject('bg', 1.3, 1.3)
    updateHitbox('bg')
    addLuaSprite('bg', false)

    close(true)
end