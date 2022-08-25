local shootAnims = {"LEFTshoot", "DOWNshoot", "UPshoot", "RIGHTshoot", 'dodgeLEFT', 'dodgeDOWN', 'dodgeUP', 'dodgeRIGHT'}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note' then
		playSound('yoimiyashoot', 1);
		characterPlayAnim('dad', shootAnims[direction + 1], false);
		characterPlayAnim('boyfriend', shootAnims[direction+5], true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note' and difficulty == 2 then
		setProperty('health', -1);
		playSound('yoimiyashoot', 1);
	elseif noteType == 'Bullet_Note' and difficulty <= 1 then
		setProperty('health', getProperty('health')-0.8);
		runTimer('bleed', 0.2, 20);
		playSound('yoimiyashoot', 1);
		playSound('hankded', 0.6);
		characterPlayAnim('boyfriend', 'hurt', true);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.001);
	end
end