if game.PlaceId == 3311165597 then
	--AUTO BLOCK--
spawn(function()
    _G.blocking = true 

    while _G.blocking do
        wait(0.1)
        if game:GetService("Players").LocalPlayer.Status.Blocking.Value then
            local args = {
                [1] = true
            }
            game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
        end
    end
end)

--KI--
spawn(function()
    local targetKi = nil

    local function waitForKiValue()
        repeat
            wait()
        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Stats") and game.Players.LocalPlayer.Character.Stats:FindFirstChild("Ki") and game.Players.LocalPlayer.Character.Stats.Ki.Value
    end
    
    local function checkKiAndActivateAbility()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Stats") and game.Players.LocalPlayer.Character.Stats:FindFirstChild("Ki") then
            local kiValue = game.Players.LocalPlayer.Character.Stats.Ki.Value
            if kiValue < targetKi then
                local args = {[1] = "Blacknwhite27"}
                game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer(unpack(args))
            end
        end
    end
    
    while true do
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Stats") and game.Players.LocalPlayer.Character.Stats:FindFirstChild("Ki") then
            targetKi = game.Players.LocalPlayer.Character.Stats.Ki.MaxValue
        end
    
        waitForKiValue()
    
        while game.Players.LocalPlayer.Character do
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Stats") and game.Players.LocalPlayer.Character.Stats:FindFirstChild("Ki") then
                local maxKiValue = game.Players.LocalPlayer.Character.Stats.Ki.MaxValue
                if maxKiValue ~= targetKi then
                    targetKi = maxKiValue
                end
    
                checkKiAndActivateAbility()
                local kiValue = game.Players.LocalPlayer.Character.Stats.Ki.Value
                if kiValue >= targetKi then
                    break
                end
            end
            wait()
        end
    
        while game.Players.LocalPlayer.Character do
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Stats") and game.Players.LocalPlayer.Character.Stats:FindFirstChild("Ki") then
                local maxKiValue = game.Players.LocalPlayer.Character.Stats.Ki.MaxValue
                if maxKiValue ~= targetKi then
                    targetKi = maxKiValue
                end
    
                local kiValue = game.Players.LocalPlayer.Character.Stats.Ki.Value
                if kiValue < targetKi then
                    checkKiAndActivateAbility()
                end
            end
            wait()
        end
    end
end)

--AUTO MODE--
spawn(function()
    local plr = game.Players.LocalPlayer
    local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
    local taRemote = game:GetService("ReplicatedStorage").Package.Events.ta
    
    local Settings = {Tables = {Forms = {'SSJBUI','Ultra Ego','LBSSJ4','SSJB4','True God of Creation','True God of Destruction','Super Broly','LSSJG','LSSJ4','SSJG4','LSSJ3','SSJ5','Mystic Kaioken','LSSJ Kaioken','SSJ2 Kaioken','SSJR3','SSJB3','God Of Destruction','God Of Creation','Jiren Ultra Instinct', 'Mastered Ultra Instinct','Godly SSJ2', 'Ultra Instinct Omen', 'Evil SSJ','Blue Evolution','Dark Rose','Kefla SSJ2','SSJ Berserker','True Rose', 'SSJB Kaioken','SSJ Rose', 'SSJ Blue','Corrupt SSJ','SSJ Rage','SSJG','SSJ4','Mystic','LSSJ','SSJ3','Spirit SSJ','SSJ2 Majin','SSJ2','SSJ Kaioken','SSJ','FSSJ','Kaioken'}};Variables = {Farm = false}}
    
    
    local function transform()
        pcall(function()
            while true do
                for i,v in pairs(Settings.Tables.Forms) do
                    if equipRemote:InvokeServer(v) then
                        taRemote:InvokeServer()
                        break
                    end
                end
                repeat wait()
                    if plr.Character.Status.SelectedTransformation.Value ~= plr.Character.Status.Transformation.Value then
                        game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
                    end
                until game.Players.LocalPlayer.Character.Status.SelectedTransformation.Value == game.Players.LocalPlayer.Character.Status.Transformation.Value
                transform()
            end
        end)
    end
    
    transform()
    
    plr.CharacterRemoving:Connect(function()
        wait(3)
        transform()
    end)
end)

game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)


local plr = game.Players.LocalPlayer
 plr.CharacterRemoving:Connect(function()
              wait(3)
  game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
 game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
 game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
 game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
          end) 

	local player = game.Players.LocalPlayer
	local bosses = {
		workspace.Others.NPCs["SSJG Kakata"],
		workspace.Others.NPCs["Broccoli"],
		workspace.Others.NPCs["SSJB Wukong"],
		workspace.Others.NPCs["Kai-fist Master"],
		workspace.Others.NPCs["SSJ2 Wukong"],
		workspace.Others.NPCs["Perfect Atom"],
		workspace.Others.NPCs["Chilly"],
		workspace.Others.NPCs["Top X Fighter"],
		workspace.Others.NPCs["Mapa"],
        workspace.Others.NPCs["Radish"],
        workspace.Others.NPCs["Kid Nohag"],
        workspace.Others.NPCs["Klirin"],
        workspace.Others.NPCs["X Fighter Trainer"],
	}
	
	local lastBoss = ""
	
	while true do
	
	wait()
		if game:GetService("ReplicatedStorage").Datas[player.userId].Quest.Value == "" then
			wait(8)
			for _, boss in ipairs(bosses) do
				if boss.Name ~= lastBoss and workspace:FindFirstChild("Living") and workspace.Living:FindFirstChild(boss.Name) then
					game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(boss)
	
					if game:GetService("ReplicatedStorage").Datas[player.userId].Quest.Value == boss.Name then
						_G.Looping = true
		
						local moves = {
							"Wolf Fang Fist",
							"Mach Kick",
							"Meteor Crash",
							"Super Dragon Fist",
							"God Slicer",
							"High Power Rush",
							"Meteor Charge",
							"Spirit Breaking Cannon",
							"Bone Crusher"
						}
		
						local m6 = "Blacknwhite27"
						local Event = game:GetService("ReplicatedStorage").Package.Events.mel
						local ev2 =
						{
							["MouseHit"] = CFrame.new(1374.38293, 18.4018955, 1128.27454, 0.653480172, -0.157526895, 0.740370929, -0, 0.978105783, 0.208109155, -0.756943643, -0.135995209, 0.639172673),
							["FaceMouse"] = false
						}
		
						_G.PlayedSound = false
		
						while _G.Looping do
							wait()
							player.Character:SetPrimaryPartCFrame(workspace.Living[boss.Name].HumanoidRootPart.CFrame * CFrame.new(0, 0, 2))
							if game:GetService("ReplicatedStorage").Datas[player.userId].Quest.Value == "" then
								_G.Looping = false
								break
							end
							
							if not _G.PlayedSound then
								game:GetService("VirtualInputManager"):SendKeyEvent(true,"F",false,uwu)
								_G.PlayedSound = true
							end
							
							for _, move in ipairs(moves) do
								spawn(function()
									Event:InvokeServer(move, m6)
								end)
							end
							wait()
						end
						
						lastBoss = boss.Name
						break
					end
				else
					warn(boss.Name .. " is not a valid member of folder 'Workspace.Living'")
				end
			end
		end
	end
	end





    if game.PlaceId == 5151400895 then


        spawn(function()
        _G.blocking = true
        
        while _G.blocking do
            wait(0.1)
            if game:GetService("Players").LocalPlayer.Status.Blocking.Value == false then
                local args = {
                    [1] = true
                }
                game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
            end
        end
        end)
        
        --KI--
        spawn(function()
            local targetKi = nil
        
            local function waitForKiValue()
                repeat
                    wait()
                until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Stats") and game.Players.LocalPlayer.Character.Stats:FindFirstChild("Ki") and game.Players.LocalPlayer.Character.Stats.Ki.Value
            end
            
            local function checkKiAndActivateAbility()
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Stats") and game.Players.LocalPlayer.Character.Stats:FindFirstChild("Ki") then
                    local kiValue = game.Players.LocalPlayer.Character.Stats.Ki.Value
                    if kiValue < targetKi then
                        local args = {[1] = "Blacknwhite27"}
                        game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer(unpack(args))
                    end
                end
            end
            
            while true do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Stats") and game.Players.LocalPlayer.Character.Stats:FindFirstChild("Ki") then
                    targetKi = game.Players.LocalPlayer.Character.Stats.Ki.MaxValue
                end
            
                waitForKiValue()
            
                while game.Players.LocalPlayer.Character do
                    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Stats") and game.Players.LocalPlayer.Character.Stats:FindFirstChild("Ki") then
                        local maxKiValue = game.Players.LocalPlayer.Character.Stats.Ki.MaxValue
                        if maxKiValue ~= targetKi then
                            targetKi = maxKiValue
                        end
            
                        checkKiAndActivateAbility()
                        local kiValue = game.Players.LocalPlayer.Character.Stats.Ki.Value
                        if kiValue >= targetKi then
                            break
                        end
                    end
                    wait()
                end
            
                while game.Players.LocalPlayer.Character do
                    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Stats") and game.Players.LocalPlayer.Character.Stats:FindFirstChild("Ki") then
                        local maxKiValue = game.Players.LocalPlayer.Character.Stats.Ki.MaxValue
                        if maxKiValue ~= targetKi then
                            targetKi = maxKiValue
                        end
            
                        local kiValue = game.Players.LocalPlayer.Character.Stats.Ki.Value
                        if kiValue < targetKi then
                            checkKiAndActivateAbility()
                        end
                    end
                    wait()
                end
            end
        end)
        
        --AUTO MODE--
        spawn(function()
            local plr = game.Players.LocalPlayer
            local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
            local taRemote = game:GetService("ReplicatedStorage").Package.Events.ta
            
            local Settings = {Tables = {Forms = {'SSJBUI','Ultra Ego','LBSSJ4','SSJB4','True God of Creation','True God of Destruction','Super Broly','LSSJG','LSSJ4','SSJG4','LSSJ3','SSJ5','Mystic Kaioken','LSSJ Kaioken','SSJ2 Kaioken','SSJR3','SSJB3','God Of Destruction','God Of Creation','Jiren Ultra Instinct', 'Mastered Ultra Instinct','Godly SSJ2', 'Ultra Instinct Omen', 'Evil SSJ','Blue Evolution','Dark Rose','Kefla SSJ2','SSJ Berserker','True Rose', 'SSJB Kaioken','SSJ Rose', 'SSJ Blue','Corrupt SSJ','SSJ Rage','SSJG','SSJ4','Mystic','LSSJ','SSJ3','Spirit SSJ','SSJ2 Majin','SSJ2','SSJ Kaioken','SSJ','FSSJ','Kaioken'}};Variables = {Farm = false}}
            
            
            local function transform()
                pcall(function()
                    while true do
                        for i,v in pairs(Settings.Tables.Forms) do
                            if equipRemote:InvokeServer(v) then
                                taRemote:InvokeServer()
                                break
                            end
                        end
                        repeat wait()
                            if plr.Character.Status.SelectedTransformation.Value ~= plr.Character.Status.Transformation.Value then
                                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
                            end
                        until game.Players.LocalPlayer.Character.Status.SelectedTransformation.Value == game.Players.LocalPlayer.Character.Status.Transformation.Value
                        transform()
                    end
                end)
            end
            
            transform()
            
            plr.CharacterRemoving:Connect(function()
                wait(3)
                transform()
            end)
        end)
        
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
      
      
       local plr = game.Players.LocalPlayer
         plr.CharacterRemoving:Connect(function()
                      wait(3)
          game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
         game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
         game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
         game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
                  end) 

        local player = game.Players.LocalPlayer
        
        local humanoidRootPart
        repeat
            humanoidRootPart = game:GetService("Workspace").Living[player.Name].HumanoidRootPart
            wait()
        until humanoidRootPart and humanoidRootPart:IsDescendantOf(workspace.Living)
        
        local bosses = {
         workspace.Others.NPCs["Vekuta (SSJBUI)"],
		workspace.Others.NPCs["Wukong Rose"],
		workspace.Others.NPCs["Vekuta (LBSSJ4)"],
		workspace.Others.NPCs["Wukong (LBSSJ4)"],
		workspace.Others.NPCs["Vegetable (LBSSJ4)"],
		workspace.Others.NPCs["Vis (20%)"],
		workspace.Others.NPCs["Vills (50%)"],
		workspace.Others.NPCs["Wukong (Omen)"],
		workspace.Others.NPCs["Vegetable (GoD in-training)"],
        }
        local lastBoss = ""
            
            while true do
            
            wait()
                if game:GetService("ReplicatedStorage").Datas[player.userId].Quest.Value == "" then
                    wait(8)
                    for _, boss in ipairs(bosses) do
                        if boss.Name ~= lastBoss and workspace:FindFirstChild("Living") and workspace.Living:FindFirstChild(boss.Name) then
                            game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(boss)
                            if game:GetService("ReplicatedStorage").Datas[player.userId].Quest.Value == boss.Name then
                                _G.Looping = true
                
                                local moves = {
                                    "Wolf Fang Fist",
                                    "Mach Kick",
                                    "Meteor Crash",
                                    "Super Dragon Fist",
                                    "God Slicer",
                                    "High Power Rush",
                                    "Meteor Charge"
                                    
                                }
                
                                local m6 = "Blacknwhite27"
                                local Event = game:GetService("ReplicatedStorage").Package.Events.mel
                                local ev2 =
                                {
                                    ["MouseHit"] = CFrame.new(1374.38293, 18.4018955, 1128.27454, 0.653480172, -0.157526895, 0.740370929, -0, 0.978105783, 0.208109155, -0.756943643, -0.135995209, 0.639172673),
                                    ["FaceMouse"] = false
                                }
                
                                _G.PlayedSound = false
                
                                while _G.Looping do
                                    wait()
                                    
                                    
        if not player.Character or not player.Character:FindFirstChild("Humanoid") or player.Character.Humanoid.Health <= 0 then
                                       _G.Looping = false
                                 break
                               end
                                    player.Character:SetPrimaryPartCFrame(workspace.Living[boss.Name].HumanoidRootPart.CFrame * CFrame.new(0, 0, 2))
                                    if game:GetService("ReplicatedStorage").Datas[player.userId].Quest.Value == "" then
                                        _G.Looping = false
                                        break
                                    end
                                    
                                    if not _G.PlayedSound then
                                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"F",false,uwu)
                                        _G.PlayedSound = true
                                    end
                                    
                                     for _, move in ipairs(moves) do
                spawn(function()
                    -- Check if character is still alive before invoking move
                    if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                        Event:InvokeServer(move, m6)
                    end
                end)
            end
            wait()
        end
                                
                                lastBoss = boss.Name
                                break
                            end
                        else
                            warn(boss.Name .. " is not a valid member of folder 'Workspace.Living'")
                        end
                    end
                end
            end
        end
