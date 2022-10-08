function onCreate()
    makeLuaSprite('sky', 'prologue/rooftopsky', -100, 0)
    addLuaSprite('sky', false)
    setLuaSpriteScrollFactor(0.1, 0.1)

    makeLuaSprite('city', 'prologue/distantcity', -10, 0)
    addLuaSprite('city', false)
    scaleLuaSprite('city', 0.85, 0.85)
    updateHitbox('city')
    setLuaSpriteScrollFactor(0.3, 0.3)

    makeLuaSprite('win0', 'prologue/win0', -10, 0)
    setLuaSpriteScrollFactor(0.3, 0.3)
    scaleLuaSprite('win0', 0.85, 0.85)
    updateHitbox('win0')

    makeLuaSprite('win1', 'prologue/win1', -10, 0)
    setLuaSpriteScrollFactor(0.3, 0.3)
    scaleLuaSprite('win1', 0.85, 0.85)
    updateHitbox('win1')

    makeLuaSprite('win2', 'prologue/win2', -10, 0)
    setLuaSpriteScrollFactor(0.3, 0.3)
    scaleLuaSprite('win2', 0.85, 0.85)
    updateHitbox('win2')

    makeLuaSprite('win3', 'prologue/win3', -10, 0)
    setLuaSpriteScrollFactor(0.3, 0.3)
    scaleLuaSprite('win3', 0.85, 0.85)
    updateHitbox('win3')

    makeLuaSprite('win4', 'prologue/win4', -10, 0)
    setLuaSpriteScrollFactor(0.3, 0.3)
    scaleLuaSprite('win4', 0.85, 0.85)
    updateHitbox('win4')

    makeLuaSprite('bgstreet', 'prologue/poll', -40, 50)
    addLuaSprite('bgstreet', false)
    setLuaSpriteScrollFactor(0.9, 0.9)

    makeLuaSprite('street', 'prologue/rooftop', -130, 50)
    addLuaSprite('street', false)
    setLuaSpriteScrollFactor(0.9, 0.9)
end

function onBeatHit()
    if curBeat % 4 == 0 then
        local roll = math.random(0, 5)

        if (roll == 0) then
            removeLuaSprite('win1', false)
            removeLuaSprite('win2', false)
            removeLuaSprite('win3', false)
            removeLuaSprite('win4', false)
            addLuaSprite('win0', false)

        elseif (roll == 1) then
            removeLuaSprite('win0', false)
            removeLuaSprite('win2', false)
            removeLuaSprite('win3', false)
            removeLuaSprite('win4', false)
            addLuaSprite('win1', false)

        elseif (roll == 2) then
            removeLuaSprite('win1', false)
            removeLuaSprite('win0', false)
            removeLuaSprite('win3', false)
            removeLuaSprite('win4', false)
            addLuaSprite('win2', false)

        elseif (roll == 3) then
            removeLuaSprite('win1', false)
            removeLuaSprite('win2', false)
            removeLuaSprite('win0', false)
            removeLuaSprite('win4', false)
            addLuaSprite('win3', false)

        elseif (roll == 4) then
            removeLuaSprite('win1', false)
            removeLuaSprite('win2', false)
            removeLuaSprite('win3', false)
            removeLuaSprite('win0', false)
            addLuaSprite('win4', false)
        end
    end
end
    