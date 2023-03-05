local bfy = 0
local dady = 0

function onCreate()
    addCharacterToList('xiao', 'dad')
    addCharacterToList('pico-player', 'boyfriend')
    addCharacterToList('ganyu', 'dad')
    addCharacterToList('hd-senpai-player', 'boyfriend')
    addCharacterToList('hutao', 'dad')
    addCharacterToList('spooky-player', 'boyfriend')
    addCharacterToList('PlayableGFV2', 'boyfriend')
    addCharacterToList('zhongli', 'dad')
    addCharacterToList('dad-player', 'boyfriend')
    addCharacterToList('keqing', 'dad')
    addCharacterToList('mom-player', 'boyfriend')
    addCharacterToList('tankman-player', 'boyfriend')
    addCharacterToList('kokomi', 'dad')

    setProperty('dad.y', getProperty('dad.y') + 30)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 30)
    bfy = getProperty('boyfriend.y')
    dady = getProperty('dad.y')
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

function onStepHit()
    if curStep == 512 then
        setProperty('dad.y', dady)
    end

    if curStep == 640 then
        setProperty('boyfriend.y', bfy - 20)
    end

    if curStep == 768 then
        setProperty('dad.y', dady + 50)
    end

    if curStep == 832 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 50)
    end

    if curStep == 896 then
        setProperty('dad.y', dady + 40)
    end

    if curStep == 928 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 40)
    end

    if curStep == 1024 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 15)
    end

    if curStep == 1280 or curStep == 1408 then
        setProperty('boyfriend.y', getProperty('boyfriend.y') + 40)
    end

    if curStep == 1280 then
        setProperty('dad.y', getProperty('dad.y') + 40)
    end

    if curStep == 1408 then
        setProperty('dad.y', dady + 20)
    end

    if curStep == 1652 then
        setProperty('dad.y', dady + 50)
    end
end