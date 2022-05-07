local defx = 0
local defy = 0
local allowIdle = true

function onCreate()
	setProperty('dad.x', getProperty('dad.x') - 100)
	setProperty('gf.x', getProperty('gf.x') - 200)
	setProperty('gf.y', getProperty('gf.y') - 30)
	cameraSetTarget('dad')
	makeAnimatedLuaSprite('Dad2', 'characters/ayaka-duality', 700, -80);
	addAnimationByPrefix('Dad2', 'idle', 'ayaka idle', 24, false);
    addAnimationByPrefix('Dad2', '0', 'ayaka right', 24, false);
    addAnimationByPrefix('Dad2', '1', 'ayaka down', 24, false);
    addAnimationByPrefix('Dad2', '2', 'ayaka up', 24, false);
    addAnimationByPrefix('Dad2', '3', 'ayaka left', 24, false);
	objectPlayAnimation('Dad2', 'idle'); 
	setProperty('Dad2.flipX', true);
	addLuaSprite('Dad2', true);
end

function onCreatePost()
	defx = getProperty('Dad2.x')
	defy = getProperty('Dad2.y')
end

function onBeatHit()
	if curBeat % 2 == 0 and allowIdle then
		objectPlayAnimation('Dad2', 'idle');
	end
end

lastNote = {0, ""}

function goodNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "No Animation" then
		objectPlayAnimation('Dad2', lastNote[1])
		allowIdle = false
		runTimer('resumeIdle', 0.5, 1)
    end
end

function onUpdate(elapsed)
	if getProperty('Dad2.animation.curAnim.name') == '0' then
		setProperty('Dad2.x', defx - 36)
		setProperty('Dad2.y', defy)
	elseif getProperty('Dad2.animation.curAnim.name') == '1' then
		setProperty('Dad2.x', defx + 20)
		setProperty('Dad2.y', defy)
	elseif getProperty('Dad2.animation.curAnim.name') == '2' then
		setProperty('Dad2.x', defx + 3)
		setProperty('Dad2.y', defy)
	elseif getProperty('Dad2.animation.curAnim.name') == '3' then
		setProperty('Dad2.x', defx + 49)
		setProperty('Dad2.y', defy)
	else
		setProperty('Dad2.x', defx)
		setProperty('Dad2.y', defy)
	end
end

function opponentNoteHit(id,d,t,s)
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'resumeIdle' then
		allowIdle = true
	end
end