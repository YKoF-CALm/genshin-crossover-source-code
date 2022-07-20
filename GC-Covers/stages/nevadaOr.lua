--Last Edited 10/12/21 by SaturnSpades
--Tricky mod credits will be put here temporarily until in-game credits can be modified within Lua
--Tricky Mod Developers: Banbuds, Rosebud, KadeDev, CVal, YingYang48, JADS, Moro
--Special Thanks: Tom Fulp, Krinkels, GWebDev, Tsuraran
function onCreate()
	--Create Background sprites
	makeLuaSprite('red', 'tricky/red', -350, -300)
	addLuaSprite('red', false)
	setScrollFactor('red', 0.9, 0.9)

	makeLuaSprite('island', 'tricky/island_but_rocks_float', -1100, -460)
	addLuaSprite('island', false)
	setScrollFactor('island', 0.9, 0.9)
	scaleLuaSprite('island', 1.4, 1.4)
	updateHitbox('island')

	makeLuaSprite('hue', 'tricky/hue', -470, -150)
	setProperty('hue.alpha', 0.7)
	setScrollFactor('hue', 1.2, 1.2)
	scaleLuaSprite('hue', 0.9, 0.9)
	updateHitbox('hue')
	addLuaSprite('hue', false)

	if not lowQuality then
		--Low Quality mode not yet implemented
	end
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end