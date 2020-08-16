local timer = 0
local baseTime = 0
local timeOffset = 0

Citizen.CreateThread(function()
    local hour = 0 -- 0 midnight / 12 noon
    local minute = 0
    while true do
        Wait(0)
        local newBaseTime = baseTime
        if GetGameTimer() - 500  > timer then
            -- 0.00 = Time Stop
            -- 0.01 is one min = one real world min
            -- if you want a quicker day cycle then you'll have to do math :P
            newBaseTime = newBaseTime + 0.01
            timer = GetGameTimer()
        end

        baseTime = newBaseTime
        hour = math.floor(((baseTime+timeOffset)/60)%24) -- 60min hours / 24 hours a day
        minute = math.floor((baseTime+timeOffset)%60) --60 sec per min
        NetworkClockTimeOverride(hour, minute, 0)


    end
end)


