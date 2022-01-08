function onCreate()
	makeLuaSprite('bg', 'sky', -1204, -456)
	addLuaSprite('bg', false)
	setLuaSpriteScrollFactor('bg', 0.15, 0.15);

	makeLuaSprite('clouds', 'clouds', -988, -260)
	addLuaSprite('clouds', false)
	setLuaSpriteScrollFactor('clouds', 0.25, 0.25);

	makeLuaSprite('mount', 'backmount', -700, -40)
	addLuaSprite('mount', false)
	setLuaSpriteScrollFactor('mount', 0.4, 0.4);

	makeLuaSprite('mount2', 'middlemount', -240, 200)
	addLuaSprite('mount2', false)
	setLuaSpriteScrollFactor('mount2', 0.6, 0.6);

	makeLuaSprite('ground', 'ground', -660, 624)
	addLuaSprite('ground', false)
	setLuaSpriteScrollFactor('ground', 1, 1);
	close(true)
end