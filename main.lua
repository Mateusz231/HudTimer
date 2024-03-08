local mod = RegisterMod("HudTimer", 1)

local startTime = 0 -- Start time in milliseconds



function mod:RenderHUD()
    local Hud = Options.ExtraHUDStyle
    local game = Game()
    local room = game:GetRoom()
    local player = Isaac.GetPlayer(0)
    local currentTime = game:GetFrameCount() - startTime
    local seconds = math.floor(currentTime / 30)
    local minutes = math.floor(seconds / 60)
    local hours = math.floor(minutes / 60)
    local width = Isaac.GetScreenWidth()

    -- Update current time
    seconds = seconds % 60
    minutes = minutes % 60


    local room = Game():GetLevel()
   
    local room2= room:GetCurrentRoomDesc()
    local currentStage = room:GetStage()
    
    local Delirium = room2.DeliriumDistance

    local tab = false
	


    local f = Font()


    -- Choose your font --
-- f:Load("font/terminus.fnt")
-- f:Load("font/droid.fnt")
-- f:Load("font/luamini.fnt")
-- f:Load("font/luaminioutlined.fnt")
-- f:Load("font/terminus8.fnt")
-- f:Load("font/upheaval.fnt")
-- f:Load("font/upheavalmini.fnt")


    
  
    if Hud==0 or Hud==1 then
        if f:IsLoaded() then
        f:unload()    
    end
    
    elseif Hud==2 then

 
        if Input.IsActionPressed(ButtonAction.ACTION_MAP,0) or Input.IsActionTriggered(ButtonAction.ACTION_MAP,0) then 
            tab=true
            end
   
        if tab == false then  


        f:Load("font/pftempestasevencondensed.fnt")
        tab=false
        f:DrawString(string.format("Time: %02d:%02d:%02d", hours, minutes, seconds), (width/2)-37, 5,KColor(255,255,255,255),0,true)

   

        if(currentStage==12) then 
            f:DrawString(string.format("Delirium Distance: %02d", Delirium), 40, 20, KColor(255, 255, 255, 255), 0, true)
        end


    end
    

end

end




mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.RenderHUD) 

