function onCreate()
    makeLuaSprite('spaceBG', 'void/spaceBG', -450, -160)
    scaleObject('spaceBG', 1.5, 1.5)
    updateHitbox('spaceBG')
    setScrollFactor('spaceBG', 0.1, 0.1)
    addLuaSprite('spaceBG', false)

    makeLuaSprite('spaceBGflash', 'void/spaceBGflash', -450, -160)
    scaleObject('spaceBGflash', 1.5, 1.5)
    updateHitbox('spaceBGflash')
    setScrollFactor('spaceBGflash', 0.1, 0.1)
    setProperty('spaceBGflash.alpha', 0)
    addLuaSprite('spaceBGflash', false)

    makeAnimatedLuaSprite('holoBoppers', 'void/holoBop', -360, -360)
    addAnimationByPrefix('holoBoppers', 'bop', 'Holo Boppers', 24, false)
    scaleObject('holoBoppers', 1.15, 1.15)
    updateHitbox('holoBoppers')
    setScrollFactor('holoBoppers', 0.2, 0.2)
    addLuaSprite('holoBoppers', false)
    runTimer('thebop', 3.2, 0)

    makeLuaSprite('spacerocks', 'void/spacerocks', -360, -30)
    setScrollFactor('spacerocks', 0.4, 0.4)
    addLuaSprite('spacerocks', false)
    runTimer('thebop2', 3, 0)

    makeAnimatedLuaSprite('spacestage', 'void/spacestage', -500, -330)
    addAnimationByPrefix('spacestage', 'bop', 'Stage Bop', 24, false)
    scaleObject('spacestage', 1.2, 1.2)
    updateHitbox('spacestage')
    addLuaSprite('spacestage', false)

    makeLuaSprite('spacerocksFG', 'void/spacerocksFG', -1620, -160)
    scaleObject('spacerocksFG', 1.3, 1.3)
    updateHitbox('spacerocksFG')
    setScrollFactor('spacerocksFG', 1.6, 1.6)
    addLuaSprite('spacerocksFG', true)
    runTimer('thebop3', 3, 0)
end

function onBeatHit()
    objectPlayAnimation('holoBoppers', 'bop', true)
    objectPlayAnimation('spacestage', 'bop', true)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'thebop' then
        if getProperty('holoBoppers.y') == -330 then
            doTweenY('up', 'holoBoppers', -360, 3.1, 'quadInOut')
        else
            doTweenY('down', 'holoBoppers', -330, 3.1, 'quadInOut')
        end
    end

    if tag == 'thebop2' then
        if getProperty('spacerocks.y') == -65 then
            doTweenY('down2', 'spacerocks', -30, 2.9, 'quadInOut')
        else
            doTweenY('up2', 'spacerocks', -65, 2.9, 'quadInOut')
        end
    end

    if tag == 'thebop3' then
        if getProperty('spacerocksFG.y') == -120 then
            doTweenY('up3', 'spacerocksFG', -160, 2.9, 'quadInOut')
        else
            doTweenY('down3', 'spacerocksFG', -120, 2.9, 'quadInOut')
        end
    end
end