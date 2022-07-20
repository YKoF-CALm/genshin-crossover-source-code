function onCreate()
    makeLuaSprite('sky', 'tgt/chapter2/images/sky', -600, -200)
    addLuaSprite('sky', false)
    setLuaSpriteScrollFactor('sky', 0.4, 0.4)

    makeLuaSprite('grass', 'tgt/chapter2/images/grass', -650, 600)
    addLuaSprite('grass', false)
    setLuaSpriteScrollFactor('grass', 0.9, 0.9)
    scaleObject('grass', 1.1, 1.1)
    updateHitbox('grass')

    makeLuaSprite('foreground', 'tgt/chapter2/images/foreground', -450, -150)
    addLuaSprite('foreground', false)
    setLuaSpriteScrollFactor('foreground', 1.3, 1.3)
    scaleObject('foreground', 0.87, 0.87)
    updateHitbox('foreground')

    close(true)
end