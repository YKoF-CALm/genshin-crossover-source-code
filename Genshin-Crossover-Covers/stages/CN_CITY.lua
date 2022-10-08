function onCreate()
	-- background shit
	
	makeLuaSprite('CN_CITY', 'roasted/CN_CITY', -600, -280);
	setLuaSpriteScrollFactor('CN_CITY', 0.9, 0.9);
	
	makeLuaSprite('CN_CITY', 'roasted/CN_CITY', -550, -280);
	setLuaSpriteScrollFactor('CN_CITY', 0.9, 0.9);
	scaleObject('CN_CITY', 1.0, 1.0);

	addLuaSprite('CN_CITY', false);
	addLuaSprite('CN_CITY', false);

	makeAnimatedLuaSprite('foreground','roasted/FG', -300, 1100);
	addAnimationByPrefix('foreground','foreground','foreground',12,false)
	addLuaSprite('foreground', true)

	makeAnimatedLuaSprite('background','roasted/BG', -500, 715);
	addAnimationByPrefix('background','background','background',12,false)
	addLuaSprite('background', false)
	scaleObject('background', 1.2, 1.2)
    updateHitbox('background')
	
	makeLuaSprite('annoying', 'roasted/annoying', 940, 0);
	addLuaSprite('annoying',true)
	setLuaSpriteScrollFactor('annoying', 0.0, 0.0);
	scaleObject('annoying', 0.3, 0.3)

	makeLuaSprite('watermark', 'roasted/watermark', 1100, 600);
	addLuaSprite('watermark',true)
	setLuaSpriteScrollFactor('watermark', 0.0, 0.0);
	scaleObject('watermark', 0.7, 0.7)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('foreground','foreground', true)
        objectPlayAnimation('background','background', true)
    end
end