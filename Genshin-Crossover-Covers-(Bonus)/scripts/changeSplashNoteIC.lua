local splashCount = 0;
local enabled = false;

local splashThing = 'note splash purple 1';

local fuck = 0;

local sickTrack = 0;

local enableNewSystem = true; -- Toggles Psych Splashes or New Splashes On/Off

local texture = 'notesplashes/IC_NoteSplash';

local disableDefaultSplash = true;


-- No longer messes with your ClientPrefs! Which means Note Splashes no longer randomly turn off!

-- function onCreate()
-- 	preCacheShit()
-- end

function onCreatePost()
	if enableNewSystem then
		enabled = getPropertyFromClass('ClientPrefs', 'noteSplashes');
	else
		enabled = false;
	end
	makeAnimatedLuaSprite('noteSplashp', texture, 100, 100);
	addLuaSprite('noteSplashp');
	runTimer('precacheshit', 0.3, 1)
	setObjectCamera('noteSplashp', 'hud')
    -- setProperty('noteSplashp.alpha', 0.0)
end

function goodNoteHit(note, direction, type, sus)
	if sickTrack < getProperty('sicks') then
		sickTrack = sickTrack + 1;
	end
    if not sus then
		if type == 'Blue Bone Note' then

			splashThing = 'note splash blue 1'

			disableDefaultSplash = true
			spawnCustomSplash(note, direction, type, sus);
		elseif type == 'Orange Bone Note' or type == 'PapyrusNote' then

			splashThing = 'note splash orange 1'
			disableDefaultSplash = true
			spawnCustomSplash(note, direction, type, sus);

		elseif type == 'CupheadNote' then

			splashThing = 'note splash purple 1'
			spawnCustomSplash(note, direction, type, sus);
			disableDefaultSplash = true

		elseif type == 'BendySplashNote' then
			doTweenColor('SplashBendy','noteSplash' .. splashCount,'000000',1,'linear')
			splashThing = 'note splash purple 1'
			spawnCustomSplash(note, direction, type, sus);
			disableDefaultSplash = true
		end
	end
end

function spawnCustomSplash(note, direction, type, sus)
	if enabled then
		splashCount = splashCount + 1;

		makeAnimatedLuaSprite('noteSplash' .. splashCount, texture, getPropertyFromGroup('playerStrums', direction, 'x'), getPropertyFromGroup('playerStrums', direction, 'y'));

		addAnimationByPrefix('noteSplash' .. splashCount, 'anim', splashThing, 22, false);
		addLuaSprite('noteSplash' .. splashCount);
		 -- objectPlayAnimation('noteSplash' .. splashCount, 'anim')

		setProperty('noteSplash' .. splashCount .. '.offset.x', 85);
		setProperty('noteSplash' .. splashCount .. '.offset.y', 85);
			-- setProperty('noteSplash' .. splashCount .. '.scale.y', 0.9);
			-- setProperty('noteSplash' .. splashCount .. '.scale.x', 0.9);
		setProperty('noteSplash' .. splashCount .. '.alpha', 0.6);
		setObjectCamera('noteSplash' .. splashCount, 'hud');
		setObjectOrder('noteSplash' .. splashCount, 9999); -- this better make the splashes go in front-
		setObjectOrder('timeBarBG', 99999);
		setObjectOrder('timeBar', 999999);
		setObjectOrder('timeTxt', 9999999);
	end
end

function onUpdatePost()
	if enabled then
		for i = 0, splashCount do
			if getProperty('noteSplash' .. i .. '.animation.curAnim.finished') then
				removeLuaSprite('noteSplash' .. i);
				disableDefaultSplash = false
			end
		end
		for s = 0, getProperty('grpNoteSplashes.length')-1 do
			if disableDefaultSplash then
				 setPropertyFromGroup('grpNoteSplashes', s, 'visible', false);
			else
				setPropertyFromGroup('grpNoteSplashes', s, 'visible', true);
			end
		end
	end
end
function onTimerCompleted(tag)
	if tag == 'precacheshit' then
		setProperty('noteSplashp.alpha', 0.0)
    end
end

-- function preCacheShit()
--     precacheImage(texture)
-- end