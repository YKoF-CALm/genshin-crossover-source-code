function onStartCountdown()
    dx = getCharacterX('dad')
    dy = getCharacterY('dad')
    triggerEvent('Camera Follow Pos', 500, 390)
    return Function_Continue;
end

function onCreate()
    setProperty('introSoundsSuffix', '-gloopy')
    makeLuaSprite('3', 'b&b/3', 0, 0)
    setObjectCamera('3', 'other')
    makeLuaSprite('2', 'b&b/2', 0, 0)
    setObjectCamera('2', 'other')
    makeLuaSprite('1', 'b&b/1', 0, 0)
    setObjectCamera('1', 'other')
    makeLuaSprite('go', 'b&b/go', 0, 0)
    setObjectCamera('go', 'other')
end

function onCountdownTick(counter)
    setProperty('countdownReady.visible', 0)
    setProperty('countdownSet.visible', 0)
    setProperty('countdownGo.visible', 0)
    if counter == 0 then
        addLuaSprite('3', true)
        doTweenAlpha('beforeReady', '3', '0', crochet/1000, 'cubeInOut')
    end
    if counter == 1 then
        addLuaSprite('2', true)
        doTweenAlpha('Ready', '2', '0', crochet/1000, 'cubeInOut')
    end
    if counter == 2 then
        addLuaSprite('1', true)
        doTweenAlpha('Set', '1', '0', crochet/1000, 'cubeInOut')
    end
    if counter == 3 then
        addLuaSprite('go', true)
        doTweenAlpha('Go', 'go', '0', crochet/1000, 'cubeInOut')
    end
end

function onCreatePost()
	changeNoteSkin('ludinotes', 'opponent')
    changeNoteSplashSkin('ludisplashes', 'opponent')
end

function changeNoteSkin(skin, player)
    if not (skin == 'vanilla') then -- checks if skin isn't vanilla (basic one)
	    local mustHit = true -- mustHit detects bf's notes
	    if player == 'opponent' then
		    mustHit = false -- if it's false then it's opponent's notes
	    end

	    for i = 0, getProperty(player..'Strums.length')-1 do -- strums from the player parameter (ONLY OPPONENT AND PLAYER)
            setPropertyFromGroup(player..'Strums', i, 'texture', 'notes/'..skin) -- changes the noteskin from parameter skin
        end
        for i = 0, getProperty('unspawnNotes.length')-1 do -- counts all unspawned notes
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then -- checks if the note is normal note
		        if mustHit and getPropertyFromGroup('unspawnNotes', i, 'mustPress') then -- does a check if it's a player note
                	setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/'..skin) -- sets player's noteskin
		        elseif not mustHit and not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then -- opponent note check
			        setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/'..skin) -- sets the opponent note
		        end
            end
        end
        
    end
end

function changeNoteSplashSkin(skin, player)
    if not (skin == 'vanilla') then -- checks if skin isn't vanilla (basic one)
	    local mustHit = true -- mustHit detects bf's notes
	    if player == 'opponent' then
		    mustHit = false -- if it's false then it's opponent's notes
	    end

        for i = 0, getProperty('unspawnNotes.length')-1 do -- counts all unspawned notes
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then -- checks if the note is normal note
		        if mustHit and getPropertyFromGroup('unspawnNotes', i, 'mustPress') then -- does a check if it's a player note
                	setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notesplashes/'..skin) -- sets player's noteskin
		        elseif not mustHit and not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then -- opponent note check
			        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notesplashes/'..skin) -- sets the opponent note
		        end
            end
        end
        
    end
end

function onUpdate(elapsed)
    if mustHitSection then
        triggerEvent('Camera Follow Pos', 800, 390)
    elseif not mustHitSection then
        triggerEvent('Camera Follow Pos', 500, 390)
    end
end

function onTweenCompleted(tag)
    if tag == 'beforeReady' then
        removeLuaSprite('3', true)
    end
    if tag == 'Ready' then
        removeLuaSprite('2', true)
    end
    if tag == 'Set' then
        removeLuaSprite('1', true)
    end
    if tag == 'Go' then
        removeLuaSprite('go', true)
    end
end