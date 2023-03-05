function onCreate()
    precacheImage('entity/sol/BG_Sol_1')
    precacheImage('entity/sol/BG_Sol_2')
    precacheImage('entity/sol/BG_Sol_3')
    precacheImage('entity/sol/BG_Sol_Limo')
    precacheImage('challeng-edd/SkyBox')
    precacheImage('challeng-edd/Clouds')
    precacheImage('challeng-edd/HousesandFloor')
    precacheImage('challeng-edd/SecondParalax')
    precacheImage('challeng-edd/Car')
    precacheImage('challeng-edd/Plane')
    precacheImage('challeng-edd/Fence')
    precacheImage('characters/BOYFRIEND_TABI')
    precacheImage('characters/ei')
    --exe shit
    makeLuaSprite('blackscreen', 'exe/blackscreen', 0, 0);
	setObjectCamera('blackscreen', 'hud');
    makeLuaSprite('circle', 'exe/StartScreens/CircleYouCantRun', 777, 0);
	setObjectCamera('circle', 'hud');
    makeLuaSprite('text', 'exe/StartScreens/TextYouCantRun', -1100, 0);
	setObjectCamera('text', 'hud');
    makeLuaSprite('vg', 'exe/RedVG', 0, 0)
    setObjectCamera('vg', 'other')
    setProperty('vg.alpha', 0)
    addLuaSprite('vg', true)
    --city shit
    makeLuaSprite('sky', 'entity/sol/BG_Sol_1', -1000, -425);
	makeLuaSprite('bgCity', 'entity/sol/BG_Sol_2', -1000, -425);
	makeLuaSprite('ground', 'entity/sol/BG_Sol_3', -1000, -425);
	makeLuaSprite('limo', 'entity/sol/BG_Sol_Limo', 0, 300);
    setScrollFactor('sky', 0.4, 0.4);
	setScrollFactor('bgCity', 0.7, 0.7);
    setProperty("limo.scale.x", 1.65);
	setProperty("limo.scale.y", 1.65);
    --challeng-edd shit
    makeLuaSprite('sky2', 'challeng-edd/SkyBox', -1790, -800);
	setScrollFactor('sky', 0.1, 0.5);
	makeLuaSprite('cloud', 'challeng-edd/Clouds', -2590, -500);
	setScrollFactor('cloud', 0.1, 0.3);
	setProperty('cloud.velocity.x', math.random(5, 15));
	makeLuaSprite('houses', 'challeng-edd/HousesAndFloor', -1790, -600);
	setScrollFactor('houses', 1, 1);
    makeLuaSprite('city', 'challeng-edd/SecondParalax', -1290, -500);
	setScrollFactor('city', 0.65, 0.65);
	scaleObject('city', 0.8, 0.8);
    makeLuaSprite('car', 'challeng-edd/Car', -1790, -600);
	setScrollFactor('car', 1.15, 1.15);
	makeLuaSprite('plane', 'challeng-edd/Plane', -890, 0);
	setScrollFactor('plane', 0.2, 0.6);
    makeLuaSprite('fence', 'challeng-edd/Fence', -1790, -600);
	setScrollFactor('fence', 1, 1);
    makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND_TABI', 1450, 450)
    addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
    setProperty('bf.scale.x', 0.8)
    setProperty('bf.scale.y', 0.8)
    makeAnimatedLuaSprite('ei', 'characters/ei', 1040, -80)
    addAnimationByPrefix('ei', 'idle', 'ei idle', 24, false)
    setProperty('ei.flipX', true)
    setProperty('ei.scale.x', 0.8)
    setProperty('ei.scale.y', 0.8)
    setProperty('introSoundsSuffix', '-blank')
end

local allowCountdown = false

function onStartCountdown()
	if not allowCountdown then
		runTimer('startText', 0.1);
		allowCountdown = true;
		startCountdown();
		return Function_Stop;
	end
	return Function_Continue;
end

function onBeatHit()
    if curBeat < 20 or (curBeat >= 132 and curBeat < 196) then
        setProperty('vg.alpha', 0)
        cancelTween('hi')
        cancelTween('bye')
    end
    if curBeat == 20 or curBeat == 196 then
        doTweenAlpha('hi', 'vg', '1', 1, 'linear')
    end
    if curBeat % 2 == 0 then
        objectPlayAnimation('bf', 'idle', true)
        objectPlayAnimation('ei', 'idle', true)
    end
    if curBeat == 132 then
        removeLuaSprite('red', false)
        removeLuaSprite('island', false)
        removeLuaSprite('hue', false)
	    addLuaSprite('sky', false);
		addLuaSprite('bgCity', false);
	    addLuaSprite('ground', false);
	    addLuaSprite('limo', false);
        setProperty('defaultCamZoom', 0.6)
        setProperty('boyfriend.x', 1100)
        setProperty('boyfriend.y', 600)
        setProperty('dad.x', -360)
        setProperty('dad.y', 600)
        cameraSetTarget('dad')
    end
    if curBeat == 196 then
        removeLuaSprite('sky', false)
        removeLuaSprite('bgCity', false)
        removeLuaSprite('ground', false)
        removeLuaSprite('limo', false)
        addLuaSprite('sky', false);
	    addLuaSprite('cloud', false);
	    addLuaSprite('plane', false);
	    addLuaSprite('city', false);
	    addLuaSprite('houses', false);
	    addLuaSprite('doorOpen', false);
        addLuaSprite('fence', false);
        addLuaSprite('car', true);
        addLuaSprite('ei', false)
        addLuaSprite('bf', false)
        setProperty('defaultCamZoom', 0.7)
        setProperty('boyfriend.x', 750)
        setProperty('boyfriend.y', 15)
        setProperty('dad.x', -95)
        setProperty('dad.y', 20)
        cameraSetTarget('dad')
    end
end

function onTweenCompleted(tag)
    if tag == 'hi' then
        doTweenAlpha('bye', 'vg', '0', 1, 'linear')
    end
    if tag == 'bye' then
        doTweenAlpha('hi', 'vg', '1', 1, 'linear')
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startText' then
		addLuaSprite('blackscreen', true);
		addLuaSprite('circle', true);
		addLuaSprite('text', true);
		runTimer('appear', 0.6, 1);
		runTimer('fadeout', 1.9, 1);
    end
	if tag == 'appear' then
		doTweenX('circletween', 'circle', 0, 0.5, 'linear');
		doTweenX('texttween', 'text', 0, 0.5, 'linear');
    end
	if tag == 'fadeout' then
		doTweenAlpha('circlefade', 'circle', 0, 1, 'linear');
		doTweenAlpha('textfade', 'text', 0, 1, 'linear');
		doTweenAlpha('blackfade', 'blackscreen', 0, 1, 'linear');
	end
end