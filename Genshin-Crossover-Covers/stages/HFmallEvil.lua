function onCreate()
    makeLuaSprite('bg', 'holofunk/christmas/evilBG', -400, -500)
    addLuaSprite('bg', false)

    makeAnimatedLuaSprite('fire1', 'holofunk/christmas/fireGoBrr', 1200, -205)
    addAnimationByPrefix('fire1', 'burn', 'Fire0', 24, false)
    addAnimationByPrefix('fire1', 'idle', 'FireIdle', 24, false)
    addLuaSprite('fire1', false)

    makeAnimatedLuaSprite('fire2', 'holofunk/christmas/fireGoBrr', 950, -205)
    addAnimationByPrefix('fire2', 'burn', 'Fire0', 24, false)
    addAnimationByPrefix('fire2', 'idle', 'FireIdle', 24, false)
    addLuaSprite('fire2', false)

    makeLuaSprite('fireglow', 'holofunk/christmas/fireGlow', -400, -500)
    setProperty('fireglow.alpha', 0)
    addLuaSprite('fireglow', false)

    makeLuaSprite('evilTree', 'holofunk/christmas/evilTree', 400, -300)
    addLuaSprite('evilTree', false)
end