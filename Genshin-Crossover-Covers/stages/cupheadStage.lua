function onCreate()
	-- background shit

	
	makeLuaSprite('Cup-BG-00', 'indie/cup/Cup-BG-00', -600, -250);
	setLuaSpriteScrollFactor('Cup-BG-00', 0.1, 0.1);
	scaleObject('Cup-BG-00',3,3)
    
	makeLuaSprite('Cup-BG-01', 'indie/cup/Cup-BG-01', -550, -100);
	setLuaSpriteScrollFactor('Cup-BG-01', 0.3, 0.3);
	scaleObject('Cup-BG-01',3,3)

	makeLuaSprite('Cup-BG-Ground', 'indie/cup/Cup-BG-Ground', -600, -100);
	scaleObject('Cup-BG-Ground',4,4)


	addLuaSprite('Cup-BG-00', false);
    addLuaSprite('Cup-BG-01', false);
	addLuaSprite('Cup-BG-Ground', false);
	if not lowQuality then
--[[
		makeAnimatedLuaSprite('CupheqdShid', 'indie/cup/CUpheqdshid',-350,-193);
		addAnimationByPrefix('CupheqdShid','dance','Cupheadshit_gif instance 1',24,true);
		objectPlayAnimation('CupheqdShid','Cupheadshit_gif instance',false)
		scaleObject('CupheqdShid',1.6,1.6)
		setLuaSpriteScrollFactor('CupheqdShid', 0, 0);
		setObjectCamera('CupheqdShid', 'hud')
	
		makeAnimatedLuaSprite('Grain', 'indie/cup/Grainshit',-350,-193);
		addAnimationByPrefix('Grain','dance','Geain instance 1',24,true);
		objectPlayAnimation('Grain','Geain instance 1',false)
		scaleObject('Grain',1.6,1.6)
		setLuaSpriteScrollFactor('Grain', 0, 0);
		setObjectCamera('Grain', 'hud')
	]]
		makeAnimatedLuaSprite('CupheqdShid', 'indie/cup/CUpheqdshid',0,0);
		addAnimationByPrefix('CupheqdShid','dance','Cupheadshit_gif instance 1',24,true);
		objectPlayAnimation('CupheqdShid','Cupheadshit_gif instance',false)
		--scaleObject('CupheqdShid',1.6,1.6)
		setLuaSpriteScrollFactor('CupheqdShid', 0, 0);
		setObjectCamera('CupheqdShid', 'other')

		makeAnimatedLuaSprite('Grain', 'indie/cup/Grainshit',0,0);
		addAnimationByPrefix('Grain','dance','Geain instance 1',24,true);
		objectPlayAnimation('Grain','Geain instance 1',false)
		--scaleObject('Grain',1.6,1.6)
		setLuaSpriteScrollFactor('Grain', 0, 0);
		setObjectCamera('Grain', 'other')

		addLuaSprite('CupheqdShid', true);
		addLuaSprite('Grain',true)
		end

end