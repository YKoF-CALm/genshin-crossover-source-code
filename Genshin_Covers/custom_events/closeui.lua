-- Event notes hooks
function onEvent(name, value1)
    if name == "closeui" then
        if value1 >= 1 then
            showOnlyStrums = true
        elseif value1 <= 0 then
            showOnlyStrums = false
        end
    end
end