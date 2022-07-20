function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'KnifeNote' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'nevada/notes/KnifeNote'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'KnifeNote' and difficulty == 2 then
		setProperty('health', getProperty('health')-0.5);
		playSound('hanknife', 0.7);
		playSound('hankded', 0.6);
	elseif noteType == 'KnifeNote' and difficulty == 1 then
		setProperty('health', getProperty('health')-0.5);
		playSound('hanknife', 0.7);
		playSound('hankded', 0.6);
		characterPlayAnim('boyfriend', 'hurt', true);
    end
end

local shootAnims = {"LEFTshoot", "DOWNshoot", "UPshoot", "RIGHTshoot"}
function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'KnifeNote' then
	    setProperty('health', getProperty('health') +0.0475);
		playSound('hanknife', 0.7);
		characterPlayAnim('dad', shootAnims[direction + 1], false);
		characterPlayAnim('boyfriend', 'dodgeUP', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		addMisses(-1)
		cameraShake('camGame', 0.01, 0.2)
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