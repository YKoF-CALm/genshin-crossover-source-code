function onCreate()

	makeLuaSprite('sky', 'mrbeast/sky', -650, -400);
	addLuaSprite('sky',false)
	setScrollFactor('sky', 1.2, 1.2);

	makeAnimatedLuaSprite('sea', 'mrbeast/seaanim', -650,-450)
	addAnimationByPrefix('sea','seawave','clouds copy',24,true)
	addLuaSprite('sea',false)
	objectPlayAnimation('sea','seawave',false)
	setScrollFactor('sea', 1, 1);

	makeAnimatedLuaSprite('trashsea', 'mrbeast/seaanimtrash', -650,-450)
	addAnimationByPrefix('trashsea','seawave','clouds copy',24,true)
	addLuaSprite('trashsea',false)
	objectPlayAnimation('trashsea','seawave',false)
	setScrollFactor('sea', 1, 1);

	makeAnimatedLuaSprite('clouds', 'mrbeast/cloudsanim', -650,-400)
	addAnimationByPrefix('clouds','cloudlol','clouds',24,true)
	addLuaSprite('clouds',false)
	objectPlayAnimation('sea','cloudlol',false)
	setScrollFactor('clouds', 1, 1);

	makeLuaSprite('land', 'mrbeast/land', -650, -430);
	addLuaSprite('land',false)

	makeLuaSprite('trash', 'mrbeast/trash', -650, -430);
	addLuaSprite('trash',false)

	makeLuaSprite('trashgf', 'mrbeast/trashgf', -650, -480);
	addLuaSprite('trashgf',true)

	makeLuaSprite('text', 'mrbeast/text thing', -650, -360);
	addLuaSprite('text',true)

	setObjectCamera('text', 'camother')


	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	end
end