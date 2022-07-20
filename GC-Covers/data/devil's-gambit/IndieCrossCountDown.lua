--[[
local allowCountdown = false
local stops = 0;
function onStartCountdown()
    -- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
    if not allowCountdown and not isStoryMode and not seenCutscene then
    
        setProperty('inCutscene', true);
    
        if stops == 0 then
            setProperty('camFollowPos.x',1150)
            setProperty('camFollowPos.y',200)
            playSound('boo',1)
            setProperty('camHUD.alpha',0)
            doTweenZoom('www','camGame',1.5,0.8,'quadOut')
            runTimer('startC',2.5)
            playSound('boo',1)
        end
        if stops == 1 then
            setProperty('camHUD.alpha',1)
            runTimer('startDialogue', 0.2);
            allowCountdown = true;
        end
        stops = stops + 1
        return Function_Stop;
    end
    return Function_Continue;
end

function onCreate()
    setProperty('skipCountdown', true)

    

    setPropertyFromClass('GameOverSubstate', 'characterName', 'BF_Ghost'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'cup/CupDeath'); --put in mods/sounds/

    makeAnimatedLuaSprite('CupTitle','indie/cup/ready_wallop',-350,0)
    setLuaSpriteScrollFactor('CupTitle',0,0)
    addAnimationByPrefix('CupTitle','Ready?','Ready? WALLOP!',24,false)
    objectPlayAnimation('CupTitle','Ready?',false)
    scaleObject('CupTitle',0.8,0.8)
    setObjectCamera('CupTitle','hud')


   
    if not lowQuality then
        makeAnimatedLuaSprite('CupThing','indie/cup/the_thing2.0',-345,-200)
        setLuaSpriteScrollFactor('CupThing',0,0)
        addAnimationByPrefix('CupThing','BOO','BOO instance 1',20,false)
        objectPlayAnimation('CupThing','BOO',false)
        scaleObject('CupThing',1.6,1.6)
        addLuaSprite('CupThing',true)
        setObjectCamera('CupThing', 'hud');
    end
    runTimer('CupReady',0.5)
end

function onUpdate(elapsed)   
 Random = math.random(0,1)

    if getProperty('CupTitle.animation.curAnim.finished') == true then
        removeLuaSprite('CupTitle',true)
    end

    if getProperty('CupThing.animation.curAnim.finished') == true then
        removeLuaSprite('CupThing',true)
    end
end


function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'CupReady' then
		if Random == 0 then
			playSound('cup/intros/angry/0')
        end
		if Random == 1 then
			playSound('cup/intros/angry/1')
		end
		addLuaSprite('CupTitle',true)
	end
end
]]

