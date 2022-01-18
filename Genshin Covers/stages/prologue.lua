function onCreate()
    makeLuaSprite('sky', 'rooftopsky', -100, -100)
    addLuaSprite('sky', false)
    setLuaSpriteScrollFactor(0.1, 0.1)

    makeLuaSprite('city', 'distantcity', -10, 0)
    addLuaSprite('city', false)
    setLuaSpriteScrollFactor(0.3, 0.3)

    makeLuaSprite('win0', 'win0', -10, 0)
    setLuaSpriteScrollFactor(0.3, 0.3)

    makeLuaSprite('win1', 'win1', -10, 0)
    setLuaSpriteScrollFactor(0.3, 0.3)

    makeLuaSprite('win2', 'win2', -10, 0)
    setLuaSpriteScrollFactor(0.3, 0.3)

    makeLuaSprite('win3', 'win3', -10, 0)
    setLuaSpriteScrollFactor(0.3, 0.3)

    makeLuaSprite('win4', 'win4', -10, 0)
    setLuaSpriteScrollFactor(0.3, 0.3)

    makeLuaSprite('bgstreet', 'poll', -40, 50)
    addLuaSprite('bgstreet', false)
    setLuaSpriteScrollFactor(0.9, 0.9)

    makeLuaSprite('street', 'rooftop', -130, 50)
    addLuaSprite('street', false)
    setLuaSpriteScrollFactor(0.9, 0.9)
end
--[[
function onBeatHit()

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

function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/60)
    for i=0,5 do
        addLuaSprite('win'..i, false)
    end
end
]]
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
    