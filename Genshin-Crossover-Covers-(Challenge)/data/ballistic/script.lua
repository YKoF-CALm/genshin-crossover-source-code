function onCreate()
    setProperty('dad.y', getProperty('dad.y') - 10)
end

function onCreatePost()
	if not lowQuality then
		addLuaScript('epicScripts/infishake')
		addLuaScript('epicScripts/cam')
	end
	addCharacterToList('bf-car', 'boyfriend');
end
