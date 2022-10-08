function onCreate()
	if not lowQuality then
		makeAnimatedLuaSprite('Cuphead_Grain','crossed-out/Cuphead_Grain', 0, 0)
		addAnimationByPrefix('Cuphead_Grain','Geain instance ','Geain instance ',24, true)
		setObjectCamera('Cuphead_Grain', 'camHUD')	
		makeAnimatedLuaSprite('Cupheah_Filter','crossed-out/Cupheah_Filter', 0, 0)
		addAnimationByPrefix('Cupheah_Filter','Cupheadshit_gif instance ','Cupheadshit_gif instance ',24, true)
		setObjectCamera('Cupheah_Filter', 'camHUD')
	end
	addLuaSprite('Cuphead_Grain', true);
	addLuaSprite('Cupheah_Filter', true);
end