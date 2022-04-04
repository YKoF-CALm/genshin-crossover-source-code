function onCreate()
    makeAnimatedLuaSprite('zap', 'cloud/rain/lightningStrike', 0, -1050)
    luaSpriteAddAnimationByPrefix('zap', 'zap', 'strike', 24, false)

    makeAnimatedLuaSprite('aloe', 'characters/Aloe', 1400, 400)
    luaSpriteAddAnimationByPrefix('aloe', 'stressed', 'BF idle fard', 24, false)

    makeAnimatedLuaSprite('aloe2', 'characters/Aloe', 1400, 400)
    luaSpriteAddAnimationByPrefix('aloe2', 'idle', 'BF idle dance', 24, false)
    addLuaSprite('aloe2', false)

    makeAnimatedLuaSprite('nene', 'characters/nenechi', 1700, 450)
    luaSpriteAddAnimationByPrefix('nene', 'scared', 'BF idle shaking', 24, true)
    luaSpritePlayAnimation('nene', 'scared', true)

    makeAnimatedLuaSprite('nene2', 'characters/nenechi', 1700, 450)
    luaSpriteAddAnimationByPrefix('nene2', 'idle', 'BF idle dance', 24, true)
    addLuaSprite('nene2', false)

    precacheImage('characters/Aloe')
    precacheImage('characters/nenechi')
    precacheImage('cloud/rain/lightningStrike')
    addCharacterToList('ei-mad', 'dad')
    addCharacterToList('gf_tabi', 'gf')
    precacheSound('Thunder')
    precacheSound('eiburst')
end

function onBeatHit()
    if curBeat == 64 then
        removeLuaSprite('nene2', false)
        removeLuaSprite('aloe2', false)
        addLuaSprite('aloe', false)
        addLuaSprite('nene', false)
    end

    if curBeat % 2 == 0 then
        luaSpritePlayAnimation('aloe2', 'idle', true)
        luaSpritePlayAnimation('aloe', 'stressed', true)
        luaSpritePlayAnimation('nene2', 'idle', true)
    end
end

local sway = false
local swayfast = false
local swaynote = false
local crisscross = false
local crisscrossfast = false
local crisscrossfinal = false

function onStepHit()
	if (curStep >= 900 and curStep < 1020) or (curStep >= 1670 and curStep < 1680) or (curStep >= 1956 and curStep < 2192) or curStep >= 2550 then
        setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0)
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1)
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2)
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3)
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0)
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1)
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2)
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3)
        setPropertyFromGroup('opponentStrums', 0, 'angle', 0)
        setPropertyFromGroup('opponentStrums', 1, 'angle', 0)
        setPropertyFromGroup('opponentStrums', 2, 'angle', 0)
        setPropertyFromGroup('opponentStrums', 3, 'angle', 0)
        setPropertyFromGroup('playerStrums', 0, 'angle', 0)
        setPropertyFromGroup('playerStrums', 1, 'angle', 0)
        setPropertyFromGroup('playerStrums', 2, 'angle', 0)
        setPropertyFromGroup('playerStrums', 3, 'angle', 0)
        setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0)
        setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY1)
        setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY2)
        setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY3)
        setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumY0)
        setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumY1)
        setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumY2)
        setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumY3)
	end

	if (curStep >= 256 and curStep < 512) or (curStep >= 1952 and curStep < 2208) then
		sway = true
	elseif (curStep >= 512 and curStep < 1048) or curStep >= 2208 then
		sway = false
        cancelTween('sway')
	end
    if (curStep >= 512 and curStep < 1048) then
        setProperty('camHUD.angle', 0)
    end
	if curStep >= 2208 and curStep < 2544 then
		swayfast = true
	elseif (curStep >= 1048 and curStep < 1952) or curStep >= 2544 then
		swayfast = false
        cancelTween('swayfast')
        setProperty('camHUD.angle', 0)
	end

	if curStep >= 512 and curStep < 640 then
		swaynote = true
	elseif curStep >= 640 then
		swaynote = false
	end
	
	--Criss-Cross note timing
	if (curStep >= 640 and curStep < 896) or (curStep >= 1696 and curStep < 1952) then
        noteTweenAlpha('alphao1', 0, 0.3, 0.4, 'linear')
        noteTweenAlpha('alphao2', 1, 0.3, 0.4, 'linear')
        noteTweenAlpha('alphao3', 2, 0.3, 0.4, 'linear')
        noteTweenAlpha('alphao4', 3, 0.3, 0.4, 'linear')
	end
	if (curStep >= 640 and curStep < 896) or (curStep >= 1696 and curStep < 1952) then
		crisscross = true
	elseif curStep >= 896 or curStep >= 1952 then
		crisscross = false
	end
	if (curStep >= 896 and curStep < 1400) or (curStep >= 1952 and curStep < 2200) then
        noteTweenAlpha('alphao1', 0, 1, 0.4, 'linear')
        noteTweenAlpha('alphao2', 1, 1, 0.4, 'linear')
        noteTweenAlpha('alphao3', 2, 1, 0.4, 'linear')
        noteTweenAlpha('alphao4', 3, 1, 0.4, 'linear')
	end
	
	if curStep >= 1408 and curStep < 1664 then
        noteTweenAlpha('alphao1', 0, 0.3, 0.4, 'linear')
        noteTweenAlpha('alphao2', 1, 0.3, 0.4, 'linear')
        noteTweenAlpha('alphao3', 2, 0.3, 0.4, 'linear')
        noteTweenAlpha('alphao4', 3, 0.3, 0.4, 'linear')
	end
	if curStep >= 1408 and curStep < 1664 then
		crisscrossfast = true
	elseif curStep >= 1664 then
		crisscrossfast = false
	end
	if curStep >= 1664 and curStep < 1670 then
        noteTweenAlpha('alphao1', 0, 1, 0.4, 'linear')
        noteTweenAlpha('alphao2', 1, 1, 0.4, 'linear')
        noteTweenAlpha('alphao3', 2, 1, 0.4, 'linear')
        noteTweenAlpha('alphao4', 3, 1, 0.4, 'linear')
	end
	
	if curStep >= 2208 and curStep < 2544 then
        noteTweenAlpha('alphao1', 0, 0.3, 0.4, 'linear')
        noteTweenAlpha('alphao2', 1, 0.3, 0.4, 'linear')
        noteTweenAlpha('alphao3', 2, 0.3, 0.4, 'linear')
        noteTweenAlpha('alphao4', 3, 0.3, 0.4, 'linear')
	end
	if curStep >= 2208 and curStep < 2544 then
		crisscrossfinal = true
	elseif curStep >= 2544 then
		crisscrossfinal = false
	end
	if curStep >= 2544 then
        noteTweenAlpha('alphao1', 0, 1, 0.4, 'linear')
        noteTweenAlpha('alphao2', 1, 1, 0.4, 'linear')
        noteTweenAlpha('alphao3', 2, 1, 0.4, 'linear')
        noteTweenAlpha('alphao4', 3, 1, 0.4, 'linear')
	end

	if curStep == 896 or curStep == 1664 or curStep == 1952 or curStep == 2544 then
        noteTweenAngle('oa1', 0, getPropertyFromGroup('opponentStrums', 0, 'angle') + 360, 0.2, 'linear')
        noteTweenAngle('oa2', 1, getPropertyFromGroup('opponentStrums', 1, 'angle') + 360, 0.2, 'linear')
        noteTweenAngle('oa3', 2, getPropertyFromGroup('opponentStrums', 2, 'angle') + 360, 0.2, 'linear')
        noteTweenAngle('oa4', 3, getPropertyFromGroup('opponentStrums', 3, 'angle') + 360, 0.2, 'linear')
        noteTweenAngle('pa1', 4, getPropertyFromGroup('playerStrums', 0, 'angle') + 360, 0.2, 'linear')
        noteTweenAngle('pa2', 5, getPropertyFromGroup('playerStrums', 1, 'angle') + 360, 0.2, 'linear')
        noteTweenAngle('pa3', 6, getPropertyFromGroup('playerStrums', 2, 'angle') + 360, 0.2, 'linear')
        noteTweenAngle('pa4', 7, getPropertyFromGroup('playerStrums', 3, 'angle') + 360, 0.2, 'linear')
        setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0)
        setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY1)
        setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY2)
        setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY3)
        setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumY0)
        setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumY1)
        setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumY2)
        setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumY3)
	end
end

function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos / 1000)*(bpm/60)
	hudX = getProperty('camHUD.x')
    hudY = getProperty('camHUD.y')
	
    if sway then
        doTweenAngle('sway', 'camHUD', 5 * math.sin(currentBeat / 2), 0.1, 'linear')
    end

    if swayfast then
        doTweenAngle('swayfast', 'camHUD', 6 * math.sin(currentBeat * 2), 0.1, 'linear')
    end
	
    if swaynote then
        noteTweenX('ox1', 0, defaultOpponentStrumX0 + 64 * math.sin((currentBeat + 0*2) * math.pi), 0.1, 'linear')
        noteTweenX('ox2', 1, defaultOpponentStrumX1 + 64 * math.sin((currentBeat + 1*2) * math.pi), 0.1, 'linear')
        noteTweenX('ox3', 2, defaultOpponentStrumX2 + 64 * math.sin((currentBeat + 2*2) * math.pi), 0.1, 'linear')
        noteTweenX('ox4', 3, defaultOpponentStrumX3 + 64 * math.sin((currentBeat + 3*2) * math.pi), 0.1, 'linear')
        noteTweenX('px1', 4, defaultPlayerStrumX0 + 64 * math.sin((currentBeat + 4*2) * math.pi), 0.1, 'linear')
        noteTweenX('px2', 5, defaultPlayerStrumX1 + 64 * math.sin((currentBeat + 5*2) * math.pi), 0.1, 'linear')
        noteTweenX('px3', 6, defaultPlayerStrumX2 + 64 * math.sin((currentBeat + 6*2) * math.pi), 0.1, 'linear')
        noteTweenX('px4', 7, defaultPlayerStrumX3 + 64 * math.sin((currentBeat + 7*2) * math.pi), 0.1, 'linear')
    end

	if crisscross then
        noteTweenX('ox1', 0, defaultOpponentStrumX0 + 300 * math.sin(currentBeat / 2) + 350, 0.1, 'linear')
        noteTweenX('ox2', 1, defaultOpponentStrumX1 + 300 * math.sin(currentBeat / 2) + 350, 0.1, 'linear')
        noteTweenX('ox3', 2, defaultOpponentStrumX2 + 300 * math.sin(currentBeat / 2) + 350, 0.1, 'linear')
        noteTweenX('ox4', 3, defaultOpponentStrumX3 + 300 * math.sin(currentBeat / 2) + 350, 0.1, 'linear')
        noteTweenX('px1', 4, defaultPlayerStrumX0 - 300 * math.sin(currentBeat / 2) - 275, 0.1, 'linear')
        noteTweenX('px2', 5, defaultPlayerStrumX1 - 300 * math.sin(currentBeat / 2) - 275, 0.1, 'linear')
        noteTweenX('px3', 6, defaultPlayerStrumX2 - 300 * math.sin(currentBeat / 2) - 275, 0.1, 'linear')
        noteTweenX('px4', 7, defaultPlayerStrumX3 - 300 * math.sin(currentBeat / 2) - 275, 0.1, 'linear')
	end

	if crisscrossfast then
        noteTweenX('ox1', 0, defaultOpponentStrumX0 + 300 * math.sin(currentBeat * 0.8) + 350, 0.1, 'linear')
        noteTweenX('ox2', 1, defaultOpponentStrumX1 + 300 * math.sin(currentBeat * 0.8) + 350, 0.1, 'linear')
        noteTweenX('ox3', 2, defaultOpponentStrumX2 + 300 * math.sin(currentBeat * 0.8) + 350, 0.1, 'linear')
        noteTweenX('ox4', 3, defaultOpponentStrumX3 + 300 * math.sin(currentBeat * 0.8) + 350, 0.1, 'linear')
        noteTweenX('px1', 4, defaultPlayerStrumX0 - 300 * math.sin(currentBeat * 0.8) - 275, 0.1, 'linear')
        noteTweenX('px2', 5, defaultPlayerStrumX1 - 300 * math.sin(currentBeat * 0.8) - 275, 0.1, 'linear')
        noteTweenX('px3', 6, defaultPlayerStrumX2 - 300 * math.sin(currentBeat * 0.8) - 275, 0.1, 'linear')
        noteTweenX('px4', 7, defaultPlayerStrumX3 - 300 * math.sin(currentBeat * 0.8) - 275, 0.1, 'linear')
	end

	if crisscrossfinal then
        noteTweenX('ox1', 0, defaultOpponentStrumX0 - 300 * math.sin(currentBeat * 1.2) + 350, 0.1, 'linear')
        noteTweenX('ox2', 1, defaultOpponentStrumX1 - 300 * math.sin(currentBeat * 1.2) + 350, 0.1, 'linear')
        noteTweenX('ox3', 2, defaultOpponentStrumX2 - 300 * math.sin(currentBeat * 1.2) + 350, 0.1, 'linear')
        noteTweenX('ox4', 3, defaultOpponentStrumX3 - 300 * math.sin(currentBeat * 1.2) + 350, 0.1, 'linear')
        noteTweenX('px1', 4, defaultPlayerStrumX0 + 300 * math.sin(currentBeat * 1.2) - 275, 0.1, 'linear')
        noteTweenX('px2', 5, defaultPlayerStrumX1 + 300 * math.sin(currentBeat * 1.2) - 275, 0.1, 'linear')
        noteTweenX('px3', 6, defaultPlayerStrumX2 + 300 * math.sin(currentBeat * 1.2) - 275, 0.1, 'linear')
        noteTweenX('px4', 7, defaultPlayerStrumX3 + 300 * math.sin(currentBeat * 1.2) - 275, 0.1, 'linear')
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'rainnote' then
        if curStep <= 240 or curStep >= 255 then
            characterPlayAnim('dad', 'attack', true)
        end
		playSound('Thunder', 1);
        addLuaSprite('zap', true)
        luaSpritePlayAnimation('zap', 'zap', true)
        runTimer('zapgone', 0.375, 1)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'zapgone' then
        removeLuaSprite('zap', false)
    end
end