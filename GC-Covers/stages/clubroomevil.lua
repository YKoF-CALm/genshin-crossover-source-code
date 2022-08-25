function onCreate()
    makeLuaSprite('space', 'doki/bigmonika/Sky', -300, 0)
    setScrollFactor('space', 0.4, 0.4)
    addLuaSprite('space', false)

    makeLuaSprite('bg', 'doki/bigmonika/BG', -250, -167)
    setScrollFactor('bg', 0.4, 0.6)
    addLuaSprite('bg', false)

    makeLuaSprite('stageFront', 'doki/bigmonika/FG', -332, -77)
    setScrollFactor('stageFront', 1, 1)
    addLuaSprite('stageFront', false)
end