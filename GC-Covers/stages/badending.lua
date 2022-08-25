function onCreate()
    makeLuaSprite('evilSpace', 'badending/bigmonika/Sky', -300, 0)
    setScrollFactor('evilSpace', 0.4, 0.4)
    addLuaSprite('evilSpace', false)

    makeLuaSprite('evilClubBG', 'badending/bigmonika/BG', -220, -110)
    setScrollFactor('evilClubBG', 1, 1)
    scaleObject('evilClubBG', 1.3, 1.3)
    updateHitbox('evilClubBG')
    addLuaSprite('evilClubBG', false)
end