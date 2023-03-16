function onCreate()
    precacheImage('genshin/snowfall')
    precacheImage('crossed-out/Final_Base')
    precacheImage('crossed-out/Final_Stars1')
    precacheImage('crossed-out/Final_Stars2')
    precacheImage('crossed-out/Final_Stars3')
    precacheImage('crossed-out/Final_Stars4')

    makeLuaSprite('snow', 'genshin/snowfall', -1200, -1700)
    setScrollFactor('snow', 0.8, 0.9)
    addLuaSprite('snow', true)
    setProperty('snow.visible', false)

    makeLuaSprite('white', '', 0, 0)
    makeGraphic('white', screenWidth, screenHeight, 'FFFFFF')
    setProperty('white,alpha', 0)
    addLuaSprite('white', false)
    setObjectCamera('white', 'hud')
end

function onBeatHit()
    if curBeat == 72 then
        cameraFlash('hud', 'FFFFFF', 0.8, true)
    end

    if curBeat == 166 or curBeat == 302 then
        doTweenAlpha('come', 'white', 1, 0.8, 'quadIn')
    end

    if curBeat == 168 then
        cameraFlash('hud', 'FFFFFF', 0.8, true)
        cancelTween('come')
        setProperty('white.alpha', 0)
        setProperty('liyue.alpha', 0)
        setProperty('boyfriend.alpha', 0)
        setProperty('dad.alpha', 0)
        setProperty('gf.alpha', 0)
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
    end

    if curBeat == 184 then
        doTweenAlpha('Final_Stars1', 'Final_Stars1', 1, 0.8,'quartIn')
        doTweenAlpha('Final_Stars2', 'Final_Stars2', 1, 0.8,'quartIn')
        doTweenAlpha('Final_Stars3', 'Final_Stars3', 1, 0.8,'quartIn')
        doTweenAlpha('Final_Stars4', 'Final_Stars4', 1, 0.8,'quartIn')
        doTweenAlpha('Final_Base2', 'Final_Base2', 1, 0.8,'quartIn')
        doTweenAlpha('Final_Base1', 'Final_Base1', 1, 0.8,'quartIn')
        doTweenAlpha('Final_Stars5', 'Final_Stars5', 1, 0.8,'quartIn')
        doTweenAlpha('Final_Stars6', 'Final_Stars6', 1, 0.8,'quartIn')
    end

    if curBeat == 200 then
        doTweenAlpha('hi', 'boyfriend', 0.5, 0.5, 'quartIn')
        doTweenAlpha('hi2', 'dad', 0.5, 0.5, 'quartIn')
        doTweenAlpha('hi3', 'iconP1', 0.5, 0.5, 'quartIn')
        doTweenAlpha('hi4', 'iconP2', 0.5, 0.5, 'quartIn')
    end

    if curBeat == 232 then
        setProperty('boyfriend.alpha', 0)
        setProperty('dad.alpha', 0)
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
        removeLuaSprite('Final_Base1')
        removeLuaSprite('Final_Base2')
        removeLuaSprite('Final_Stars1')
        removeLuaSprite('Final_Stars2')
        removeLuaSprite('Final_Stars3')
        removeLuaSprite('Final_Stars4')
        removeLuaSprite('Final_Stars5')
        removeLuaSprite('Final_Stars6')
    end

    if curBeat == 240 then
        cameraFlash('hud', 'FFFFFF', 0.8, true)
        setProperty('snow.visible', true)
        setProperty('liyue.alpha', 1)
        setProperty('boyfriend.alpha', 1)
        setProperty('dad.alpha', 1)
        setProperty('gf.alpha', 1)
        setProperty('iconP1.alpha', 1)
        setProperty('iconP2.alpha', 1)
    end

    if curBeat == 304 then
        cameraFlash('hud', 'FFFFFF', 0.8, true)
        cancelTween('come')
        removeLuaSprite('snow')
    end
end

function onUpdate(elapsed)
	setProperty('snow.y',getProperty('snow.y') + 1)
	if getProperty('snow.y') >= 0 then
		setProperty('snow.y', -297)
	end
end