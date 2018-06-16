--SetEntityCoords(GetPlayerPed(-1), 994.5925, -3002.594, -39.64699)

-- SetEntityCoords(GetPlayerPed(-1), 2885.7807617188,4387.224609375,50.735790252686)


--SetEntityCoords(GetPlayerPed(-1), -457.3439,-367.327454,-186.954788)   HOSPITAL

SetEntityCoords(GetPlayerPed(-1), 1699.408203125, 2498.166015625, -78.032363891602)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        HideHudComponentThisFrame(1)
        HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(13)
        HideHudComponentThisFrame(14)
        HideHudComponentThisFrame(17)
        HideHudComponentThisFrame(20)
    
    end
end)

-- VOIP

local voice = {default = 5.0, shout = 12.0, whisper = 1.0, current = 1, level = "Normal"}

function drawLevel(r, g, b, a)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextScale(0.5, 0.5)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString("~b~Voice:~s~ " .. voice.level)
  DrawText(0.175, 0.90)
end



Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustPressed(1, 74) and IsControlPressed(1, 21) then
      voice.current = (voice.current + 1) % 3
      if voice.current == 1 then
        NetworkSetTalkerProximity(voice.default)
        voice.level = "Normal"
      elseif voice.current == 2 then
        NetworkSetTalkerProximity(voice.shout)
        voice.level = "Shouting"
      elseif voice.current == 3 then
        NetworkSetTalkerProximity(voice.whisper)
        voice.level = "Whisper"
      end
    end

    if voice.current == 1 then
      voice.level = "Normal"
    elseif voice.current == 2 then
      voice.level = "Shouting"
    elseif voice.current == 3 then
      voice.level = "Whisper"
    end
    if NetworkIsPlayerTalking(PlayerId()) then
      drawLevel(255, 0, 188, 255)
    elseif not NetworkIsPlayerTalking(PlayerId()) then
      drawLevel(185, 185, 185, 255)
    end
  end
end)
