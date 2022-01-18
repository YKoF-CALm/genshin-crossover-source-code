function onEvent(name, value1, value2)
	if name == 'HitWithHand' then
		setProperty('health', getProperty('health')-0.25);
		playSound('punch', 1.7);
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		addHits(-1)
		cameraShake('camGame', 0.01, 0.2)
	end
end