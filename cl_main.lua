Citizen.CreateThread(function()

    while true do

        Citizen.Wait(10)

        if IsControlJustPressed(1,306) then
            menu()
        end

    end

end)



function menu()

    local menuTest = RageUI.CreateMenu("Vehicule","Made by evann™")
    local Vehicle = GetVehiclePedIsUsing(PlayerPedId())
    local VehicleNeonLight = false
    local playerPed = PlayerPedId()
    local veh = GetVehiclePedIsUsing(PlayerPedId())

    local enum WindowTints =  {  
	WINDOWTINT_NONE,    
	WINDOWTINT_DARKSMOKE 
};




    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()
        
            RageUI.Separator("--Portes--")
           
            RageUI.ButtonWithStyle("Ouvrir toutes les portes",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then    
                    for i = 0, 5 do
                        SetVehicleDoorOpen(Vehicle, i, false, true) -- on ouvre toutes les portes de 0-5
                      end
                end
            end)  

            

            RageUI.ButtonWithStyle("Fermer toutes les portes",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then 
                    for i = 0, 5 do
                        SetVehicleDoorShut(Vehicle, i, false) -- on ferme toutes les portes de 0-5
                      end  
                end
            end)

            RageUI.Separator("~g~--Moteur--")
            

            RageUI.Checkbox("Eteindre moteur",nil, etat,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    etat = Checked
                    if etat==true then
                        SetVehicleEngineOn(Vehicle, false, true, true)
                    else
                        SetVehicleEngineOn(Vehicle, true, true, true)
                    end
                end
            end)

            RageUI.Separator("~b~--Lumieres--")
           
           
            RageUI.Checkbox("Neons",nil, etat,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    etat = Checked
                    if etat==true then
                        SetVehicleNeonLightEnabled(Vehicle, 0, true)
                        SetVehicleNeonLightEnabled(Vehicle, 1, true)
                        SetVehicleNeonLightEnabled(Vehicle, 2, true)
                        SetVehicleNeonLightEnabled(Vehicle, 3, true)
                        SetVehicleNeonLightsColour(Vehicle, 222, 222, 225)                       
                    else 
                        SetVehicleNeonLightEnabled(Vehicle, 0, false)
                        SetVehicleNeonLightEnabled(Vehicle, 1, false)
                        SetVehicleNeonLightEnabled(Vehicle, 2, false)
                        SetVehicleNeonLightEnabled(Vehicle, 3, false)
                    end
                end
            end)

            
            RageUI.ButtonWithStyle("Rouge",nil, {RightLabel = "*"}, true, function(Hovered, Active, Selected)
                if Selected then 
                    SetVehicleNeonLightsColour(Vehicle, 255, 1, 1)    
                    
                end
            end)

            RageUI.ButtonWithStyle("Bleu",nil, {RightLabel = "*"}, true, function(Hovered, Active, Selected)
                if Selected then 
                    SetVehicleNeonLightsColour(Vehicle, 2, 21, 255)    
                    
                end
            end)


            RageUI.ButtonWithStyle("Jaune",nil, {RightLabel = "*"}, true, function(Hovered, Active, Selected)
                if Selected then 
                    SetVehicleNeonLightsColour(Vehicle, 255, 255, 0)    
                    
                end
            end)

            RageUI.ButtonWithStyle("Vert",nil, {RightLabel = "*"}, true, function(Hovered, Active, Selected)
                if Selected then 
                    SetVehicleNeonLightsColour(Vehicle, 0, 255, 240)    
                    
                end
            end)

            RageUI.ButtonWithStyle("Violet",nil, {RightLabel = "*"}, true, function(Hovered, Active, Selected)
                if Selected then 
                    SetVehicleNeonLightsColour(Vehicle, 35, 1, 255)    
                    
                end
            end)

            RageUI.Separator("~r~--Plaque--")
            
            
            RageUI.ButtonWithStyle("Plaque masqué",nil, {RightLabel = "*"}, true, function(Hovered, Active, Selected)
                if Selected then 
                    SetVehicleNumberPlateText(Vehicle, "Anonyme")    
                    
                end
            end)

            RageUI.Separator("--Phares--")

           
            RageUI.Checkbox("Phares xénons",nil, etat,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    etat = Checked
                    if etat==true then
                        ToggleVehicleMod(veh, 22, true) 
                        SetVehicleHeadlightsColour(veh, 2)
                    else
                        ToggleVehicleMod(veh, 22, false) 
                        SetVehicleHeadlightsColour(veh, 2)
                    end
                end
            end)
 
        

        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("Titre", true)
        end
        
    end

end