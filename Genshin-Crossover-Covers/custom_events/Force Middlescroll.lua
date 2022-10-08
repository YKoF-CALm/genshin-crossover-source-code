-- function onSongStart()
	-- debugPrint('Player strum above')
	-- debugPrint(defaultPlayerStrumX0)
	-- debugPrint(defaultPlayerStrumX1)
	-- debugPrint(defaultPlayerStrumX2)
	-- debugPrint(defaultPlayerStrumX3)
	-- debugPrint('Opponent strum above')
	-- debugPrint(defaultOpponentStrumX0)
	-- debugPrint(defaultOpponentStrumX1)
	-- debugPrint(defaultOpponentStrumX2)
	-- debugPrint(defaultOpponentStrumX3)
-- end

function onEvent(name, value1, value2)
	if name == 'Force Middlescroll' then
		duration = value2
		if value1 == 'On' then
			if middlescroll == false then
				noteTweenX("om1",0,412,duration,"smoothStepInOut")
				noteTweenX("om2",1,524,duration,"smoothStepInOut")
				noteTweenX("om3",2,636,duration,"smoothStepInOut")
				noteTweenX("om4",3,748,duration,"smoothStepInOut")
				noteTweenX("p1",4,412,duration,"smoothStepInOut")
				noteTweenX("p2",5,524,duration,"smoothStepInOut")
				noteTweenX("p3",6,636,duration,"smoothStepInOut")
				noteTweenX("p4",7,748,duration,"smoothStepInOut")
			end
			noteTweenAlpha("o1",0,0,duration,"smoothStepInOut")
			noteTweenAlpha("o2",1,0,duration,"smoothStepInOut")
			noteTweenAlpha("o3",2,0,duration,"smoothStepInOut")
			noteTweenAlpha("o4",3,0,duration,"smoothStepInOut")
		elseif value1 == 'Off' then
			if middlescroll == false then
				noteTweenX("om1",0,92,duration,"smoothStepInOut")
				noteTweenX("om2",1,204,duration,"smoothStepInOut")
				noteTweenX("om3",2,316,duration,"smoothStepInOut")
				noteTweenX("om4",3,428,duration,"smoothStepInOut")
				noteTweenAlpha("o1",0,1,duration,"smoothStepInOut")
				noteTweenAlpha("o2",1,1,duration,"smoothStepInOut")
				noteTweenAlpha("o3",2,1,duration,"smoothStepInOut")
				noteTweenAlpha("o4",3,1,duration,"smoothStepInOut")
				noteTweenX("p1",4,732,duration,"smoothStepInOut")
				noteTweenX("p2",5,844,duration,"smoothStepInOut")
				noteTweenX("p3",6,956,duration,"smoothStepInOut")
				noteTweenX("p4",7,1068,duration,"smoothStepInOut")
			else
				noteTweenAlpha("o1",0,0.5,duration,"smoothStepInOut")
				noteTweenAlpha("o2",1,0.5,duration,"smoothStepInOut")
				noteTweenAlpha("o3",2,0.5,duration,"smoothStepInOut")
				noteTweenAlpha("o4",3,0.5,duration,"smoothStepInOut")
			end
		else
			debugPrint('Invalid Force Middlescroll value.')
		end
	end
end