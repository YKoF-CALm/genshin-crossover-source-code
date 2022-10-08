function onCreate()
	makeLuaCharacter('dad1', 'kaguya', false, false)
	setObjectOrder('dad1', getObjectOrder('dad') - 1)
	setProperty('dad1.x', getProperty('dad1.x') + 200)
	setObjectOrder('dad1', getObjectOrder('dad') - 1)

	changeIcon('dad', 'kaguya')
	makeHealthIcon('dadIcon1', 'bendy-da', false)
    setObjectOrder('dadIcon1', getObjectOrder('iconP2') + 1)

	setProperty('iconP2.y', getProperty('iconP2.y') + 30)  
	setProperty('opponentIconScale', 1.05)
	setProperty('dadIcon1.scale.x', 0.85)
	setProperty('dadIcon1.scale.y', 0.85)

	setProperty('dadIcon1.animation.curAnim.curFrame', getProperty('iconP2.animation.curAnim.curFrame'))
	setProperty('dadIcon1.x', 538.5 - 60)
	setProperty('dadIcon1.y', getProperty('iconP2.y') - 50)

	setProperty('defaultCamZoom', 1.3)
	setPropertyFromClass('flixel.FlxG', 'camera.zoom', 1.3)

	makeLuaSprite('flash', '', 0, 900);
	makeGraphic('flash',10,10,'0xFF000000')
	setProperty('flash.scale.x', 3000)
	setProperty('flash.scale.y', 3000)
	addLuaSprite('flash', false);
	setProperty('flash.alpha', 0)
	setObjectOrder('flash', getObjectOrder('dad1') - 1)

--	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

local mustHit = false
xx = 450;
yy = 1200;
xx2 = 850;
yy2 = 1170;
xx3 = 550;
yy3 = 1170;
ofs = 20;
stopFollow = false

function onStartCountdown()
	snapCam(xx + 50, yy - 50)
    setProperty('camFollow.x', xx)
    setProperty('camFollow.y', yy)
end

useDoubleDadIcons = true
playDadSingReal = true

function onUpdate(elapsed) 
	local currentBeat = (songPos / 1000)*(bpm/60)

	if (getProperty('dad.animation.name') == 'idle' or getProperty('dad.animation.name') == 'danceRight') and (getProperty('dad1.animation.name') == 'idle' or getProperty('dad1.animation.name') == 'danceRight') and (getProperty('dad2.animation.name') == 'idle' or getProperty('dad2.animation.name') == 'danceRight') and mustHit == false and stopFollow == false then
        setCamFollow(xx, yy)
    end

    if (getProperty('boyfriend.animation.name') == 'idle' or getProperty('boyfriend.animation.name') == 'danceRight') and (getProperty('boyfriend1.animation.name') == 'idle' or getProperty('boyfriend1.animation.name') == 'danceRight') and (getProperty('boyfriend2.animation.name') == 'idle' or getProperty('boyfriend2.animation.name') == 'danceRight') and mustHit == true and stopFollow == false then
        setCamFollow(xx2, yy2)
    end

	if useDoubleDadIcons then
        setProperty('opponentIconScale', 1.05)
        setProperty('dadIcon1.scale.x', getProperty('iconP2.scale.x'))
        setProperty('dadIcon1.scale.y', getProperty('iconP2.scale.y'))
       -- setProperty('dadIcon1.animation.curAnim.curFrame', getProperty('iconP2.animation.curAnim.curFrame'))
        setProperty('dadIcon1.x', getProperty('iconP2.x') - 60)
        setProperty('dadIcon1.y', getProperty('iconP2.y') - 50)
        setProperty('dadIcon1.alpha', 1)
    end

	if getProperty('healthBar.percent') > 80 then
		setProperty('dadIcon1.animation.curAnim.curFrame', 1)
	else
		setProperty('dadIcon1.animation.curAnim.curFrame', 0)
	end
	
	playDadSing = false

end

function onBeatHit(beat)
	if curBeat % 2 == 0 and not (curStep >= 1056 and curStep < 1152) then
		setProperty('dad1.stopIdle', false)
		setProperty('boyfriend.stopIdle', false)

		if string.match(getProperty('dad.animation.curAnim.name'), 'idle'..dadAlt) or string.match(getProperty('dad.animation.curAnim.name'), 'danceRight')then
			playActorAnimation('dad', 'idle'..dadAlt, true, false)
		end

		if string.match(getProperty('boyfriend.animation.curAnim.name'), 'idle') or string.match(getProperty('boyfriend.animation.curAnim.name'), 'danceRight')then
			playActorAnimation('boyfriend', 'idle', true, false)
		end

		if string.match(getProperty('dad1.animation.curAnim.name'), 'idle') or string.match(getProperty('dad.animation.curAnim.name'), 'danceRight')then
			playActorAnimation('dad1', 'idle', true, false)
			playDadSingReal = true
		end
	end

	if curBeat % 4 == 0 and (curStep >= 1056 and curStep < 1152) then
		setProperty('boyfriend.stopIdle', true)

		if string.match(getProperty('dad.animation.curAnim.name'), 'idle') or string.match(getProperty('dad.animation.curAnim.name'), 'danceRight')then
			playActorAnimation('dad', 'idle', true, false)
		end

		if string.match(getProperty('boyfriend.animation.curAnim.name'), 'idle') or string.match(getProperty('boyfriend.animation.curAnim.name'), 'danceRight')then
			playActorAnimation('boyfriend', 'idle', true, false)
		end

		playActorAnimation('dad1', 'huh', true, false)
		playDadSingReal = true
	end
end

function onStepHit()
	if curStep == 32 or curStep == 552 or curStep == 928 or curStep == 1152 or curStep == 1552 or curStep == 1952 then
		setProperty('defaultCamZoom', 0.9)
		doTweenAlpha('twen', 'flash', 0, 0.2, 'linear')
	end

	if curStep == 272 or curStep == 800 then
		setProperty('defaultCamZoom', 1.1)
	end

	if curStep == 288 or curStep == 1312 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 544 or curStep == 2448 then
		setProperty('defaultCamZoom', 1.2)
	end

	if curStep == 1040 then
		setProperty('defaultCamZoom', 1.2)
		setProperty('dad.stopIdle', true)
		playActorAnimation('dad', 'transform')
		dadAlt = "-alt"
		dadAltAnim = true
		doTweenAlpha('twen', 'flash', 0.6, 0.7, 'linear')
		tweenColor('dadIcon1', 0.7, RGBColor(255,255,255,255), RGBColor(0, 0, 0, 255))
	end

	if curStep >= 1056 and curStep < 1152 and curStep % 16 == 0 then
		addCamZoom(0.3)
		addHudZoom(0.1)
	end

	if curStep == 1052 then
		tweenColor('dad', 1, RGBColor(0, 0, 0, 255), RGBColor(255,255,255,255))
		tweenColor('dadIcon1', 1, RGBColor(0, 0, 0, 255), RGBColor(255,255,255,255))
		changeAddedIcon('dadIcon1', 'bendy-da-alt')
	end

	if curStep == 1056 then
		playActorAnimation('dad1', 'huh', true, false)
		setProperty('dad.stopIdle', false)
		setProperty('dad.doMissThing', false)
		setProperty('dad1.stopIdle', true)	  
	end

	if curStep == 1936 then
		tweenColor('dad', 0.5, RGBColor(255,255,255,255), RGBColor(0, 0, 0, 255))
		tweenColor('dadIcon1', 0.5, RGBColor(255,255,255,255), RGBColor(0, 0, 0, 255))
	end

	if curStep == 1952 then
		dadAlt = ""
		tweenColor('dad', 1, RGBColor(0, 0, 0, 255), RGBColor(255,255,255,255))
		tweenColor('dadIcon1', 1, RGBColor(0, 0, 0, 255), RGBColor(255,255,255,255))
		dadAltAnim = false
		changeAddedIcon('dadIcon1', 'bendy-da')
	end

	if curStep == 1568 or curStep == 1632 or curStep == 1696 or curStep == 1760 then
		setProperty('defaultCamZoom', 0.65)
	end

	if curStep >= 1568 and curStep < 1824 and curStep % 16 == 0 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.15)
	end

	if curStep == 2464 then
		setProperty('defaultCamZoom', 0.8)
	end
end

function playerOneTurn()
    mustHit = true
end

function playerTwoTurn()
    mustHit = false
end

local sDir = {'singLEFT','singDOWN', 'singUP','singRIGHT'};
dadAlt = ""

function dadNoteHit(note, isSustain, noteType, dType) --idk i just like it looking cleaner

	--testing multiple characters without hardcoding
	if dType == 0 then
		playDadSingReal = true
		if getProperty('dad.curCharacter') == 'bendy-da' then

			if isSustain == false then
				playActorAnimation('dad', sDir[note + 1].. dadAlt, true, false)
			end
		else
			playActorAnimation('dad', sDir[note + 1], true, false)
		end
	
		setProperty('dad.holdTimer', 0)
	elseif dType == 1 then
		playDadSingReal = false
		playActorAnimation('dad1', sDir[note + 1], true, false)
		setProperty('dad1.holdTimer', 0)
	elseif dType == 2 then
		playDadSingReal = true

		if getProperty('dad.curCharacter') == 'bendy-da' then

			if isSustain == false then
				playActorAnimation('dad', sDir[note + 1]..dadAlt, true, false)
			end
		else
			playActorAnimation('dad', sDir[note + 1], true, false)
		end
		setProperty('dad.holdTimer', 0)

		playActorAnimation('dad1', sDir[note + 1], true, false)
		setProperty('dad1.holdTimer', 0)
	end

	if dadAlt == "-alt" then
		setProperty("health", getProperty("health") - 0.03)
        if getProperty("health") < 0.2 then
            setProperty("health", 0.2)
        end
	end

	if mustHit == false and stopFollow == false then
		if dType == 1 then
			if note == 0 then
				setCamFollow(xx3-ofs, yy3)
			elseif note == 1 then
				setCamFollow(xx3, yy3+ofs)
			elseif note == 2 then
				setCamFollow(xx3, yy3-ofs)
			elseif note == 3 then
				setCamFollow(xx3+ofs, yy3)
			else
				setCamFollow(xx3, yy3)
			end
		elseif dType == 2 then
			if note == 0 then
				setCamFollow(xx-ofs, yy3)
			elseif note == 1 then
				setCamFollow(xx, yy3+ofs)
			elseif note == 2 then
				setCamFollow(xx, yy3-ofs)
			elseif note == 3 then
				setCamFollow(xx+ofs, yy3)
			else
				setCamFollow(xx, yy3)
			end
		else
			if note == 0 then
				setCamFollow(xx-ofs, yy)
			elseif note == 1 then
				setCamFollow(xx, yy+ofs)
			elseif note == 2 then
				setCamFollow(xx, yy-ofs)
			elseif note == 3 then
				setCamFollow(xx+ofs, yy)
			else
				setCamFollow(xx, yy)
			end
		end
    end
end

function bfNoteHit(note, isSustain, noteType, dType)

    if noteType == 3 then
        stopIdle('boyfriend', true)
        playActorAnimation('boyfriend', 'dodge', true, false)
    end
end

function playerOneSing(note, songpos)

    --why tf is it elseif and not else if
    if mustHit == true and stopFollow == false then
        if note == 0 then
            setCamFollow(xx2-ofs, yy2)
        elseif note == 1 then
            setCamFollow(xx2, yy2+ofs)
        elseif note == 2 then
            setCamFollow(xx2, yy2-ofs)
        elseif note == 3 then
            setCamFollow(xx2+ofs, yy2)
        else
            setCamFollow(xx2, yy2)
        end
    end
end

function playerOneMiss(note, songPos, dType)

end