function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'stageback', -200, -300);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('stagefront', 'stagefront', -500, 600);
	setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.2, 1.2);

	makeLuaSprite('stagelight_left', 'stage_light', 100, -200);
	setLuaSpriteScrollFactor('stagelight_left', 0.9, 0.9);
	scaleObject('stagelight_left', 1.3, 1.3);
		
	makeLuaSprite('stagelight_right', 'stage_light', 1525, -200);
	setLuaSpriteScrollFactor('stagelight_right', 0.9, 0.9);
	scaleObject('stagelight_right', 1.3, 1.3);
	setPropertyLuaSprite('stagelight_right', 'flipX', true); --mirror sprite horizontally

	makeLuaSprite('stagecurtains', 'stagecurtains', -500, -400);

	scaleObject('stagecurtains', 1.2, 1.2);

    makeLuaSprite('vignette', 'corruption/takeover/dmproject/vignette', 0, 0)
    setObjectCamera('vignette', 'hud')
	

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);
    addLuaSprite('vignette', true)

    makeAnimatedLuaSprite('eyes', 'corruption/takeover/dmproject/eyes', 50, -120)
    scaleObject('eyes', 1.6, 1.6)
	
	makeAnimatedLuaSprite('TheWorld', 'corruption/takeover/dmproject/TheWorldKids', 50, -120);
	scaleObject('TheWorld', 1.6, 1.6);

	makeLuaSprite('stageback2', 'corruption/takeover/dmproject/stagewall', -500, -300);
	scaleObject('stageback2', 0.9, 0.8);

	makeLuaSprite('stagefront2', 'corruption/takeover/dmproject/stage', -650, 600);
	scaleObject('stagefront2', 1.0, 1.0);

    makeLuaSprite('mics', 'corruption/takeover/dmproject/mics', 500, 600)
	
	makeAnimatedLuaSprite('stagepeople', 'corruption/takeover/dmproject/stagepeople',  -100,200);
	scaleObject('stagepeople', 1.7, 1.7);

	makeLuaSprite('stagelight_left2', 'corruption/takeover/dmproject/stage_lightpast', 125, -150);

	scaleObject('stagelight_left2', 1.3, 1.3);
		
	makeLuaSprite('stagelight_right2', 'corruption/takeover/dmproject/stage_lightpast', 1825, -150);

	scaleObject('stagelight_right2', 1.3, 1.3);
	setPropertyLuaSprite('stagelight_right2', 'flipX', true); --mirror sprite horizontally

	makeLuaSprite('stagecurtains2', 'corruption/takeover/dmproject/curtains', -500, -400);

	scaleObject('stagecurtains2', 0.9, 0.9);
	
	makeAnimatedLuaSprite('frontpeople', 'corruption/takeover/dmproject/frontpeople',  -500,700);
	scaleObject('frontpeople', 1.4, 1.3);
	setLuaSpriteScrollFactor('frontpeople', 0.9, 0.9);

    addLuaSprite('eyes', false)
    addAnimationByPrefix('eyes', 'idle', 'worldeyes', 24, true)
	addLuaSprite('TheWorld', false);
	addAnimationByPrefix('TheWorld', 'idle', 'Eyes', 24, true);
	addLuaSprite('stageback2', false);
	addLuaSprite('stagefront2', false);
    addLuaSprite('mics', false)
	addLuaSprite('stagepeople', false);
	addAnimationByPrefix('stagepeople', 'idle', 'people stage', 24, true);
	addLuaSprite('stagelight_left2', false);
	addLuaSprite('stagelight_right2', false);
	addLuaSprite('stagecurtains2', false);
	addLuaSprite('frontpeople', true);
	addAnimationByPrefix('frontpeople', 'idle', 'people front', 24, true);
    setProperty('eyes.visible', false);
	setProperty('TheWorld.visible', false);
	setProperty('stageback2.visible', false);
	setProperty('stagefront2.visible', false);
    setProperty('mics.visible', false);
	setProperty('stagepeople.visible', false);
	setProperty('stagelight_left2.visible', false);
	setProperty('stagelight_right2.visible', false);
	setProperty('frontpeople.visible', false);
	setProperty('stagecurtains2.visible', false);
end