function onCreate()
    makeLuaSprite('bg2', 'indie/sans/Waterfall', -800, -400)
    scaleObject('bg2', 1.5, 1.5)
    updateHitbox('bg2')
    addLuaSprite('bg2', false)

    makeLuaSprite('bg', 'indie/sans/hall', -500, -300)
    scaleObject('bg', 1.8, 1.8)
    updateHitbox('bg')
    addLuaSprite('bg', false)

    makeLuaSprite('bg3', 'indie/sans/white', -1000, -500)
    scaleObject('bg3', 3, 3)
    updateHitbox('bg3')
    addLuaSprite('bg3', false)
    setProperty('bg3.alpha', 0)
end