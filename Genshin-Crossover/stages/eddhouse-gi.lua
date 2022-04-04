function onCreate()
	precacheImage('characters/DEdd')
	precacheImage('characters/Eula')
	precacheImage('characters/BFabuse')
	precacheImage('characters/bf-mad')
	precacheImage('characters/TankmanCaptian')
	precacheImage('characters/pico-uber')
	addCharacterToList('amber-player-alt', 'boyfriend')
	addCharacterToList('eulaside', 'dad')
	addCharacterToList('gfspeakerstickman', 'gf')
	makeAnimationList();
	setCharacterX('boyfriend', 960)
	setCharacterY('boyfriend', 190)
	setCharacterX('dad', 145)
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

		makeAnimatedLuaSprite('bf', 'characters/BOYFRIEND', 1310, 400)
		addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
		setScrollFactor('bf', 1, 1);

		makeAnimatedLuaSprite('bf2', 'characters/BFabuse', 1310, 400)
		addAnimationByPrefix('bf2', 'reaction', 'BF wactch gf', 24, false)
		setScrollFactor('bf2', 1, 1);

		makeAnimatedLuaSprite('bf3', 'characters/bf-mad', 1310, 400)
		addAnimationByPrefix('bf3', 'idle', 'BF idle dance', 24, false)
		setScrollFactor('bf3', 1, 1);

		makeAnimatedLuaSprite('pico', 'characters/Pico_FNF_assetss', -260, 355)
		addAnimationByPrefix('pico', 'idle', 'Pico Idle Dance', 24, false)
		setScrollFactor('pico', 1, 1);
		setProperty('pico.flipX', true)

		makeAnimatedLuaSprite('pico2', 'characters/pico-uber', -405, 250)
		addAnimationByIndices('pico2', 'reaction', 'PicoStartUp', '0, 1, 2, 3', 24)
		addAnimationByPrefix('pico2', 'reaction2', 'PicoStartUp', 24, false)
		setScrollFactor('pico2', 1, 1);

		makeAnimatedLuaSprite('pico4', 'characters/pico-uber', -405, 250)
		addAnimationByPrefix('pico4', 'reaction', 'PicoStartUp', 24, false)
		setScrollFactor('pico4', 1, 1);

		makeAnimatedLuaSprite('pico3', 'characters/pico-uber', -260, 355)
		addAnimationByPrefix('pico3', 'idle', 'Pico Idle Dance0', 24, false)
		setScrollFactor('pico3', 1, 1);

		makeLuaSprite('car', 'challeng-edd/Car', -1790, -600);
		setScrollFactor('car', 1.15, 1.15);
		
		makeLuaSprite('plane', 'challeng-edd/Plane', -890, 0);
		setScrollFactor('plane', 0.2, 0.6);
	end
	
	makeLuaSprite('fence', 'challeng-edd/Fence', -1790, -600);
	setScrollFactor('fence', 1, 1);

	makeAnimatedLuaSprite('tankman', 'characters/TankmanCaptian', -1080, 125)
	addAnimationByPrefix('tankman', 'idle', 'Tankman Idle Dance instance 1', 24, false)
	addAnimationByPrefix('tankman', 'singLEFT', 'Tankman Right Note instance 1', 24, false)
	addAnimationByPrefix('tankman', 'singDOWN', 'Tankman DOWN note instance 1', 24, false)
	addAnimationByPrefix('tankman', 'singUP', 'Tankman UP note instance 1', 24, false)
	addAnimationByPrefix('tankman', 'singRIGHT', 'Tankman Note Left instance 1', 24, false)
	addAnimationByPrefix('tankman', 'well', 'PRETTY GOOD tankman instance 1', 24, false)
	setScrollFactor('tankman', 1, 1);
	setProperty('tankman.alpha', 0);
	setProperty('tankman.flipX', true)

	addLuaSprite('sky', false); --bg
	addLuaSprite('cloud', false);
	addLuaSprite('plane', false);
	addLuaSprite('city', false);
	addLuaSprite('houses', false);
	addLuaSprite('doorOpen', false);

	addLuaSprite('tankman', false)
	addLuaSprite('fence', false); --fence lol
	
	addLuaSprite('pico', false)
	addLuaSprite('bf', false)
	
	addLuaSprite('car', true);
end

function onStepHit()
	if curStep == 144 then -- tord plane comin
		doTweenX('PlaneTweenX', 'plane', 1600, 25);
	end
	if curStep == 928 then -- well
		objectPlayAnimation('tankman', 'well', true)
		doTweenAlpha('SkyTweenAlpha', 'sky', 0.9, 0.2);
		doTweenZoom('ZoominToNeighbours', 'camGame', 0.75, 0.2);
	end
	if curStep == 932 then -- well
		objectPlayAnimation('tankman', 'well', true)
		doTweenAlpha('SkyTweenAlpha2', 'sky', 0.8, 0.2);
		doTweenZoom('ZoominToNeighbours2', 'camGame', 0.8, 0.2);
	end
	if curStep == 936 then -- well
		objectPlayAnimation('tankman', 'well', true)
		doTweenAlpha('SkyTweenAlpha3', 'sky', 0.7, 0.2);
		doTweenZoom('ZoominToNeighbours3', 'camGame', 0.9, 0.2);
		runTimer('SkyToNormal', 1, 1)
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'SkyToNormal' then
				doTweenAlpha('SkyTweenAlpha4', 'sky', 1, 2);
			end
		end
	end
	if curStep == 940 then
		removeLuaSprite('bf2', false)
		addLuaSprite('bf3', false)
	end
	if curStep == 953 then
		removeLuaSprite('pico4', false)
		addLuaSprite('pico3', false)
	end
	if curStep == 1584 then -- but i didnt even said anything
		objectPlayAnimation('tankman', 'well', true)
	end
end -- hello im serdzhant

function onBeatHit()
	if curBeat % 2 == 0 and curStep < 912 then
		objectPlayAnimation('pico', 'idle', true);
		objectPlayAnimation('bf', 'idle', true);
	end
	if curBeat == 228 then
		removeLuaSprite('bf', false)
		addLuaSprite('bf2', false)
		removeLuaSprite('pico', false)
		addLuaSprite('pico2', false)
		objectPlayAnimation('bf2', 'reaction', true);
		objectPlayAnimation('pico2', 'reaction', true);
		setProperty('tankman.alpha', 1);
	end
	if curBeat == 235 then
		removeLuaSprite('pico2', false)
		addLuaSprite('pico4', false)
		objectPlayAnimation('pico4', 'reaction', true)
	end
	if curBeat % 2 == 0 and curStep > 940 then
		objectPlayAnimation('bf3', 'idle', true)
		if curStep > 952 then
			objectPlayAnimation('pico3', 'idle', true);
		end
		if curStep < 1584 then
			objectPlayAnimation('tankman', 'idle', true)
		end
	end
end
--eduardo shit
--script by Shadow Mario, Kevin Kuntz and other dudos
animationsList = {}
holdTimers = {tankman = 0};
noteDatas = {tankman = 0};
function makeAnimationList()
	animationsList[0] = 'singLEFT';
	animationsList[1] = 'singDOWN';
	animationsList[2] = 'singUP';
	animationsList[3] = 'singRIGHT';
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if boyfriendName == 'amber-player' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf');
	end
	if noteType == 'Opponent Sing' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'edd-dead');
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Special Sing' then
		if not isSustainNote then
			noteDatas.tankman = direction;
		end	
		characterToPlay = 'tankman'
		animToPlay = noteDatas.tankman;
			
		playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	if getProperty('tankman.animation.curAnim.name') == 'singDOWN' then
		setProperty('tankman.x', -1169)
		setProperty('tankman.y', 223)
	elseif getProperty('tankman.animation.curAnim.name') == 'singLEFT' then
		setProperty('tankman.x', -1172)
		setProperty('tankman.y', 135)
	elseif getProperty('tankman.animation.curAnim.name') == 'singRIGHT' then
		setProperty('tankman.x', -1066)
		setProperty('tankman.y', 151)
	elseif getProperty('tankman.animation.curAnim.name') == 'singUP' then
		setProperty('tankman.x', -1118)
		setProperty('tankman.y', 75)
	elseif getProperty('tankman.animation.curAnim.name') == 'idle' then
		setProperty('tankman.x', -1080)
		setProperty('tankman.y', 125)
	end
end

function playAnimation(character, animId, forced)
	animName = animationsList[animId];
	if character == 'tankman' then
		objectPlayAnimation('tankman', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	end
end
--eduardo shit ends

function onTweenCompleted(tag)
	if tag == 'PlaneTweenX' then
		removeLuaSprite('plane', true); -- optimization
	end
end