function onCreate()
	-- background shit
	makeLuaSprite('sky', 'challeng-edd/SkyBox', -1790, -800);
	setScrollFactor('sky', 0.1, 0.5);
	
	makeLuaSprite('cloud', 'challeng-edd/Clouds', -2590, -500);
	setScrollFactor('cloud', 0.1, 0.3);
	setProperty('cloud.velocity.x', math.random(5, 15));
	
	makeLuaSprite('houses', 'challeng-edd/HousesAndFloor', -1790, -600);
	setScrollFactor('houses', 1, 1);
	
	if not lowQuality then
		makeLuaSprite('city', 'challeng-edd/SecondParalax', -1290, -500);
		setScrollFactor('city', 0.65, 0.65);
		scaleObject('city', 0.8, 0.8);

		makeLuaSprite('car', 'challeng-edd/Car', -1790, -600);
		setScrollFactor('car', 1.15, 1.15);
		
		makeLuaSprite('plane', 'challeng-edd/Plane', -890, 0);
		setScrollFactor('plane', 0.2, 0.6);
	end
	
	makeLuaSprite('fence', 'challeng-edd/Fence', -1790, -600);
	setScrollFactor('fence', 1, 1);

	addLuaSprite('sky', false); --bg
	addLuaSprite('cloud', false);
	addLuaSprite('plane', false);
	addLuaSprite('city', false);
	addLuaSprite('houses', false);
	addLuaSprite('fence', false); --fence lol
	
	addLuaSprite('car', true);
end