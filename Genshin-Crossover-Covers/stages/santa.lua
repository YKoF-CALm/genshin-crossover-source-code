function onCreate()
	makeLuaSprite('BG', 'holiday/santa/BG', -203, -309);
	setLuaSpriteScrollFactor('BG', 0.9, 0.9);
	addLuaSprite('BG', false);

	makeLuaSprite('eyes', 'holiday/santa/eyes', 400, 204);
	setLuaSpriteScrollFactor('eyes', 0.9, 0.9);
	addLuaSprite('eyes', false);
	setProperty('eyes.alpha', 0);
end

