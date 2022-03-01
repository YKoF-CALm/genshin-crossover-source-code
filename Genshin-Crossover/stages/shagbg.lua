function onCreate()
    makeLuaSprite('bg_lemon', 'shaggy/bg_lemon', -400, -160)
    addLuaSprite('bg_lemon', false)
    scaleLuaSprite('bg_lemon', 1.5, 1.5)
    updateHitbox('bg_lemon')
    setLuaSpriteScrollFactor(0.95, 0.95)

    close(true)
end