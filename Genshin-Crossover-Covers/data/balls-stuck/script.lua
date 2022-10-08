local dadx = 0

function onCreate()
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 40)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 70)
    setProperty('dad.x', getProperty('dad.x') - 230)
    setProperty('gf.visible', false)
    setProperty('explode.alpha',0)
    setObjectOrder('gfGroup', getObjectOrder('dadGroup') + 1)
    setObjectOrder('boyfriendGroup', getObjectOrder('gfGroup') + 1)
    setProperty('gf.x', getProperty('gf.x') - 200)
    setProperty('gf.y', getProperty('gf.y') - 100)
    dadx = getProperty('dad.x')

	makeLuaSprite('card', 'doorstuck/nothing', -400, 250);
	setObjectCamera('card', 'hud');
	addLuaSprite('card');
	scaleObject('card', 0.7, 0.7);

	makeLuaText('songname', 'Song: Balls Stuck', '500', -462, 262);
	setTextSize('songname', 24);
	setObjectCamera('songname', 'hud');
	setTextColor('songname', 'A4A4A4');
	setTextFont('songname', 'stratum2-medium-webfont.ttf');
	setTextBorder('songname', '0','A4A4A4');
	addLuaText('songname');

	makeLuaText('desc', 'Song by: Tsuraran', '500', -517, 320);
	setTextSize('desc', 24);
	setObjectCamera('desc', 'hud');
	setTextColor('desc', 'A4A4A4');
	setTextFont('desc', 'stratum2-medium-webfont.ttf');
	setTextBorder('desc', '0','A4A4A4');
	addLuaText('desc');

    makeLuaSprite('pillar', 'genshin/RISE', getProperty('gf.x') - 180, getProperty('gf.y') - 500)
    scaleObject('pillar', 1.5, 1.5)
    updateHitbox('pillar')
    addLuaSprite('pillar', true)
    setObjectOrder('boyfriendGroup', getObjectOrder('pillar') + 1)
end

function onUpdate(elapsed)
    if dadName == 'tsumixangry' then
        setProperty('dad.x', dadx + 70)
    else
        setProperty('dad.x', dadx)
    end
end

function onCountdownTick(counter)
	if counter == 0 then
		doTweenX('card','card', '0', 1, 'expoInOut')
		doTweenX('name','songname', '-92', 1, 'expoInOut')
		doTweenX('line1','desc', '-130', 1, 'expoInOut')
		runTimer('cardback', 4)
	end
end

function onTweenCompleted(tag)
	if tag == 'dawg' then
		removeLuaSprite('dawg', true);
		removeLuaText('desc', true);
		removeLuaText('songname', true);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'aaargh' then		
		triggerEvent('Screen Shake', '0.7, 0.006', '0.7, 0.006')
	end

	if tag == 'cardback' then
		doTweenX('dawg','card', '-400', 1, 'expoInOut')
		doTweenX('andnamowashisnamo','songname', '-462', 1, 'expoInOut')
		doTweenX('lineo1','desc', '-517', 1, 'expoInOut')
	end
end
