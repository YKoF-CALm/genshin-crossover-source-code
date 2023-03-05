function onCreate()
    precacheImage('secondicons/xiao-normal')
    precacheImage('secondicons/xiao-danger')
    precacheImage('secondicons/hutao-normal')
    precacheImage('secondicons/hutao-danger')

    setProperty('dad.y', getProperty('dad.y') + 40)
    setProperty('dad.x', getProperty('dad.x') - 200)
    setProperty('gf.x', getProperty('gf.x') - 270)
    setProperty('gf.y', getProperty('gf.y') - 20)

    makeAnimatedLuaSprite('nene', 'characters/nenegf', 525, 230)
    addAnimationByIndices('nene', 'danceLeft', 'GF Dancing Beat', '30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14', 24)
    addAnimationByIndices('nene', 'danceRight', 'GF Dancing Beat', '15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29', 24)
    addLuaSprite('nene', false)
end

function onCreatePost()
	changeNoteSkin('holofunk', 'player')
    changeNoteSplashSkin('noteSplashes-holofunk', 'player')

    makeLuaSprite('xiaoIcon', 'secondicons/xiao-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('xiaoIcon', 'hud')
    addLuaSprite('xiaoIcon', true)
    setObjectOrder('xiaoIcon', getObjectOrder('iconP2') + 1)
    setProperty('xiaoIcon.flipX', false)
    setProperty('xiaoIcon.visible', true)

    makeLuaSprite('xiaoDangerIcon', 'secondicons/xiao-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('xiaoDangerIcon', 'hud')
    addLuaSprite('xiaoDangerIcon', true)
    setObjectOrder('xiaoDangerIcon', getObjectOrder('iconP2') + 1)
    setProperty('xiaoDangerIcon.flipX', false)
    setProperty('xiaoDangerIcon.visible', false)

    makeLuaSprite('hutaoIcon', 'secondicons/hutao-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('hutaoIcon', 'hud')
    addLuaSprite('hutaoIcon', true)
    setObjectOrder('hutaoIcon', getObjectOrder('xiaoIcon') - 1)
    setProperty('hutaoIcon.flipX', false)
    setProperty('hutaoIcon.visible', true)

    makeLuaSprite('hutaoDangerIcon', 'secondicons/hutao-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('hutaoDangerIcon', 'hud')
    addLuaSprite('hutaoDangerIcon', true)
    setObjectOrder('hutaoDangerIcon', getObjectOrder('xiaoDangerIcon') - 1)
    setProperty('hutaoDangerIcon.flipX', false)
    setProperty('hutaoDangerIcon.visible', false)

    setProperty('iconP2.visible', false)
    setObjectOrder('iconP1', getObjectOrder('xiaoDangerIcon') + 1)
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

local xx = 500;
local yy = 550;
local xx2 = 1000;
local yy2 = 550;
local ofs = 20;
local followchars = true;

function onUpdate(elapsed)
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.7)
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' or getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' or getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' or getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' or getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' or getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' or getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end

    if getProperty('health') > 1.6 then
        setProperty('xiaoIcon.visible', false)
        setProperty('xiaoDangerIcon.visible', true)
        setProperty('hutaoIcon.visible', false)
        setProperty('hutaoDangerIcon.visible', true)
    else
        setProperty('xiaoIcon.visible', true)
        setProperty('xiaoDangerIcon.visible', false)
        setProperty('hutaoIcon.visible', true)
        setProperty('hutaoDangerIcon.visible', false)
    end
end

function onUpdatePost(elapsed)
    setProperty('xiaoIcon.x', getProperty('iconP1.x') - 139)
    setProperty('xiaoIcon.angle', getProperty('iconP2.angle'))
    setProperty('xiaoIcon.y', getProperty('iconP1.y') - 20)
    setProperty('xiaoIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('xiaoIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('xiaoDangerIcon.x', getProperty('iconP1.x') - 139)
    setProperty('xiaoDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('xiaoDangerIcon.y', getProperty('iconP1.y') - 20)
    setProperty('xiaoDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('xiaoDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('hutaoIcon.x', getProperty('iconP1.x') - 79)
    setProperty('hutaoIcon.angle', getProperty('iconP2.angle'))
    setProperty('hutaoIcon.y', getProperty('iconP1.y') + 10)
    setProperty('hutaoIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.1)
    setProperty('hutaoIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.1)

    setProperty('hutaoDangerIcon.x', getProperty('iconP1.x') - 79)
    setProperty('hutaoDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('hutaoDangerIcon.y', getProperty('iconP1.y') + 10)
    setProperty('hutaoDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.1)
    setProperty('hutaoDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.1)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('nene', 'danceLeft', true)
    end

    if curBeat % 2 == 1 then
        playAnim('nene', 'danceRight', true)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.023 and boyfriendName ~= 'aloe' then
        setProperty('health', getProperty('health') - 0.023)
    end
end