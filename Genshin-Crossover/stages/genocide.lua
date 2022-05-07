function onCreate()
    makeLuaSprite('bg', 'tabi/youhavebeendestroyed', -550, -150)
    scaleObject('bg', 0.95, 0.95)
    updateHitbox('bg')
    addLuaSprite('bg', false)

    makeAnimatedLuaSprite('fire3', 'tabi/newfireglow', -200, 150)
    addAnimationByPrefix('fire3', 'burn', 'FireStage', 24, true)
    scaleObject('fire3', 1.3, 1.3)
    updateHitbox('fire3')
    setProperty('fire3.flipX', true)
    addLuaSprite('fire3', false)
    objectPlayAnimation('fire3', 'burn', true)

    makeAnimatedLuaSprite('fire2', 'tabi/newfireglow', 600, 150)
    addAnimationByPrefix('fire2', 'burn', 'FireStage', 24, true)
    scaleObject('fire2', 1.3, 1.3)
    updateHitbox('fire2')
    addLuaSprite('fire2', false)
    objectPlayAnimation('fire2', 'burn', true)

    makeAnimatedLuaSprite('fire4', 'tabi/newfireglow', -800, 50)
    addAnimationByPrefix('fire4', 'burn', 'FireStage', 24, true)
    scaleObject('fire4', 1.5, 1.5)
    updateHitbox('fire4')
    setProperty('fire4.flipX', true)
    addLuaSprite('fire4', false)
    objectPlayAnimation('fire4', 'burn', true)

    makeAnimatedLuaSprite('fire', 'tabi/newfireglow', 1000, 50)
    addAnimationByPrefix('fire', 'burn', 'FireStage', 24, true)
    scaleObject('fire', 1.5, 1.5)
    updateHitbox('fire')
    addLuaSprite('fire', false)
    objectPlayAnimation('fire', 'burn', true)

    makeLuaSprite('mg', 'tabi/glowyfurniture', -600, -200)
    addLuaSprite('mg', false)

    makeLuaSprite('boombox', 'tabi/Destroyed_boombox', -640, -200)
    addLuaSprite('boombox', false)

    makeLuaSprite('fg', 'tabi/overlayingsticks', -600, -280)
    addLuaSprite('fg', true)

    makeLuaSprite('vg', 'tabi/vignette', 0, 0)
    setObjectCamera('vg', 'other')
    addLuaSprite('vg', true)
end