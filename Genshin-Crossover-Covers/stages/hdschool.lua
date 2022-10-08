function onCreate()
    makeLuaSprite('bg', 'hdweeb/HDWeebschool/bgWalls', -1000, -500)
    scaleObject('bg', 0.8, 0.8)
    updateHitbox('bg')
    setScrollFactor('bg', 0.2, 0.2)
    addLuaSprite('bg', false)

    makeAnimatedLuaSprite('bottomBoppers', 'hdweeb/HDWeebschool/bottomBop', -300, 140)
    addAnimationByPrefix('bottomBoppers', 'hey', 'Bottom Level Boppers', 24, false)
    addLuaSprite('bottomBoppers', false)

    makeLuaSprite('fgSnow', 'hdweeb/HDWeebschool/fgSnow', -600, 700)
    addLuaSprite('fgSnow', false)
end

function onBeatHit()
    objectPlayAnimation('bottomBoppers', 'hey', true)
end