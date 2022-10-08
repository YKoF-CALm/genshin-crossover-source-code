local t = 0
local s = 0
function onCreate()

    makeAnimatedLuaSprite('plasticShit', 'exe/fwf/NewTitleMenuBG', 0, -400)
    addAnimationByPrefix('plasticShit', 'ImGonnaDie', 'TitleMenuSSBG instance 1', 24, true)
    setGraphicSize('plasticShit', getProperty('plasticShit.width') * 4.5)
    setProperty('plasticShit.visible', true)
    addLuaSprite('plasticShit', false)

    makeLuaSprite('bg', 'exe/fwf/sonicFUNsky', -621, -365)
    addLuaSprite('bg', false)
    setGraphicSize('bg', getProperty('bg.width') * 1.2)

    makeLuaSprite('trees1', 'exe/fwf/Trees3', -607, -301)
    addLuaSprite('trees1')
    setScrollFactor('trees1', 0.95, 1)
    setGraphicSize('trees1', getProperty('trees1.width') * 1.2)

    makeLuaSprite('trees2', 'exe/fwf/Trees2', -623, -410)
    setGraphicSize('trees2', getProperty('trees2.width') * 1.2)
    addLuaSprite('trees2', false)

    makeLuaSprite('grass', 'exe/fwf/Grass2', -630, -466)
    addLuaSprite('grass', false)
    setGraphicSize('grass', getProperty('grass.width') * 1.2)

    makeAnimatedLuaSprite('static', 'exe/fwf/Phase3Static', 0, 0)
    addAnimationByPrefix('static', 'flash', 'Phase3Static instance 1', 24, false)
    setGraphicSize('static', getProperty('static.width') * 4)
    setProperty('static.alpha', 0.3)
    setProperty('static.visible', false)
    addLuaSprite('static', true)
    setObjectCamera('static', 'other')
end

function onCreatePost()
    setProperty('gf.alpha', 0)
end

function onSongStart()
	setProperty('static.visible', true)
end

function onUpdate(elapsed)
    health = getProperty('health')
    if health < 0.02 then
	setProperty('deathsentence.visible', true)
    end

    if getProperty('static.animation.curAnim.finished') and getProperty('static.animation.curAnim.name') == 'flash' then
        setProperty('static.alpha', 0)
    else
        setProperty('static.alpha', 0.7)
    end
end