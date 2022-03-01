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