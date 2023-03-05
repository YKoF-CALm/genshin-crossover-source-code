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

    makeLuaSprite('stageoverlay', 'corruption/fcr/dadThing/stageoverlay', 0, 0)
    setObjectCamera('stageoverlay', 'hud')
    setBlendMode('stageoverlay', 'add')

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagecurtains', true);
    addLuaSprite('stageoverlay', false)
	
	close(true);
end