function onCreate()
    makeLuaSprite('stageback', 'stagedback', -600, -200)
    addLuaSprite('stageback', false)
    setLuaSpriteScrollFactor(0.9, 0.9);

    makeLuaSprite('ladder', 'ladder', -600, -200)
    addLuaSprite('ladder', false)
    setLuaSpriteScrollFactor(0.9, 0.9);

    makeLuaSprite('stagefront', 'stagedfront', -650, 600)
    addLuaSprite('stagefront', false)
    setLuaSpriteScrollFactor(0.9, 0.9);

    makeLuaSprite('stagecurtains', 'stagedcurtains', -500, -300)
    addLuaSprite('stagecurtains', false)
    setLuaSpriteScrollFactor(1.3, 1.3);

    close(true)
end