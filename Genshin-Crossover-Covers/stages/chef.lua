local xx = 1200;
local yy = 800;
local xx2 = 1400;
local yy2 = 800;
local ofs = 10;
local followchars = true;
function onCreate()
    makeLuaSprite('wall', 'impostor/chef/Back Wall Kitchen', 100, 100)
    setScrollFactor('wall', 1, 1)
    scaleObject('wall', 0.8, 0.8)
    updateHitbox('wall')
    addLuaSprite('wall', false)

    makeLuaSprite('floor', 'impostor/chef/Chef Floor', -700, 1000)
    setScrollFactor('floor', 1, 1)
    addLuaSprite('floor', false)

    makeLuaSprite('backshit', 'impostor/chef/Back Table Kitchen', 100, 270)
    scaleObject('backshit', 0.8, 0.8)
    updateHitbox('backshit')
    setScrollFactor('backshit', 1, 1)
    addLuaSprite('backshit', false)

    makeLuaSprite('oven', 'impostor/chef/oven', 1600, 470)
    setScrollFactor('oven', 1, 1)
    scaleObject('oven', 0.8, 0.8)
    updateHitbox('oven')
    addLuaSprite('oven', false)

    makeAnimatedLuaSprite('gray', 'impostor/chef/Boppers', 1000, 575)
    addAnimationByPrefix('gray', 'bop', 'grey', 24, false)
    setScrollFactor('gray', 1, 1)
    scaleObject('gray', 0.8, 0.8)
    updateHitbox('gray')
    addLuaSprite('gray', false)

    makeAnimatedLuaSprite('saster', 'impostor/chef/Boppers', 1300, 575)
    addAnimationByPrefix('saster', 'bop', 'saster', 24, false)
    setScrollFactor('saster', 1, 1)
    scaleObject('saster', 0.8, 0.8)
    updateHitbox('saster')
    addLuaSprite('saster', false)

    makeLuaSprite('frontable', 'impostor/chef/Kitchen Counter', 800, 700)
    setScrollFactor('frontable', 1, 1)
    addLuaSprite('frontable', false)

    makeLuaSprite('chefBluelight', 'impostor/chef/bluelight', 0, -300)
    setScrollFactor('chefBluelight', 1, 1)
    setBlendMode('chefBluelight', add)
    addLuaSprite('chefBluelight', true)

    makeLuaSprite('chefBlacklight', 'impostor/chef/black_overhead_shadow', 0, -300)
    setScrollFactor('chefBlacklight', 1, 1)
    addLuaSprite('chefBlacklight', true)
end

function onUpdate(elapsed)
	setProperty('gf.alpha', 0);
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.8)
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
        else
            setProperty('defaultCamZoom',0.8)
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

	if curStep >= 171 and curStep < 176 then
		setProperty('defaultCamZoom',1)
	end

    if curBeat == 44 then
        setProperty('defaultCamZoom', 0.8)
    end

    if curBeat == 112 then
		setProperty('defaultCamZoom',0.9)
		xx = 1180;
		yy = 800;
	end

	if curBeat == 113 then
		setProperty('defaultCamZoom',1)
		xx = 1160;
		yy = 800;
	end

	if curBeat == 114 then
		setProperty('defaultCamZoom',1.1)
		xx = 1140;
		yy = 800;
	end

	if curBeat == 115 then
		setProperty('defaultCamZoom',1.2)
		xx = 1120;
		yy = 800;
	end

	if curBeat == 116 then
		setProperty('defaultCamZoom',0.8)
		xx = 1200;
		yy = 800;
	end

	if curStep == 206 or curStep == 207 then
		setProperty('defaultCamZoom',1)
	end

	if curStep >= 399 and curStep < 404 then
		setProperty('defaultCamZoom',1)
	end

	if curStep == 404 then
		setProperty('defaultCamZoom',0.8)
	end

	if curStep == 1172 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curStep >= 1164 and curStep < 1172 then
		setProperty('defaultCamZoom',1)
	end

	if curStep == 1172 then
		setProperty('defaultCamZoom',0.8)
	end

	if curBeat == 304 then
		setProperty('defaultCamZoom',0.9)
		xx = 1180;
		yy = 800;
	end

	if curBeat == 305 then
		setProperty('defaultCamZoom',1)
		xx = 1160;
		yy = 800;
	end

	if curBeat == 306 then
		setProperty('defaultCamZoom',1.1)
		xx = 1140;
		yy = 800;
	end

	if curBeat == 307 then
		setProperty('defaultCamZoom',1.2)
		xx = 1120;
		yy = 800;
	end

	if curBeat == 308 then
		setProperty('defaultCamZoom',0.8)
		xx = 1200;
		yy = 800;
	end

	if curBeat == 320 then
		setProperty('defaultCamZoom',0.9)
		xx = 1180;
		yy = 800;
	end

	if curBeat == 321 then
		setProperty('defaultCamZoom',1)
		xx = 1160;
		yy = 800;
	end

	if curBeat == 322 then
		setProperty('defaultCamZoom',1.1)
		xx = 1140;
		yy = 800;
	end

	if curBeat == 323 then
		setProperty('defaultCamZoom',1.2)
		xx = 1120;
		yy = 800;
	end

	if curBeat >= 324 then
		setProperty('defaultCamZoom',0.7)
		followchars = false
		triggerEvent('Camera Follow Pos', 1300, 700)
	end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('gray', 'bop', true)
        playAnim('saster', 'bop', true)
    end
end