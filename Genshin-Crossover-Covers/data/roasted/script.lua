function onCreate()
    precacheImage('secondicons/blantad-normal')
    precacheImage('secondicons/blantad-danger')
    precacheImage('secondicons/natsuki-normal')
    precacheImage('secondicons/natsuki-danger')
    addCharacterToList('keqing-player', 'boyfriend')
    addCharacterToList('keqing-doki-player', 'boyfriend')

    setProperty('dad.x', getProperty('dad.x') - 100)
    setProperty('boyfriend.x', getProperty('boyfriend.x') + 200)
    cameraSetTarget('dad')
end

function onCreatePost()
    makeLuaSprite('blantadIcon', 'secondicons/blantad-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('blantadIcon', 'hud')
    addLuaSprite('blantadIcon', true)
    setObjectOrder('blantadIcon', getObjectOrder('iconP2') + 1)
    setProperty('blantadIcon.flipX', false)
    setProperty('blantadIcon.visible', true)

    makeLuaSprite('blantadDangerIcon', 'secondicons/blantad-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('blantadDangerIcon', 'hud')
    addLuaSprite('blantadDangerIcon', true)
    setObjectOrder('blantadDangerIcon', getObjectOrder('iconP2') + 1)
    setProperty('blantadDangerIcon.flipX', false)
    setProperty('blantadDangerIcon.visible', false)

    makeLuaSprite('natsukiIcon', 'secondicons/natsuki-normal', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('natsukiIcon', 'hud')
    addLuaSprite('natsukiIcon', true)
    setObjectOrder('natsukiIcon', getObjectOrder('blantadIcon') + 1)
    setProperty('natsukiIcon.flipX', false)
    setProperty('natsukiIcon.visible', true)

    makeLuaSprite('natsukiDangerIcon', 'secondicons/natsuki-danger', getProperty('iconP2.x'), getProperty('iconP2.y'))
    setObjectCamera('natsukiDangerIcon', 'hud')
    addLuaSprite('natsukiDangerIcon', true)
    setObjectOrder('natsukiDangerIcon', getObjectOrder('blantadDangerIcon') + 1)
    setProperty('natsukiDangerIcon.flipX', false)
    setProperty('natsukiDangerIcon.visible', false)
end

local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
local SelectedCharacter = 0
function onNextDialogue(count) --dumbass character selection screen
	-- triggered when the next dialogue line starts, 'line' starts with 1
	if keyPressed('up') then --defaults to BF
		SelectedCharacter = 0
	elseif keyPressed('down') then --Selects GF
		SelectedCharacter = 1
	end
end

function onSongStart() --used to clear any damage/score/accuracy changes made during character switching
	-- Inst and Vocals start playing, songPosition = 0
	setProperty('health', 1);
	setProperty('songMisses', 0)
	setProperty('songScore',0)
end


function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Duet Note' then
		characterPlayAnim('gf', getProperty('singAnimations')[math.abs(direction)+1], true)
		setProperty('gf.holdTimer', 0)
	end
end

local xx = 450;
local yy = 1100;
local xx2 = 900;
local yy2 = 1200;
local xx3 = 550
local yy3 = 1300
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate(elapsed)
    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end

    if followchars == true then
        if mustHitSection == false then
            if gfSection then
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            else
                if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx-ofs,yy)
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx+ofs,yy)
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx,yy-ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx,yy+ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                    triggerEvent('Camera Follow Pos',xx-ofs,yy)
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx+ofs,yy)
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx,yy-ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx,yy+ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx,yy)
                end
                if getProperty('dad.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx,yy)
                end
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end

    setProperty('iconP2.visible', false)
    if getProperty('health') > 1.6 then
        setProperty('blantadIcon.visible', false)
        setProperty('blantadDangerIcon.visible', true)
        setProperty('natsukiIcon.visible', false)
        setProperty('natsukiDangerIcon.visible', true)
    else
        setProperty('blantadIcon.visible', true)
        setProperty('blantadDangerIcon.visible', false)
        setProperty('natsukiIcon.visible', true)
        setProperty('natsukiDangerIcon.visible', false)
    end
end

function onUpdatePost(elapsed)
    setProperty('blantadIcon.x', getProperty('iconP2.x') - 20)
    setProperty('blantadIcon.angle', getProperty('iconP2.angle'))
    setProperty('blantadIcon.y', getProperty('iconP2.y') - 30)
    setProperty('blantadIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('blantadIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('blantadDangerIcon.x', getProperty('iconP2.x') - 20)
    setProperty('blantadDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('blantadDangerIcon.y', getProperty('iconP2.y') - 30)
    setProperty('blantadDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('blantadDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('natsukiIcon.x', getProperty('iconP2.x') + 30)
    setProperty('natsukiIcon.angle', getProperty('iconP2.angle'))
    setProperty('natsukiIcon.y', getProperty('iconP2.y') + 20)
    setProperty('natsukiIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('natsukiIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)

    setProperty('natsukiDangerIcon.x', getProperty('iconP2.x') + 30)
    setProperty('natsukiDangerIcon.angle', getProperty('iconP2.angle'))
    setProperty('natsukiDangerIcon.y', getProperty('iconP2.y') + 20)
    setProperty('natsukiDangerIcon.scale.x', getProperty('iconP2.scale.x')/2 + 0.2)
    setProperty('natsukiDangerIcon.scale.y', getProperty('iconP2.scale.y')/2 + 0.2)
end

function onStepHit() --Controls Swapping the characters based on previous character selection
	if curStep == 1 then
		if SelectedCharacter == 0 then
			triggerEvent('Change Character', 0, 'keqing-player'); --Selected Singer
		elseif SelectedCharacter == 1 then
			triggerEvent('Change Character', 0, 'keqing-doki-player'); --Selected Singer
            setProperty('boyfriend.x', getProperty('boyfriend.x') + 200)
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('CharacterSelect');
	end
end