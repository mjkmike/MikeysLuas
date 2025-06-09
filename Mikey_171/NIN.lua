-- NIN will lose TP on many actions when switching to Staff.
-- Use "/lac disable Main" to prevent weapon swaps if this is not desired.
-- /locktp can be used as well however will lock Range and Ammo slots.

local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local shinobi_ring = true
local shinobi_ring_slot = 'Ring1'

local koga_tekko = true
local koga_tekko_plus_one = false

local uggalepih_pendant = false
local warlocks_mantle = false -- Don't add 2% to fastCastValue to this as it is SJ dependant

local fenrirs_stone = false -- Used for Evasion at night

-- Fill this out for which evasion pants to use at night / dusk to dawn
local night_time_eva_pants = ''
local dusk_to_dawn_eva_pants = 'Koga Hakama'

local sets = {
    Idle = {
        Head = 'Arh. Jinpachi +1',
        Neck = 'Evasion Torque',
        Ear1 = 'Pigeon Earring',
        Ear2 = 'Bloodbead Earring',
		Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
		Ring2 = 'Defending Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
        Legs = 'Dst. Subligar +1',
		Feet = 'Ninja Kyahan',
    },
    IdleALT = {},
    IdleDT = {
        Head = 'Arh. Jinpachi +1',
        Neck = 'Evasion Torque',
        Ear1 = 'Pigeon Earring',
        Ear2 = 'Bloodbead Earring',
		Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
		Ring2 = 'Defending Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
        Legs = 'Dst. Subligar +1',
		Feet = 'Ninja Kyahan',
    },
    IdleALTDT = {},
    Resting = {},
    Town = {		
        Head = 'Walahra Turban',
        Neck = 'Peacock charm',
        Ear1 = 'Tmph. Earring +1',
        Ear2 = 'Hades Earring +1',
        Body = 'Haubergeon +1',
        Hands = 'Dusk Gloves +1',
		Ring1 = 'Defending Ring',
		Ring2 = 'Harmonius Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'DEX+5'} },
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens +1',
    },
    Movement = {
        Hands = 'Dst. Mittens +1',
        Feet = 'Ninja Kyahan',
    },
    Movement_MDT = {
        Hands = 'Dst. Mittens +1',
        Feet = 'Ninja Kyahan',
    },

    DT = {
        Head = 'Arh. Jinpachi +1',
        Neck = 'Peacock Charm',
        Ear1 = 'Pigeon Earring',
        Ear2 = 'Bloodbead Earring',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
		Ring2 = 'Defending Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dusk Ledelsens +1',
    },
    MDT = { -- Shell IV provides 23% MDT
        Head = 'Green Ribbon +1',
        Neck = 'Evasion Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Ninja Chainmail',
        Hands = { Name = 'Dusk Gloves +1', Augment = { [1] = 'DEX+5'} },
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Merman\'s Ring', Augment = { [1] = 'VIT+5'} },
        Back = 'Lamia Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens +1',
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {
        Head = 'Optical Hat',
        Neck = 'Evasion Torque',
		Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Scp. Harness +1',
        Hands = { Name = 'Dusk Gloves +1', Augment = { [1] = 'DEX+5'} },
		Ring1 = 'Harmonius Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'DEX+5'} },
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dance shoes',
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
    },
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
    	Head = 'Walahra Turban',
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'DEX+5'} },
		Hands = { Name = 'Dusk Gloves +1', Augment = { [1] = 'DEX+5'} },
		Feet = 'Dusk Ledelsens +1',
        Legs = 'Byakko\'s Haidate',
    },

    Hate = {
        Ear1 = 'Hades Earring +1',
		Ring1 = 'Mermaid Ring',
		Back = 'Resentment Cape',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'STR+5'} },
    },
    NinDebuff = {        
        Head = 'Ninja Hatsuburi',
		Neck = 'Justice Badge',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Heims Earring',
		Body = 'Yasha Samue',
		Hands = { Name = 'Dusk Gloves', Augment = { [1] = 'INT+5'} },
        Ring1 = 'Snow ring',
        Ring2 = 'Snow ring',
        Back = { Name = 'Traveler\'s Mantle', Augment = { [1] = 'INT+5'} },
		Waist = 'Hachirin-no-Obi',
		Legs = 'Yasha Hakama',
        Feet = 'Koga Kyahan',
    },
    NinElemental = {
        Head = 'Ninja Hatsuburi',
		Neck = 'Justice Badge',
        Ear1 = 'Morion Earring +1',
        Ear2 = 'Moldavite Earring',
		Body = 'Yasha Samue',
		Hands = { Name = 'Dusk Gloves', Augment = { [1] = 'INT+5'} },
        Ring1 = { Name = 'Snow ring', Augment = { [1] = 'INT+5'} },
        Ring2 = { Name = 'Snow ring', Augment = { [1] = 'INT+5'} },
		Back = { Name = 'Traveler\'s Mantle', Augment = { [1] = 'INT+5'} },
		Waist = 'Hachirin-no-Obi',
		Legs = 'Yasha Hakama',
		Feet = 'Koga Kyahan',
    },
    NinElemental_Accuracy = {},
    DrkDarkMagic = {},

    Enhancing = {},
    Cure = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
		Head = 'Walahra Turban',
        Neck = 'Chivalrous Chain',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Ninja Chainmail',
        Hands = { Name = 'Dusk Gloves +1', Augment = { [1] = 'DEX+5'} },
		Ring1 = 'Harmonius Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle +1',
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'DEX+5'} },
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens +1',
    },
    TP_MidAcc = {		
		Head = 'Walahra Turban',
        Neck = 'Peacock charm',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Ninja Chainmail',
        Hands = { Name = 'Dusk Gloves +1', Augment = { [1] = 'DEX+5'} },
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle +1',
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'DEX+5'} },
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens +1',
    },
    TP_HighAcc = {		
        Head = 'Optical hat',
        Neck = 'Peacock charm',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Haubergeon +1',
        Hands = { Name = 'Dusk Gloves +1', Augment = { [1] = 'DEX+5'} },
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Life Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens +1',
    },
    TP_Mjollnir_Haste = {},

    WS = {		
        Head = 'Voyager Sallet',
        Neck = 'Fotia Gorget',
        Ear1 = 'Tmph. Earring +1',
        Ear2 = 'Brutal Earring',
        Body = 'Haubergeon +1',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Harmonius Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Cerberus Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'STR+5'} },
        Legs = 'Byakko\'s Haidate',
        Feet = 'Rutter Sabatons',
    },
    WS_MidAcc = {},
    WS_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Fotia Gorget',
        Ear1 = 'Tmph. Earring +1',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon +1',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Harmonius Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'life Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Rutter Sabatons',
    },
    eepy = {
		Neck = 'Berserker\'s Torque'
	},

    WS_BladeJin = {},
    WS_BladeKu = {},

    Ranged = {}, -- This won't work for automatically swapping shurikens, only other equipment
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

local NinDebuffs = T{ 'Kurayami: Ni', 'Hojo: Ni', 'Jubaku: Ichi', 'Dokumori: Ichi', 'Kurayami: Ichi', 'Hojo: Ichi' }
local DrkDebuffs = T{ 'Bind', 'Sleep', 'Poison' }
local DrkDarkMagic = T{ 'Stun', 'Aspir', 'Drain', 'Absorb-AGI', 'Absorb-VIT' }
local NinElemental = T{
    'Hyoton: Ni', 'Katon: Ni', 'Huton: Ni', 'Doton: Ni', 'Raiton: Ni', 'Suiton: Ni',
    'Hyoton: Ichi', 'Katon: Ichi', 'Huton: Ichi', 'Doton: Ichi', 'Raiton: Ichi', 'Suiton: Ichi',
    'Hyoton: San', 'Katon: San', 'Huton: San', 'Doton: San', 'Raiton: San', 'Suiton: San'
}

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    gFunc.EquipSet(sets.Hate)
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged)
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Blade: Jin') then
        gFunc.EquipSet(sets.WS_BladeJin)
    elseif (action.Name == 'Blade: Ku') then
        gFunc.EquipSet(sets.WS_BladeKu)
    end

    local environment = gData.GetEnvironment()
    if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
        gFunc.Equip('Hands', 'Koga Tekko')
    end
    if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
        gFunc.Equip('Hands', 'Kog. Tekko +1')
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'nuke'})
    gcdisplay.CreateCycle('Nuke', {[1] = 'Potency', [2] = 'Accuracy',})
    gcinclude.SetAlias(T{'staff'})
    gcdisplay.CreateCycle('Staff', {[1] = 'Katana', [2] = 'Staff',})
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'nuke'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'nuke') then
        gcdisplay.AdvanceCycle('Nuke')
        gcinclude.Message('Nuke', gcdisplay.GetCycle('Nuke'))
    elseif (args[1] == 'staff') then
        gcdisplay.AdvanceCycle('Staff')
        gcinclude.Message('Staff', gcdisplay.GetCycle('Staff'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    if (player.Status == 'Engaged') then
        if (shinobi_ring and player.HPP <= 75 and player.TP <= 1000) then
            gFunc.Equip(shinobi_ring_slot, 'Shinobi Ring')
        end
        if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Hands', 'Koga Tekko')
        end
        if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
            gFunc.Equip('Hands', 'Kog. Tekko +1')
        end
    end

    gcmelee.DoDefaultOverride()

    if (gcdisplay.IdleSet == 'Evasion') then
        if (fenrirs_stone and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Ammo', 'Fenrir\'s Stone')
        end
        if (night_time_eva_pants ~= '' and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Legs', night_time_eva_pants)
        end
        if (dusk_to_dawn_eva_pants ~= '' and (environment.Time < 7 or environment.Time >= 17)) then
            gFunc.Equip('Legs', dusk_to_dawn_eva_pants)
        end
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle) then
        gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.Equip('Back', 'Warlock\'s Mantle')
    else
        gcmelee.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    if (shinobi_ring and player.HPP <= 75 and player.TP <= 1000) then
        gFunc.Equip(shinobi_ring_slot, 'Shinobi Ring')
    end
    if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
        gFunc.Equip('Hands', 'Kog. Tekko +1') -- You can comment this out if you have Dusk Gloves +1 and would prefer +22 HP over Ninja Tool Expertise.
    end

    local action = gData.GetAction()
    if (action.Skill == 'Ninjutsu') then
        if (NinDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.NinDebuff)
            if(gcdisplay.GetCycle('Staff') == 'staff') then
                gcmelee.equipStaff(action)
            end
            gcmelee.equipObi(action)
        elseif (NinElemental:contains(action.Name)) then
            gFunc.EquipSet(sets.NinElemental)
            if (gcdisplay.GetCycle('Nuke') == 'Accuracy') then
                gFunc.EquipSet(sets.NinElemental_Accuracy)
            end
            if (action.MppAftercast < 51) and uggalepih_pendant then
                gFunc.Equip('Neck', 'Uggalepih Pendant')
            end
            if(gcdisplay.GetCycle('Staff') == 'staff') then
                gcmelee.equipStaff(action)
            end
            gcmelee.equipObi(action)
        end
    elseif (action.Skill == 'Enfeebling Magic') then
        if (DrkDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Hate)
        end
            if(gcdisplay.GetCycle('Staff') == 'staff') then
                gcmelee.equipStaff(action)
            end
            gcmelee.equipObi(action)
    elseif (action.Skill == 'Dark Magic') then
        if (DrkDarkMagic:contains(action.Name)) then
            gFunc.EquipSet(sets.DrkDarkMagic)
        end
        if(gcdisplay.GetCycle('Staff') == 'Staff') then
            gcmelee.equipStaff(action)
        end
        gcmelee.equipObi(action)
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing)
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure)
    end
end


return profile
