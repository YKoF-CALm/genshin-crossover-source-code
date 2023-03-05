function onCreate()
    makeLuaSprite('bg', 'homr/Clouds_HS', -700, -500)
    scaleObject('bg', 1.2, 1.2)
    addLuaSprite('bg', false)

    makeLuaSprite('fg', 'homr/House_HS', -700, -500)
    scaleObject('fg', 1.2, 1.2)
    addLuaSprite('fg', false)

    close(true)
end