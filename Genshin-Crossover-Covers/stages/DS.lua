local xx = 2450;
local yy = 2050;
local xx2 = 2450;
local yy2 = 2450;
local xx3 = 2750;
local yy3 = 2300;
local ofs = 30;
local ofs2 = 60;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'dsbf-die');
	makeLuaSprite('front', 'doorstuck/BACKGROUND', 1600, 1900);
	addLuaSprite('front', false);
end

function onCreatePost()
	makeLuaSprite('explode', null, 0, 0);
	makeGraphic('explode', 1280, 720, "000000");
	setObjectCamera('explode', 'camHud');
	setProperty('explode.alpha', 0);
	addLuaSprite('explode', false);

    if getProperty("dad.curCharacter") == "dsnormal" then
	triggerEvent("Change Character", "dad", "dsangry");
	triggerEvent("Change Character", "dad", "dsnormal");
    end
end

function onCountdownStarted()
    for i = 0, getProperty("unspawnNotes.length") do
    	if not getPropertyFromGroup("unspawnNotes", i, "mustPress") then
        	setPropertyFromGroup("unspawnNotes", i, "visible", false);
    	end
    end

    for i = 0, 3 do
        setPropertyFromGroup("opponentStrums", i, "visible", false);
    end
end

function onStartCountdown()
	triggerEvent("Play Animation", "danceLeft", "gf");
	triggerEvent("Play Animation", "singLEFT", "dad");
	triggerEvent("Play Animation", "idle", "dad");

	setProperty("dad.animation.curAnim.frameRate", 24);

	return Function_Continue;
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
if curStep < 199992 then
       if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
		else
		    if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs2,yy3)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs2,yy3)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
end