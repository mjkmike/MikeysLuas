local profile = {}

local fastCastValue = 0.07 -- 0.07 7% from gear

local warlocks_mantle = false -- Don't add 2% to fastCastValue to this as it is SJ dependant

local shadow_mantle = true

local str_physical_spells = T{'Foot Kick','Sprout Smack','Wild Oats','Power Attack','Queasyshroom','Battle Dance','Feather Storm','Helldive','Bludgeon','Claw Cyclone','Screwdriver','Grand Slam','Smite of Rage','Pinecone Bomb','Jet Stream','Uppercut','Terror Touch','Mandibular Bite','Sickle Slash','Dimensional Death','Spiral Spin','Death Scissors','Seedspray','Body Slam','Hydro Shot','Frenetic Rip','Spinal Cleave','Hysteric Barrage','Asuran Claws','Cannonball','Disseverment','Ram Charge','Vertical Cleave','Final Sting','Goblin Rush','Vanity Dive','Whirl of Rage','Benthic Typhoon','Quad. Continuum','Empty Thrash','Delta Thrust','Heavy Strike','Quadrastrike','Tourbillion','Amorphic Spikes','Barbed Crescent','Bilgestorm','Bloodrake','Glutinous Dart','Paralyzing Triad','Thrashing Assault','Sinker Drill','Sweeping Gouge','Saurian Slide'}
local BluMagDebuff = T{'Filamented Hold','Cimicine Discharge','Demoralizing Roar','Venom Shell','Light of Penance','Sandspray','Auroral Drape','Frightful Roar','Enervation','Infrasonics','Lowing','CMain Wave','Awful Eye','Voracious Trunk','Sheep Song','Soporific','Yawn','Dream Flower','Chaotic Eye','Sound Blast','Blank Gaze','Stinking Gas','Geist Wall','Feather Tickle','Reaving Wind','Mortal Ray','Absolute Terror','Blistering Roar','Cruel Joke'}
local BluMagStun = T{'Head Butt','Frypan','Tail Slap','Sub-zero Smash','Sudden Lunge'};
local BluMagBuff = T{'Cocoon','Refueling','Feather Barrier','Memento Mori','Zephyr Mantle','Warm-Up','Amplification','Triumphant Roar','Saline Coat','Reactor Cool','Plasma Charge','Regeneration','Animating Wail','Battery Charge','Winds of Promy.','Barrier Tusk','Orcish Counterstance','Pyric Bulwark','Nat. Meditation','Restoral','Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'}
local BluMagSkill = T{'Metallic Body','Diamondhide','Magic Barrier','Occultation','Atra. Libations'}
local BluMagDiffus = T{'Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'}
local BluMagCure = T{'Pollen','Healing Breeze','Wild Carrot','Magic Fruit','Plenilune Embrace'}
local BluMagEnmity = T{'Actinic Burst','Exuviation','Fantod','Jettatura','Temporal Shift'}
local BluMagTH = T{'Actinic Burst','Dream Flower','Subduction'}

local sets = {
    Idle = {
        Head = 'displaced',
        Body = 'Vermillion Cloak',
        Neck = 'Jeweled Collar',
        Ear1 = 'Bloodbead Earring',
        Ear2 = { Name = 'Cassie Earring', Priority = 100 },
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Bloodbead ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Boxer\'s Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 },
        Feet = 'Glt. Leggings +1',
		Ammo = 'Iron Arrow',
    },
    IdleALT = {
    },
    IdleDT = {
        Head = 'Darksteel Cap +1', -- 2
        Body = 'Koenig Cuirass', -- 4
        Neck = { Name = 'Shield Torque', Priority = 100 },
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 25 },
        Hands = 'Heavy Gauntlets', -- 3
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 }, -- 3
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
        Head = 'Darksteel Cap +1',
        Body = 'Haubergeon +1',
        Hands = 'Dusk Gloves +1',
        Legs = 'Crimson cuisses',
        Feet = 'Glt. Leggings +1',
        Ear2 = 'Hades Earring +1',
        Ear1 = 'Tmph. Earring +1',
        Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Harmonius Ring',
    },
    Movement = {
        Legs = 'Crimson Cuisses',
    },

    DT = {
        Head = 'Darksteel Cap +1', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = { Name = 'Shield Torque', Priority = 100 },
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 25 },
        Hands = 'Heavy Gauntlets', -- 3
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 }, -- 3
        Feet = { Name = 'Glt. Leggings +1', Priority = 90 },
    },
    MDT = { -- Shell IV provides 23% MDT
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = { Name = 'Cassie Earring', Priority = 100 },
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
    },
    FireRes = {
    },
    IceRes = {
    },
    LightningRes = { 
    },
    EarthRes = {
    },
    WindRes = {
    },
    WaterRes = {
    },
    Evasion = {
        Head = 'Bahamut\'s Mask',
        -- Crimson Scale Mail
        Legs = 'Bahamut\'s Hose',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
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
		Ear2 = 'Hades Earring +1',
        Body = 'Valor Surcoat',
        Hands = 'Valor Gauntlets',
		Ring1 = 'Mermaid Ring',
		Ring2 = 'Hercules\' Ring',
        Waist = 'Jungle Sash',
		Back = 'Resentment Cape',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings',
    },
    SIRD = {
        Head = { Name = 'Koenig Schaller', Priority = 30 },
        Neck = 'Willpower Torque', -- 5
        Ear2 = 'Knightly Earring', -- 9
        Body = 'Koenig Cuirass',
        Hands = 'Heavy Gauntlets',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Boxer\'s Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = { Name = 'Valor Breeches', Priority = 20 }, -- 10
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Head = { Name = 'Walahra turban', Priority = 100 }, -- 5
        Neck = 'Willpower Torque',
        -- Ear1 = 'Loquac. Earring', -- FC
        -- Ear2 = 'Magnetic Earring',
        Body = 'Koenig Cuirass',
        Hands = { Name = 'Dusk Gloves +1', Priority = 22 }, -- 4
        -- Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Boxer\'s Mantle',
        Waist = 'Speed Belt', -- 6
        -- Legs = 'Homam Cosciales', -- 3
        Feet = 'Dusk Ledelsens', -- 2
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
    },
    Hate_Flash = { -- Optional, provided here only if you wish to mix in haste or other stats over max +enmity
        Head = 'Walahra turban',
        Neck = 'Harmonia\'s Torque',
        -- Ear1 = 'Loquac. Earring',
        Ear2 = 'Hades Earring +1',
        Body = { Name = 'Valor Surcoat', Priority = -100 },
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Hercules\' Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = { Name = 'Resentment Cape', Priority = 100 },
        Waist = 'Speed Belt',
        -- Legs = 'Homam Cosciales',
        Feet = 'Dusk Ledelsens', 
    },
    Cheat_C3HPDown = { -- 1227
        Main = 'Durandal',
        Sub = 'Aegis',
        Range = 'Lightning Bow +1',
        Ammo = '',
        Head = 'Darksteel Cap +1', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = 'Willpower Torque', -- 5
        Ear1 = { Name = 'Magnetic Earring', Priority = 120 }, -- 8
        Ear2 = 'Knightly Earring', -- 9
        Hands = 'Hydra Moufles',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Serket Ring',
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = 'Valor Breeches', -- 10
        Feet = 'Mountain Gaiters', -- 5
    },
    Cheat_C3HPUp = { -- 1455
        Head = 'Aegishjalmr',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Hades Earring +1',
        Body = 'Hydra Haubert',
        Hands = 'Hydra Moufles',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings ',
    },
    Cheat_C4HPDown = { -- 1072
        Head = 'Faerie Hairpin',
        Neck = 'Willpower Torque',
        Ear1 = { Name = 'Magnetic Earring', Priority = 120 }, -- 8
        Ear2 = 'Knightly Earring', -- 9
        Body = 'Hydra Haubert',
        Hands = 'Hydra Moufles',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = 'Hydra Brayettes',
        Feet = 'Hydra Sollerets',
    },
    Cheat_C4HPUp = { -- 1514
        Main = 'Apollo\'s Staff',
        Sub = '',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Bahamut\'s Mask',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Hades Earring +1',
        Body = 'Vlr. Surcoat +1',
        Hands = 'Vlr. Gauntlets +1',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings ',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Homam Zucchetto',
        Neck = 'Fortitude Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Speed Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    TP_MidAcc = {},
    TP_HighAcc = {},
    TP_Mjollnir_Haste = {},

    WS = {
		Head = 'Voyager Sallet',
        Neck = 'Fotia Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Tmph. Earring +1',
        Body = 'Haubergeon',
        Body = 'Haubergeon +1',
        Hands = 'Battle Gloves',
        Ring1 = 'Harmonius Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Cerberus Mantle',
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
        Hands = 'Kng. Handschuhs',
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
    gFunc.EquipSet(sets.Hate)
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
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'enmity'})
    gcdisplay.CreateCycle('enmity', {[1] = 'Down', [2] = 'Up',})
    gcmelee.Load()
    gcmelee.SetIsDPS(false)
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    if (args[1] == 'enmity') then
        gcdisplay.AdvanceCycle('enmity')
        gcinclude.Message('enmity', gcdisplay.GetCycle('enmity'))
    else
        gcmelee.DoCommands(args)
    end
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    if (player.SubJob == "RDM" and warlocks_mantle) then
        cheatDelay = gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.Equip('Back', 'Warlock\'s Mantle')
    else
        gcmelee.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)
    

    if (action.Skill == 'Blue Magic') then
        gFunc.EquipSet(sets.Cure)
    elseif (action.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Haste)
        if (action.Name == 'Utusemi: Ichi') then
            gFunc.EquipSet(sets.Haste_Ichi)
        end
    end
end

return profile
