function onSongStart()
    setProperty("timeBar.color",getColorFromHex("92F194"))
end

function onCreate()
    setProperty('skipCountdown', true)

    doTweenAlpha('circInOut', 'camGame', 0, 0.0001, 'linear')
    doTweenAlpha('fadeInn', 'camHUD', 0, 0.0001, 'linear')

    makeLuaSprite('Arriba', 'empty', 0, -120)
	makeGraphic('Arriba', 1280, 120, '000000')
	setObjectCamera('Arriba', 'hud')
	addLuaSprite('Arriba', false)

	makeLuaSprite('Abajo', 'empty', 0, 720)
	makeGraphic('Abajo', 1280, 120, '000000')
	setObjectCamera('Abajo', 'hud')
	addLuaSprite('Abajo', false)

    setProperty('boyfriend.y', getProperty('boyfriend.y') + 75)
    setProperty('dad.x', getProperty('dad.x') - 100)
    setProperty('boyfriend.x', getProperty('boyfriend.x') - 100)
end

function onStepHit()
	if curStep == 5 then
		doTweenAlpha('circInOut', 'camGame', 1, 5, 'linear')
        doTweenAlpha('fadeInn', 'camHUD', 1, 5, 'linear')
    end
    if curStep == 112 then
        doTweenAlpha('circInOut', 'camGame', 0, 1.40, 'linear')
        doTweenAlpha('fadeInn', 'camHUD', 0, 1.40, 'linear')
	end
    if curStep == 128 then
        doTweenAlpha('circInOut', 'camGame', 1, 0.0001, 'linear')
        doTweenAlpha('fadeInn', 'camHUD', 1, 0.0001, 'linear')
	end
    if curStep == 256 then -- cinematic inicio
        doTweenY('Cinematics1', 'Arriba', 0, 0.0001, 'Linear')
        doTweenY('Cinematics2', 'Abajo', 600, 0.0001, 'Linear')
    end
    if curStep == 1808 then
        doTweenAlpha('camgameoff', 'camGame', 0, 0.000001, 'linear')
        doTweenAlpha('camhudoff', 'camHUD', 0, 0.000001, 'linear')
	end
end