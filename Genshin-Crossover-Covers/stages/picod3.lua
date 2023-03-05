function onCreate()
    makeLuaSprite('bg', 'corruption/takeover/picod3/parkingbg', -100, -300)
    addLuaSprite('bg', false)

    makeAnimatedLuaSprite('left', 'corruption/takeover/picod3/LeftBoppers', -15, 240)
    addAnimationByPrefix('left', 'idle', 'Boppers LEFT', 24, false)
    addLuaSprite('left', false)

    makeAnimatedLuaSprite('right', 'corruption/takeover/picod3/RightBoppers', 910, 170)
    addAnimationByPrefix('right', 'idle', 'Boppers RIGHT', 24, false)
    addLuaSprite('right', false)

    makeAnimatedLuaSprite('gf', 'corruption/takeover/picod3/LimoCassandra', 250, 20)
    addAnimationByIndices('gf', 'left', 'Limo Boppers', '30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14', 24)
    addAnimationByIndices('gf', 'right', 'Limo Boppers', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29', 24)
    addLuaSprite('gf', false)

    makeLuaSprite('black', '', 0, 0)
    makeGraphic('black', screenWidth, screenHeight, '000000')
    setObjectCamera('black', 'hud')
    setProperty('black.alpha', 0)
    addLuaSprite('black', false)

    makeAnimatedLuaSprite('scenes', 'corruption/takeover/picod3/scenes', 0, 0)
    addAnimationByPrefix('scenes', 'skidnene', 'SkidNene', 24, false)
    addAnimationByPrefix('scenes', 'tabiwhitty', 'TabiWhitty', 24, false)
    addAnimationByPrefix('scenes', 'ruvsarv', 'RuvSarv', 24, false)
    addAnimationByPrefix('scenes', 'lemlila', 'LemLila', 24, false)
    addAnimationByPrefix('scenes', 'dd1', 'DD1', 24, false)
    addAnimationByPrefix('scenes', 'gf', 'GF', 24, false)
    addAnimationByPrefix('scenes', 'dd2', 'DD2', 24, false)
    addAnimationByPrefix('scenes', 'dd3', 'DD3', 24, false)
    setObjectCamera('scenes', 'hud')
    setProperty('scenes.alpha', 0)
    addLuaSprite('scenes', false)

    makeLuaSprite('p1', 'corruption/takeover/picod3/p1', 200, 500)
    setObjectCamera('p1', 'hud')
    setProperty('p1.alpha', 0)
    addLuaSprite('p1', false)

    makeLuaSprite('p2', 'corruption/takeover/picod3/p2', 100, 500)
    setObjectCamera('p2', 'hud')
    setProperty('p2.alpha', 0)
    addLuaSprite('p2', false)

    makeLuaSprite('p3', 'corruption/takeover/picod3/p3', 100, 450)
    setObjectCamera('p3', 'hud')
    setProperty('p3.alpha', 0)
    addLuaSprite('p3', false)

    makeLuaSprite('tvscreen', 'corruption/takeover/picod3/tvscreen', 0, 0)
    setObjectCamera('tvscreen', 'other')
    setProperty('tvscreen.visible', false)
    addLuaSprite('tvscreen', true)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('left', 'idle', true)
        playAnim('right', 'idle', true)
    end

    if curBeat % 4 == 0 then
        playAnim('gf', 'left', true)
    end

    if curBeat % 4 == 2 then
        playAnim('gf', 'right', true)
    end
end