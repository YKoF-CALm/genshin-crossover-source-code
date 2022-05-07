function onCreate()
    makeLuaSprite('bg', 'indie/sans/hall', -300, -100)
    scaleObject('bg', 1.5, 1.5)
    updateHitbox('bg')
    addLuaSprite('bg', false)

    close(true)
end