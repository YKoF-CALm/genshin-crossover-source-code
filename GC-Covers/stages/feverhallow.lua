function onCreate()
    makeLuaSprite('nopaint', 'fever/week2bghallow', -200, -100)
    addLuaSprite('nopaint', false)

    makeLuaSprite('paint', 'fever/week2bghallowpainting', -200, -100)

    makeAnimatedLuaSprite('frame1', 'fever/paintingShit', 1300, 200)
    addAnimationByPrefix('frame1', 'capture', 'paintingShit', 24, false)

    makeAnimatedLuaSprite('frame2', 'fever/paintingShit', 1300, 200)
    addAnimationByPrefix('frame2', 'capture', 'paintingShit', 24, false)
end