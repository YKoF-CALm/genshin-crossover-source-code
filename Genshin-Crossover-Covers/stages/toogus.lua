function onCreate()
    makeLuaSprite('bg', 'impostor/mirabg', -1600, 50)
    scaleObject('bg', 1.06, 1.06)
    addLuaSprite('bg', false)
    setScrollFactor('bg', 1, 1)

    makeLuaSprite('fg', 'impostor/mirafg', -1600, 50)
    scaleObject('fg', 1.06, 1.06)
    addLuaSprite('fg', false)
    setScrollFactor('fg', 1, 1)

    makeLuaSprite('tbl', 'impostor/table_bg', -1600, 50)
    scaleObject('tbl', 1.06, 1.06)
    addLuaSprite('tbl', false)
    setScrollFactor('tbl', 1, 1)
end