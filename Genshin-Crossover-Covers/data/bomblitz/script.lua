function onCreate()
    setProperty('gf.x', getProperty('gf.x') + 50)
    setProperty('gf.y', getProperty('gf.y') - 100)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 50)

    makeLuaSprite('vignette', 'aside/whitty/grid', -250, -200)
    setObjectCamera('vignette', 'hud')
    scaleObject('vignette', 0.75, 0.75)
    updateHitbox('vignette')
    addLuaSprite('vignette', false)
end