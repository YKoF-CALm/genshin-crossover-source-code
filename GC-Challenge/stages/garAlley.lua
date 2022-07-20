function onCreate()
    makeLuaSprite('bg', 'garcello/garStagebg', -500, -170)
    addLuaSprite('bg', false)
    setScrollFactor('bg', 0.7, 0.7)

    makeLuaSprite('alley', 'garcello/garStage', -500, -200)
    addLuaSprite('alley', false)
    setScrollFactor('alley', 0.9, 0.9)

    close(true)
end