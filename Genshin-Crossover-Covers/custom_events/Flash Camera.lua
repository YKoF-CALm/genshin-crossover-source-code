function onEvent(n,v1,v2)
	if n == 'Flash Camera' then
		local cam = "camGame"
		local color = "FFFFFF"

		if v1 ~= "" then
			cam = v1
		end

		if v2 ~= "" then
			color = v2
		end
		
		cameraFlash(cam, color, 1, true)
	end
end