local profile = {}

local fastCastValue = 0.07 -- 0.07 7% from gear
local cureCastValue = 0.39 -- 39% cast speed from materia
local parade_gorget = true

local hercules_ring = true
local hercules_ring_slot = 'Ring1'

local guardian_earring = true;
local guardian_earring_slot = 'Ear2'
local guardian_ring = true
local guardian_ring_slot = 'Ring1'

-- Replace these with '' if you do not have them
local gallant_leggings = 'Glt. Leggings +1'
local valor_leggings = 'Valor Leggings'

local arco_de_velocidad = false

local warlocks_mantle = false -- Don't add 2% to fastCastValue to this as it is SJ dependant

local shadow_mantle = true

local sets = {
    Idle = {
        Head = 'displaced',
        Body = 'Royal Cloak',
        Neck = 'Shield Torque',
        Ear1 = 'Pigeon Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 100 },
        Hands = 'Kaiser handschuhs',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Marid Belt', Augment = { [1] = 'VIT+5'} },
        Legs = { Name = 'koenig Diechlings', Priority = 10 },
        Feet = 'Glt. Leggings +1',
		Ammo = 'Iron Arrow',
    },
    IdleALT = {
    },
    IdleDT = {
        Head = 'Koenig Schaller',
        Neck = { Name = 'Shield Torque', Priority = 100 },
        Ear1 = 'Pigeon Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 25 },
        Body = 'Koenig Cuirass',
        Hands = 'Kaiser handschuhs',
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = { Name = 'Defending Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
        Legs = { Name = 'koenig Diechlings', Priority = 10 },
        Feet = { Name = 'Glt. Leggings +1', Priority = 90 },
        Ammo = 'Iron Arrow',
    },
    IdleALTDT = {
    },
    Resting = {
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
    },
    Town = {
        Head = 'Koenig Schaller',
        Neck = { Name = 'Shield Torque', Priority = 100 },
        Ear1 = 'Tmph. Earring +1',
        Ear2 = 'Hades Earring +1',
        Body = 'Haubergeon +1',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Defending Ring',
		Ring2 = 'Harmonius Ring',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
        Legs = 'Homam Cosciales',
        Feet = 'Dusk Ledelsens +1',
    },
    Movement = {
        Hands = 'Kaiser handschuhs',
        Legs = 'Crimson Cuisses',
        Feet = 'Koenig Schuhs',
    },
    Movement_MDT = {
        Hands = 'Coral Fng. Gnt. +1',
        Legs = 'Crimson Cuisses',
        Feet = 'Koenig Schuhs',
    },

    DT = {
        Head = 'Koenig Schaller',
        Body = 'Koenig Cuirass',
        Neck = { Name = 'Shield Torque', Priority = 100 },
        Ear1 = 'Pigeon Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 25 },
        Hands = 'Kaiser handschuhs',
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = { Name = 'Defending Ring', Priority = 100 }, -- 10
        Back = 'Shadow Mantle',
        Waist = 'Marid Belt',
        Legs = { Name = 'Koenig Diechlings', Priority = 10 },
        Feet = { Name = 'Glt. Leggings +1', Priority = 90 },
    },
    MDT = { -- Shell IV provides 23% MDT
        Head = 'Koenig Schaller',
        Neck = 'Shield Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Koenig Cuirass',
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Defending Ring', Augment = { [1] = 'VIT+5'} },
        Back = 'Lamia Mantle',
        Waist = { Name = 'Marid Belt', Augment = { [1] = 'VIT+5'} },
        Legs = 'Coral cuisses +1',
        Feet = 'Coral Greaves +1',
    },
    Meteor = {
        Head = 'Koenig Schaller',
		Neck = 'Ajase beads',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Koenig Cuirass',
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Bomb Queen ring',
        Ring2 = { Name = 'Defending Ring', Augment = { [1] = 'VIT+5'} },
        Back = 'Lamia Mantle',
        Waist = 'Jungle Sash',
        Legs = 'Coral cuisses +1',
        Feet = 'Coral Greaves +1',
    },
    FireRes = { -- 137
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Tmph. Earring +1', -- 12
        Ear2 = 'Crimson Earring', -- 10
        Body = 'Republic Harness', -- 6
        --Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Harmonius Ring', -- 10
        Back = 'Dino Mantle', -- 4
        Waist = 'Water Belt', -- 20
        Legs = 'Crimson Cuisses', -- 20
        Feet = 'Power Sandals', -- 7
    },
    IceRes = { -- 135
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Ram Mantle +1', -- 6
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = 'Blood Greaves', -- 21
    },
    LightningRes = { -- 138
        Range = 'Lightning Bow +1', -- 7
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Gaia Mantle +1', -- 12
        Waist = 'Earth Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Dst. Leggings +1',
    },
    EarthRes = { -- 143
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Gaia Mantle +1', -- 10
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Blood Greaves', -- 21
    },
    WindRes = { -- 118
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Ice Belt', -- 20
        Legs = 'Coral Cuisses +1',
        Feet = 'Blood Greaves', -- 21
    },
    WaterRes = { -- 128
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1', -- 4
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Lightning Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Coral Greaves +1', -- 4
    },
    Evasion = {
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 100 },
        Legs = { Name = 'Homam Cosciales', Priority = 120 },
    },
    Precast_Cure = {
		ammo = 'Bone Arrow',
		Head = 'Valor Coronet',
		Neck = 'Parade Gorget',
		Ear1 = 'Hospitaler Earring',
		Ear1 = 'Loquac. Earring', -- FC
        Body = 'Valor Surcoat',
        Hands = 'Valor Gauntlets',
		Ring1 = 'Mermaid Ring',
		Ring2 = 'Hercules\' Ring',
        Waist = 'Jungle Sash',
		Back = 'Resentment Cape',
        Legs = 'Homam Cosciales',
        Feet = 'Valor Leggings',
    },
    SIRD = {
        Head = { Name = 'Koenig Schaller', Priority = 30 },
        Neck = 'Willpower Torque', -- 5
        Ear2 = 'Knightly Earring', -- 9
        Body = 'Koenig Cuirass',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = { Name = 'Valor Breeches', Priority = 20 }, -- 10
        Feet = 'Mountain Gaiters', -- 5
        ammo = 'Iron Arrow',
    },
    Haste = {
        Head = { Name = 'Walahra turban', Priority = 100 }, -- 5
        Neck = 'Willpower Torque',
        Ear1 = 'Loquac. Earring', -- FC
        -- Ear2 = 'Magnetic Earring',
        Body = 'Koenig Cuirass',
        Hands = { Name = 'Dusk Gloves +1', Priority = 22 }, -- 4
        -- Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'VIT+5'} }, -- 6
        Legs = 'Homam Cosciales', -- 3
        Feet = 'Dusk Ledelsens +1', -- 3
        ammo = 'Iron Arrow',
    },
    Haste_Ichi = { -- Optional, provided here only if you wish to mix in SIRD or other stats over max haste
    },

    Hate = {
        Head = { Name = 'Aegishjalmr', Priority = 100 },
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hades Earring +1',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 120 },
        Body = { Name = 'Valor Surcoat', Priority = -100 },
        Hands = { Name = 'Valor Gauntlets', Priority = -100 },
        Ring1 = 'Hercules\' Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = { Name = 'Resentment Cape', Priority = 100 },
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Valor Breeches', Priority = -100 },
        Feet = 'Valor Leggings',
        ammo = 'Iron Arrow',

    },
    Hate_Flash = { -- Optional, provided here only if you wish to mix in haste or other stats over max +enmity
        Head = 'Walahra turban',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Hades Earring +1',
        Body = { Name = 'Valor Surcoat', Priority = -100 },
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Hercules\' Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = { Name = 'Resentment Cape', Priority = 100 },
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'VIT+5'} },
        Legs = { Name = 'Valor Breeches', Priority = -100 },
        Feet = 'Dusk Ledelsens +1',
        ammo = 'Iron Arrow',
    },
    Cheat_C3HPDown = { -- 1194
        Head = 'Gallant Coronet',
        Body = 'Haubergeon +1',
        Neck = 'Shield Torque',
        -- Ear1 = { Name = 'Magnetic Earring', Priority = 120 }, -- 8
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Knightly Earring', -- 9
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Vilma\'s ring', -- -25
		Ring2 = 'Serket Ring', -- -50
        Back = 'Shadow Mantle',
        Waist = 'Astral Rope',
        Legs = 'Valor Breeches', -- 10
        Feet = 'Mountain Gaiters', -- 5
    },
    Cheat_C3HPUp = { -- 1452
        Head = 'Aegishjalmr',
		Neck = 'Harmonia\'s Torque',
		Ear1 = 'Hospitaler Earring',
        Ear2 = 'Hades Earring +1',
        Body = 'Valor Surcoat',
        Hands = 'Valor Gauntlets',
		Ring1 = 'Bomb Queen ring',
		Ring2 = 'Sattva Ring',	
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
		Back = 'Cerb. Mantle +1',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings',
		ammo = 'Iron Arrow',
    },
    Cheat_C4HPDown = { -- 1142
        Head = 'Wivre Hairpin',
        Neck = 'Parade Gorget',
        Ear1 = 'Astral Earring',
        Ear2 = 'Knightly Earring', -- 9
        Body = 'Haubergeon +1',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Shadow Mantle',
        Waist = 'Astral Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters',
        ammo = 'Iron Arrow',
    },
    Cheat_C4HPUp = { -- 1654
        Head = 'Aegishjalmr',
        Neck = 'Ajase Beads',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Cassie Earring',
        Body = 'koenig Cuirass',
        Hands = 'Valor Gauntlets',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Bloodbead Ring',
        Back = 'Resentment Cape',
        Waist = 'Jungle Sash',
        Legs = 'Koenig Diechlings',
        Feet = 'Valor Leggings',
        ammo = 'Iron Arrow',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Walahra Turban',
        Neck = 'Chivalrous Chain',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Haubergeon +1',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Harmonius Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'DEX+5'} },
        Legs = 'Homam Cosciales',
        Feet = 'Dusk Ledelsens +1',
		Ammo = 'Iron Arrow',
    },
    TP_MidAcc = {
        Head = 'Walahra Turban',
        Neck = 'Peacock Charm',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Haubergeon +1',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'DEX+5'} },
        Legs = 'Homam Cosciales',
        Feet = 'Dusk Ledelsens +1',
		Ammo = 'Iron Arrow',
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Peacock Charm',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Haubergeon +1',
        Hands = { Name = 'Dusk Gloves +1', Augment = { [1] = 'DEX+5'} },
        Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = 'Life Belt',
        Legs = 'Homam Cosciales',
		Feet = 'Dusk Ledelsens +1',
		ammo = 'Iron Arrow',	
    },
    TP_Mjollnir_Haste = {},

    WS = {
		Head = 'Voyager Sallet',
        Neck = 'Fotia Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Tmph. Earring +1',
        Body = 'Haubergeon +1',
        Hands = 'Battle Gloves',
        Ring1 = 'Harmonius Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'STR+5'} },
        Legs = 'Ryl.kgt. breeches',
        Feet = 'Rutter Sabatons',
    },
    WS_MidAcc = {},
    WS_HighAcc = {},

    WS_Spirits = {},

    Cover = {
        Head = 'Gallant Coronet',
        Body = 'Valor Surcoat',
    },
    Cure = {
        Ear1 = 'Hospitaler Earring',
    },
    Divine = {},
    Rampart = { -- Rampart gives VIT x2 damage shield in era
        Head = 'Valor Coronet',		
        Neck = 'Shield Torque',
        Ear1 = 'Pigeon Earring',
        Ear2 = 'Bloodbead Earring',
        Body = 'Koenig Cuirass',
        Hands = 'Kaiser handschuhs',
        Ring1 = 'Sattva Ring',
		Ring2 = { Name = 'Soil Ring', Augment = { [1] = 'VIT+5'} },
        Back = 'Resentment Cape',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
        Legs = 'Koenig Diechlings',
        Feet = 'Koenig Schuhs',
    },
    ShieldBash = {
        Ear2 = 'Knightly Earring',
        Hands = 'Valor Gauntlets',
    },
    Enhancing = {},
    Chivalry = {
		Head = 'Gallant Coronet',
		Ear1 = 'Harvest Earring',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
		Ring2 = 'Aqua Ring',
        Waist = 'ryl.kgt. Belt',
        Legs = 'Magic Cuisses',
        Feet = 'Valor Leggings',
		Ammo = 'Bone Arrow',
	},
    eepy = {
		Neck = 'Berserker\'s Torque'
	},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')

    -- AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //flash')
    -- AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //shieldbash')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Majesty') then
        return
    end

    gFunc.EquipSet(sets.Hate)

    if (action.Name == 'Holy Circle' and gallant_leggings ~= '') then
        gFunc.Equip('Legs', gallant_leggings)
    elseif (action.Name == 'Rampart') then
        gFunc.EquipSet(sets.Rampart)
        local environment = gData.GetEnvironment()
        if (shadow_mantle and environment.DayElement == 'Dark') then
            gFunc.Equip('Back', 'Shadow Mantle')
        end
    elseif (action.Name == 'Shield Bash' and valor_gauntlets ~= '') then
        gFunc.EquipSet(sets.ShieldBash)
        if (guardian_ring and player.HPP <= 75 and player.TP <= 1000) then
            gFunc.Equip(guardian_ring_slot, 'Guardian\'s Ring')
        end
    elseif (action.Name == 'Sentinel' and valor_leggings ~= '') then
        gFunc.Equip('Legs', valor_leggings)
    elseif (action.Name == 'Cover') then
        gFunc.EquipSet(sets.Cover)
    elseif (action.Name == 'Chivalry') then
        gFunc.EquipSet(sets.Chivalry)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Moonlight') then
        gFunc.Equip('Neck', 'Fotia Gorget')
        return
    end
    if (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits)
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    gcmelee.SetIsDPS(false)
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    local cover = gData.GetBuffCount('Cover')
    local equipment = gData.GetEquipment()

    if (cover >= 1) then
        gFunc.EquipSet(sets.Cover)
    end

    if (arco_de_velocidad) then
        local environment = gData.GetEnvironment()
        if (environment.Time >= 6 and environment.Time < 18 and player.HPP < 100) then
            gFunc.Equip('Range', 'Arco de Velocidad')
        end
    end

    if(equipment.Main ~= nil and equipment.Main.Name == 'Kraken Club' and (gcdisplay.IdleSet == 'LowAcc' or gcdisplay.IdleSet == 'MidAcc' or gcdisplay.IdleSet == 'HighAcc')) then
        gFunc.Equip('Ear1', 'Merman\'s Earring')
        gFunc.Equip('Ear2', 'Tmph. Earring +1')
    end

    if(equipment.Main ~= nil and equipment.Main.Name == 'Pixie Mace' and (gcdisplay.IdleSet == 'LowAcc' or gcdisplay.IdleSet == 'MidAcc' or gcdisplay.IdleSet == 'HighAcc')) then
        gFunc.Equip('Ear2', 'Tmph. Earring +1')
    end

    if (parade_gorget and player.HPP >= 85 and (gcdisplay.IdleSet == 'Normal' or (gcdisplay.IdleSet == 'LowAcc' and player.MPP <= 90))) then
        gFunc.Equip('Neck', 'Parade Gorget')
    end

    if (hercules_ring and player.HPP <= 50) then
        gFunc.Equip(hercules_ring_slot, 'Hercules\' Ring')
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    local cheatDelay = 0
    if (player.SubJob == "RDM" and warlocks_mantle) then
        if(action.Skill == 'Healing Magic') then 
            cheatDelay = gcmelee.DoPrecast(fastCastValue + cureCastValue + 0.02, true)
        else 
            cheatDelay = gcmelee.DoPrecast(fastCastValue + 0.02)
        end
        gFunc.Equip('Back', 'Warlock\'s Mantle')
    else
        if(action.Skill == 'Healing Magic') then 
            cheatDelay = gcmelee.DoPrecast(fastCastValue + cureCastValue, true)
        else 
            cheatDelay = gcmelee.DoPrecast(fastCastValue)
        end
    end

    if (cheatDelay < 0) then
        cheatDelay = 0
    end
    local function delayCheat()
        if (target.Name == me) then
            if (action.Name == 'Cure III') then
                gFunc.ForceEquipSet(sets.Cheat_C3HPDown)
            elseif (action.Name == 'Cure IV') then
                gFunc.ForceEquipSet(sets.Cheat_C4HPDown)
            end
        end
    end

    delayCheat:once(cheatDelay)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)
    local player = gData.GetPlayer()

    if (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure)
    elseif (action.Skill == 'Divine Magic') then
        if (action.Name == 'Flash') then
            --local sentinel = gData.GetBuffCount('Sentinel')
            --if (sentinel >= 1) then
            --    gFunc.EquipSet(sets.Haste)
            --else
                gFunc.EquipSet(sets.Hate)
                gFunc.EquipSet(sets.Hate_Flash)
            --end
        else
            gFunc.EquipSet(sets.Divine)
        end
    elseif (action.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Haste)
        if (action.Name == 'Utusemi: Ichi') then
            gFunc.EquipSet(sets.Haste_Ichi)
        end
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing)
    end

    if (target.Name == me) then
        if (action.Name == 'Cure III') then
            gFunc.EquipSet(sets.Cheat_C3HPUp)
        elseif (action.Name == 'Cure IV') then
            gFunc.EquipSet(sets.Cheat_C4HPUp)
        end
    end

    if (guardian_earring and player.HPP <= 25 and player.TP <= 1000) then
        gFunc.Equip(guardian_earring_slot, 'Guardian Earring')
    end
end

return profile
