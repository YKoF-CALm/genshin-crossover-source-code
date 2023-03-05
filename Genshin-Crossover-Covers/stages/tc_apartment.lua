function onCreate()
	-- background shit
	makeLuaSprite('tc_apartment', 'mutedmelodies/tc_apartment', -600, -300);
	setLuaSpriteScrollFactor('tc_apartment', 1, 1);


	makeLuaSprite('tc_plant_pot', 'mutedmelodies/tc_plant_pot', -600, -300);
	setLuaSpriteScrollFactor('tc_plant_pot', 1.1, 1.1);
	
	addLuaSprite('tc_apartment', false);
	scaleObject('tc_apartment', 0.7, 0.7);
	addLuaSprite('tc_plant_pot', true);
	scaleObject('tc_plant_pot', 0.7, 0.7);

end