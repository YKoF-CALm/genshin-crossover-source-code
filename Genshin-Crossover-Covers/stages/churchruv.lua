function onCreate()
    makeLuaSprite('floor', 'mfm/church2/floor', -660, -1060)
    scaleObject('floor', 1.3, 1.3)
    updateHitbox('floor')
    addLuaSprite('floor', false)

    makeLuaSprite('bg', 'mfm/church2/bg', -660, -1060)
    scaleObject('bg', 1.3, 1.3)
    updateHitbox('bg')
    addLuaSprite('bg', false)
    
    makeLuaSprite('pillars', 'mfm/church2/pillars', -660, -1060)
    scaleObject('pillars', 1.3, 1.3)
    updateHitbox('pillars')
    addLuaSprite('pillars', false)

    makeLuaSprite('pillarbroke', 'mfm/church2/pillarbroke', -660, -1060)
    scaleObject('pillarbroke', 1.3, 1.3)
    updateHitbox('pillarbroke')
    setObjectOrder('pillarbroke', getObjectOrder('gfGroup') + 1)
    addLuaSprite('pillarbroke', false)

    close(true)
end