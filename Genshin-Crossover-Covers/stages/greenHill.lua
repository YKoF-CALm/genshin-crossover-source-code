function onCreate()
	-- background shit
	makeLuaSprite('greenHill', 'santiago/greenHill', -350, 0);
	setScrollFactor('greenHill', 1.0, 1.0);

	makeLuaSprite('mountains2', 'santiago/mountains2', -350, -100);
	setScrollFactor('mountains2', 0.5, 0.7);

	makeLuaSprite('mountainsNOwater', 'santiago/mountainsNOwater', -350, -100);
	setScrollFactor('mountainsNOwater', 0.8, 1.0);

	makeLuaSprite('filter', 'santiago/filter', -350, 0);
	setScrollFactor('filter', 1.0, 1.0);
	setBlendMode('filter', 'add');
	setProperty('filter.alpha', tonumber(0.13))


	makeLuaSprite('sky', 'santiago/sky', -350, 0);
	setScrollFactor('sky', 0.4, 1.0);

	makeAnimatedLuaSprite('mountainsWater','santiago/mountainsWater',-350, -100)addAnimationByPrefix('mountainsWater','mountainsWater','mountainsWater',24,true)
	objectPlayAnimation('mountainsWater','mountainsWater',false)
	setScrollFactor('mountainsWater', 0.6, 0.8);


	addLuaSprite('sky', false);
	addLuaSprite('mountains2', false);
	addLuaSprite('mountainsWater', false);
	addLuaSprite('greenHill', false);
	addLuaSprite('filter', true);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end