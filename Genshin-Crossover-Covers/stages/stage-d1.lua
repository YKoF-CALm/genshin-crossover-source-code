function onCreate()
	makeLuaSprite('stageback', 'corruption/fcr/dadThing/stageback', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
    scaleObject('stageback', 1.3, 1.3)
	
	makeLuaSprite('stagefront', 'corruption/fcr/dadThing/stagefront', -650, 600);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);
    scaleObject('stagefront', 1.3, 1.3)

	makeLuaSprite('stagecurtains', 'corruption/fcr/dadThing/stagecurtains', -700, -300);
	setScrollFactor('stagecurtains', 1.3, 1.3);
	scaleObject('stagecurtains', 0.9, 0.9);
    scaleObject('stagecurtains', 1.3, 1.3)

    makeLuaSprite('stageoverlay', 'corruption/fcr/dadThing/stageoverlay', -400, -200)
    scaleObject('stageoverlay', 2, 2)
    setBlendMode('stageoverlay', 'multiply')
    --setProperty('stageoverlay.alpha', 0.8)

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagecurtains', true);
    addLuaSprite('stageoverlay', true)
	
	close(true);
end