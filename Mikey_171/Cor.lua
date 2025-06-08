local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local cor_message = true

local rolls = T{{'Fighter\'s Roll',5,9}, {'Monk\'s Roll',3,7}, {'Healer\'s Roll',3,7}, {'Corsair\'s Roll',5,9}, {'Ninja Roll',4,8},{'Hunter\'s Roll',4,8}, {'Chaos Roll',4,8}, {'Magus\'s Roll',2,6}, {'Drachen Roll',4,8}, {'Choral Roll',2,6},{'Beast Roll',4,8}, {'Samurai Roll',2,6}, {'Evoker\'s Roll',5,9}, {'Rogue\'s Roll',5,9}, {'Warlock\'s Roll',4,8},
	{'Puppet Roll',3,7}, {'Gallant\'s Roll',3,7}, {'Wizard\'s Roll',5,9}, {'Dancer\'s Roll',3,7}, {'Scholar\'s Roll',2,6},{'Naturalist\'s Roll',3,7}, {'Runeist\'s Roll',4,8}, {'Bolter\'s Roll',3,9}, {'Caster\'s Roll',2,7}, {'Courser\'s Roll',3,9},{'Blitzer\'s Roll',4,9}, {'Tactician\'s Roll',5,8}, {'Allies\' Roll',3,10}, {'Miser\'s Roll',5,7},
	{'Companion\'s Roll',2,10},{'Avenger\'s Roll',4,8},}; -- {name,lucky,unlucky}

local special_ammo = "Carapace Bullet"

local sets = {
    Idle = {},
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    Preshot = {},

    TP_LowAcc = {},
    TP_MidAcc = {},
    TP_HighAcc = {},
    TP_Mjollnir_Haste = {},

    Ranged_ACC = {},
    Ranged_ATK = {},

    QuickDraw = {},

    WS = {
    },
    WS_MidAcc = {},
    WS_HighAcc = {},
    WS_SlugShot = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    gFunc.EquipSet(sets.EnmityDown)
    -- handle all rolls
    if (ability.Name:contains('Roll')) then
        gFunc.EquipSet(sets.Dt);
        gFunc.EquipSet(sets.Rolls);
        if(action.Name == 'Phantom Roll') then
            gFunc.EquipSet(sets.PhantomRoll)
        end

        if gcinclude.CORmsg == false then return end

        for n = 1, #gcinclude.Rolls do
            if gcinclude.Rolls[n][1] == ability.Name then
                print(chat.header('GCinclude'):append('[' .. chat.warning(ability.Name) .. ']' .. '  [Lucky: ' .. chat.success(rolls[n][2]) .. ']  [Unlucky: ' .. chat.error(rolls[n][3]) .. ']'));
            end
        end
    elseif (ability.Name == 'Wild Card') then gFunc.EquipSet(sets.WildCard);
    elseif (ability.Name == 'Fold') then gFunc.EquipSet(sets.Fold);
    elseif (ability.Name == 'Random Deal') then gFunc.EquipSet(sets.RandomDeal);
    elseif (ability.Name == 'Snake Eye') then gFunc.EquipSet(sets.SnakeEye);
    elseif (ability.Name:contains('Shot')) and (ability.Name ~= 'Triple Shot') then
        gFunc.EquipSet(sets.QuickDraw);
        if (gcdisplay.GetCycle('Melee') == 'Acc') or (ability.Name == 'Dark Shot') or (ability.Name == 'Light Shot') then
            gFunc.EquipSet(sets.QuickDraw_Acc);
        end

        if(gcdisplay.GetCycle('StaffSwap') == 'On') then
            gcmelee.equipStaff(action)
        end
        gcmelee.equipObi(action)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot)

    local flurry = gData.GetBuffCount(265);

    if flurry > 0 then
        gFunc.EquipSet(sets.Preshot_FlurryI);
    end
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged_ACC)
    if (gcdisplay.GetCycle('Ranged') == 'Attack') then
        gFunc.EquipSet(sets.Ranged_ATK)
    end
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local equipment = gData.GetEquipment()
    if (equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
        print(chat.header('COR'):append(chat.message('Action Canceled: Special Ammo Protection')))
        gFunc.CancelAction()
    end

    local action = gData.GetAction()
    if (action.Name == 'Slug Shot') then
        gFunc.EquipSet(sets.WS_SlugShot)
    elseif (action.Name == 'Coronach') then
        gFunc.EquipSet(sets.WS_Coronach)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'msg'})
    gcdisplay.CreateCycle('Msg', {[1] = 'On', [2] = 'Off',})
    gcinclude.SetAlias(T{'ranged'})
    gcdisplay.CreateCycle('Ranged', {[1] = 'Accuracy', [2] = 'Attack',})
    gcinclude.SetAlias(T{'staffswap'})
    gcdisplay.CreateCycle('StaffSwap', {[1] = 'Off', [2] = 'On',})
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'ranged'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'ranged') then
        gcdisplay.AdvanceCycle('Ranged')
        gcinclude.Message('Ranged', gcdisplay.GetCycle('Ranged'))
    elseif(args[1] == 'msg') then
        gcdisplay.AdvanceCycle('Msg')
        gcinclude.Message('Msg', gcdisplay.GetCycle('Msg'))
     elseif(args[1] == 'staffswap') then
        gcdisplay.AdvanceCycle('StaffSwap')
        gcinclude.Message('StaffSwap', gcdisplay.GetCycle('StaffSwap'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()
    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local weather = gData.GetEnvironment();
    local target = gData.GetActionTarget();


    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()
    local action = gData.GetAction()

    if (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
    elseif (action.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);

        end
    elseif (sactionell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (action.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Macc);
        if (string.contains(action.Name, 'Aspir') or string.contains(action.Name, 'Drain')) then
            gFunc.EquipSet(sets.Drain);
        end
    end
end

return profile
