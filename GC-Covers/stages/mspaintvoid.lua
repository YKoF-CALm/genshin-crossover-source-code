function onCreate()

	makeLuaSprite('bg','jimmy/secret/mspaintvoid',-500,-500)
    scaleObject('bg', 2, 2)
    updateHitbox('bg')
	addLuaSprite('bg')
	setScrollFactor('bg',0,0)

end

function onBeatHit()
	
	objectPlayAnimation('bgcretins','idle',true)

end