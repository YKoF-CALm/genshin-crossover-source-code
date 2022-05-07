local xx = 405;
local yy = 480;
local xx2 = 820;
local yy2 = 500;
local followchars = true;
--these dont seem to do anything
--[[local del = 0;
local del2 = 0;]]

function onCreate()
	makeAnimatedLuaSprite('bf', 'characters/BF_post_exp', 550, 500)
	addAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, false)
	addLuaSprite('bf', true)

	setProperty('boyfriend.y', getProperty('boyfriend.y') - 20)
	setProperty('boyfriend.x', getProperty('boyfriend.x') - 50)
	setProperty('health', 2)
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('bf', 'idle', true)
	end
end

function onStepHit()
	if curStep >= 149 and curStep % 16 == 0 then
		if not mustHitSection then
			setProperty('defaultCamZoom', 0.75)
		elseif mustHitSection then
			setProperty('defaultCamZoom', 0.65)
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	setProperty('health', getProperty('health') + 0.05)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    setProperty('health', getProperty('health') - 0.02)
end

function onCreatePost()
	setProperty("isCameraOnForcedPos", true)
end

function _campos(x, y)
	setProperty("camFollow.x", x)
	setProperty("camFollow.y", y)
end

function docam(ch, xfrom, yfrom, ofs)
	local aname = getProperty(ch..".animation.curAnim.name")
	if aname == "singLEFT" then
		_campos(xfrom-ofs, yfrom)
	elseif aname == "singDOWN" then
		_campos(xfrom, yfrom+ofs)
	elseif aname == "singUP" then
		_campos(xfrom, yfrom-ofs)
	elseif aname == "singRIGHT" then
		_campos(xfrom+ofs, yfrom)
	else
		_campos(xfrom, yfrom)
	end
	--debugPrint("good script! featuring "..ch)
end

function onUpdate()
	if mustHitSection then
		docam("boyfriend", xx2, yy2, 35)
	else
		docam("dad", xx, yy, 80)
	end
	--these dont seem to do anything
	--[[if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end]]
	--[[if followchars then
		if mustHitSection then
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',xx2,yy2)
			end
		elseif getProperty('dad.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',xx,yy)
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end]]
	setProperty('vg.alpha', (2 - getProperty('health')) / 2)
end