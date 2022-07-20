function onCreate()
	makeLuaSprite('bg', 'shaggy/sky', -1204, -456)
	addLuaSprite('bg', false)
	setLuaSpriteScrollFactor('bg', 0.15, 0.15);

	makeLuaSprite('clouds', 'shaggy/clouds', -988, -260)
	addLuaSprite('clouds', false)
	setLuaSpriteScrollFactor('clouds', 0.25, 0.25);

	makeLuaSprite('mount', 'shaggy/backmount', -700, -40)
	addLuaSprite('mount', false)
	setLuaSpriteScrollFactor('mount', 0.4, 0.4);

	makeLuaSprite('mount2', 'shaggy/middlemount', -240, 200)
	addLuaSprite('mount2', false)
	setLuaSpriteScrollFactor('mount2', 0.6, 0.6);

	makeLuaSprite('ground', 'shaggy/ground', -660, 624)
	addLuaSprite('ground', false)
	setLuaSpriteScrollFactor('ground', 1, 1);
	close(true)
end