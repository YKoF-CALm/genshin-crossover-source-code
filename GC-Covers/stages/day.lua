function onCreate()
    makeLuaSprite('bg1', 'b&b/BG1', -570, -340)
    addLuaSprite('bg1', false)
    setLuaSpriteScrollFactor('bg1', 0.3, 0.3)
    scaleLuaSprite('bg1', 0.8, 0.8)
    updateHitbox('bg1')

    makeLuaSprite('bg2', 'b&b/BG2', -273, -110)
    addLuaSprite('bg2', false)
    setLuaSpriteScrollFactor('bg2', 0.6, 0.6)
    scaleLuaSprite('bg2', 0.5, 0.5)
    updateHitbox('bg2')

    makeLuaSprite('bg3', 'b&b/BG3', -390, -220)
    addLuaSprite('bg3', false)
    scaleLuaSprite('bg3', 0.8, 0.8)
    updateHitbox('bg3')

    close(true)
end