function onCreate()
    makeLuaSprite('stageback', 'corruption/stagedback', -600, -200)
    addLuaSprite('stageback', false)
    setLuaSpriteScrollFactor(0.9, 0.9);

    makeLuaSprite('ladder', 'corruption/ladder', -600, -200)
    addLuaSprite('ladder', false)
    setLuaSpriteScrollFactor(0.9, 0.9);

    makeLuaSprite('stagefront', 'corruption/stagedfront', -650, 600)
    addLuaSprite('stagefront', false)
    scaleLuaSprite('stagefront', 1.1, 1.1)
    updateHitbox('stagefront')
    setLuaSpriteScrollFactor(0.9, 0.9);

    makeLuaSprite('stagecurtains', 'corruption/stagedcurtains', -500, -300)
    addLuaSprite('stagecurtains', false)
    scaleLuaSprite('stagecurtains', 0.9, 0.9)
    updateHitbox('stagecurtains')
    setLuaSpriteScrollFactor(1.3, 1.3);

    close(true)
end