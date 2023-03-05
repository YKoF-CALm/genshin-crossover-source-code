function onCreate()
	makeLuaSprite('toyFactory','huggy/factory',-500,-330)
	addLuaSprite('toyFactory',false)
	setLuaSpriteScrollFactor('toyFactory', 0.9, 0.9);

	makeLuaSprite('theShadow','huggy/shadow',-500,-100)
	addLuaSprite('theShadow',true)
	setLuaSpriteScrollFactor('theShadow', 0.5, 0.5);
end
