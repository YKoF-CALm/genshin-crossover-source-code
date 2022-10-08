function onCreate()
	precacheImage('arrow');
	addCharacterToList('ayatoDTalt', 'dad');
	addCharacterToList('ayakaDTalt', 'bf');
	addCharacterToList('DTDeath', 'bf');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'DTDeath'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'DilemmaDeath'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'DilemmaGameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'DilemmaRetry'); --put in mods/music/
	setProperty('introSoundsSuffix', '-gar')
end

function onStepHit()
	if curStep == 15 then
		makeAnimatedLuaSprite('funnyarrow', 'garcello/arrow', 280, 70)
		addAnimationByPrefix('funnyarrow','loop','arrow loop','24',true)
		objectPlayAnimation('funnyarrow','loop',false)
		scaleObject('funnyarrow', 1, 1);

		addLuaSprite('funnyarrow', true);
	end

	if curStep == 31 then
		doTweenAlpha('byebye', 'funnyarrow', 0, 0.5, 'linear');
	end
end