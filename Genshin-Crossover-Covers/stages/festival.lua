function onCreate()
    makeLuaSprite('bg', 'CJ/dusk/bg', -550, -160)
    setScrollFactor('bg', 0.5, 0.5)
    addLuaSprite('bg', false)

    makeLuaSprite('stage', 'CJ/stage', -510, -260)
    addLuaSprite('stage', false)

    for i=0,5 do
        makeLuaSprite('light'..i, 'CJ/light'..i, -510, -260)
        if i ~= 0 then
            setProperty('light'..i..'.visible', false)
        end
        addLuaSprite('light'..i, false)
    end

    makeAnimatedLuaSprite('headlights', 'CJ/headlights', -510, -80)
    addAnimationByPrefix('headlights', 'idle', 'lightsrepeated', 24, false)
    playAnim('headlights', 'idle', true)
    addLuaSprite('headlights')

    makeAnimatedLuaSprite('frontbop', 'CJ/frontboppers', -510, 950)
    addAnimationByPrefix('frontbop', 'idle', 'frontboppers', 24, false)
    playAnim('frontbop', 'idle', true)
    addLuaSprite('frontbop', true)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('frontbop', 'idle', true)
    end
    playAnim('headlights', 'idle', true)
end

function onSectionHit()
    local roll = math.random(0, 5)
    for i=0,5 do
        setProperty('light'..i..'.visible', false)
    end
    setProperty('light'..roll..'.visible', true)
end