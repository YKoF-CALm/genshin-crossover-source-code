-- making it closer to the version I use instead of the one everyone uses. if a different one needs to be written for the stage, just close this one though you can still use this as a template.

xx = 0
yy = 0
xx2 = 0
yy2 = 0

ofs = 10
followChars = true
bfIdle = false
dadIdle = false

oppCamOfs = {}
plyCamOfs = {}
oppStgOfs = {}
plyStgOfs = {}

function onCreate()
	-- adding this so I can toggle the followChars in other modcharts. will set followChars based on visibility so use setProperty('followCharsObj.')
	makeLuaSprite('followCharsObj', '', -10000, -10000)
	makeGraphic('followCharsObj', 1, 1, '000000')
	addLuaSprite('followCharsObj', true)

	loadCamOffsets()

	if mustHitSection == true then
		snapCam(getMidpointX(playerFocus..'') - 100 - plyCamOfs[1] + plyStgOfs[1] - 50, getMidpointY(playerFocus..'') - 100 + plyCamOfs[2] + plyStgOfs[2] - 50)
	else
		snapCam(getMidpointX(opponentFocus..'') + 150 + oppCamOfs[1] + oppStgOfs[1] + 50, getMidpointY(opponentFocus..'') - 100 + oppCamOfs[2] + oppStgOfs[2] - 50)
	end	
end

autoCamera = true

function onEvent(n, v1, v2)
	if n == 'Get Moving Camera Pos' then
		debugPrint('xx: '..xx..' yy: '..yy)
		debugPrint('xx2: '..xx2..' yy2: '..yy)
	end

	if n == 'Change Moving Camera Pos' then
		autoCamera = false

		local opTable = {}
		local plTable = {}

		loadCamOffsets()

		for val in string.gmatch(v1, "[^%s]+") do
			table.insert(opTable, val)	
		end

		for val in string.gmatch(v2, "[^%s]+") do
			table.insert(plTable, val)	
		end

		if #opTable ~= 2 then
			opTable[1] = getMidpointX(opponentFocus..'') + 150 + oppCamOfs[1] + oppStgOfs[1]
			opTable[2] = getMidpointY(opponentFocus..'') - 100 + oppCamOfs[2] + oppStgOfs[2]
		end

		if #plTable ~= 2 then
			plTable[1] = getMidpointX(playerFocus..'') - 100 - plyCamOfs[1] + plyStgOfs[1]
			plTable[2] = getMidpointY(playerFocus..'') - 0 + plyCamOfs[2] + plyStgOfs[2]
		end

		xx = opTable[1]
		yy = opTable[2]
		xx2 = plTable[1]
		yy2 = plTable[2]

		--debugPrint(xx..' '..yy)
		--debugPrint(xx2..' '..yy2)
	end

	if n == 'Change Moving Camera Focus' then
		if v1 ~= '' then
			opponentFocus = v1
		end

		if v2 ~= ''  then
			playerFocus = v2
		end
	end
end

opponentFocus = 'dad'
playerFocus = 'boyfriend'

function onUpdate()
	ofs = 20 * (0.9/getProperty('camGame.zoom'))

	followChars = getProperty('followCharsObj.visible')

	-- normally using getPropertyFromGroup wouldn't work for cameraPosition but I changed the getPropertyFromGroup function so now it does.

	if autoCamera == true then
		local oppCamOfs = getProperty(opponentFocus..'.cameraPosition')
		local plyCamOfs = getProperty(playerFocus..'.cameraPosition')

		xx = getMidpointX(opponentFocus..'') + 150 + oppCamOfs[1] + oppStgOfs[1]
		yy = getMidpointY(opponentFocus..'') - 100 + oppCamOfs[2] + oppStgOfs[2]
		xx2 = getMidpointX(playerFocus..'') - 100 - plyCamOfs[1] + plyStgOfs[1]
		yy2 = getMidpointY(playerFocus..'') - 0 + plyCamOfs[2] + plyStgOfs[2]
	end

	
	if checkIdle(opponentFocus..'') == true and mustHitSection == false and followChars == true then
		dadIdle = true
		bfIdle = false
	
		if getProperty(opponentFocus..'.animation.curAnim.curFrame') < 4 then
			triggerEvent('Camera Follow Pos', xx, yy + 10)
		end

		if getProperty(opponentFocus..'.animation.curAnim.curFrame') >= 4 then
			triggerEvent('Camera Follow Pos', xx, yy)
		end
    end

    if checkIdle(playerFocus..'') == true and mustHitSection == true and followChars == true then
		bfIdle = true
		dadIdle = false

		if getProperty(playerFocus..'.animation.curAnim.curFrame')< 4 then
			triggerEvent('Camera Follow Pos', xx2, yy2 + 10)
		end

		if getProperty(playerFocus..'.animation.curAnim.curFrame') >= 4 then
			triggerEvent('Camera Follow Pos', xx2, yy2)
		end
    end	
end

function checkIdle(char)
	if getProperty(char..'.animation.curAnim.name') == 'idle' or getProperty(char..'.animation.curAnim.name') == 'danceRight' then
		return true
	end
end

function opponentNoteHit(id, note, noteType, isSustain)
	if mustHitSection == false and followChars == true then
        if note == 0 then
            triggerEvent('Camera Follow Pos', xx-ofs, yy)
        elseif note == 1 then
            triggerEvent('Camera Follow Pos', xx, yy+ofs)
        elseif note == 2 then
            triggerEvent('Camera Follow Pos', xx, yy-ofs)
        elseif note == 3 then
            triggerEvent('Camera Follow Pos', xx+ofs, yy)
        else
            triggerEvent('Camera Follow Pos', xx, yy)
        end
    end

	dadIdle = false
	bfIdle = false
end

function goodNoteHit(id, note, noteType, isSustain)
	if mustHitSection == true and followChars == true then
        if note == 0 then
            triggerEvent('Camera Follow Pos', xx2-ofs, yy2)
        elseif note == 1 then
            triggerEvent('Camera Follow Pos', xx2, yy2+ofs)
        elseif note == 2 then
            triggerEvent('Camera Follow Pos', xx2, yy2-ofs)
        elseif note == 3 then
            triggerEvent('Camera Follow Pos', xx2+ofs, yy2)
        else
            triggerEvent('Camera Follow Pos', xx2, yy2)
        end
    end

	dadIdle = false
	bfIdle = false
end

function loadCamOffsets()
	oppCamOfs = getProperty(opponentFocus..'.cameraPosition')
	plyCamOfs = getProperty(playerFocus..'.cameraPosition')
	oppStgOfs = getProperty('opponentCameraOffset')
	plyStgOfs = getProperty('boyfriendCameraOffset')
end