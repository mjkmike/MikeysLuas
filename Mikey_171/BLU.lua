local profile = {}

local fastCastValue = 0.07 -- 0.07 7% from gear

local warlocks_mantle = false -- Don't add 2% to fastCastValue to this as it is SJ dependant
local vampire_earring = true;

local shadow_mantle = true

local blue_magic_str = T{'Foot Kick','Sprout Smack','Wild Oats','Power Attack','Queasyshroom','Battle Dance','Feather Storm','Helldive','Bludgeon','Claw Cyclone','Screwdriver','Grand Slam','Smite of Rage','Pinecone Bomb','Jet Stream','Uppercut','Terror Touch','Mandibular Bite','Sickle Slash','Dimensional Death','Spiral Spin','Death Scissors','Seedspray','Body Slam','Hydro Shot','Frenetic Rip','Spinal Cleave','Hysteric Barrage','Asuran Claws','Cannonball','Disseverment','Ram Charge','Vertical Cleave','Final Sting','Goblin Rush','Vanity Dive','Whirl of Rage','Benthic Typhoon','Quad. Continuum','Empty Thrash','Delta Thrust','Heavy Strike','Quadrastrike','Tourbillion','Amorphic Spikes','Barbed Crescent','Bilgestorm','Bloodrake','Glutinous Dart','Paralyzing Triad','Thrashing Assault','Sinker Drill','Sweeping Gouge','Saurian Slide'}
local blue_magic_debuffs = T{'Filamented Hold','Cimicine Discharge','Demoralizing Roar','Venom Shell','Light of Penance','Sandspray','Auroral Drape','Frightful Roar','Enervation','Infrasonics','Lowing','CMain Wave','Awful Eye','Voracious Trunk','Sheep Song','Soporific','Yawn','Dream Flower','Chaotic Eye','Sound Blast','Blank Gaze','Stinking Gas','Geist Wall','Feather Tickle','Reaving Wind','Mortal Ray','Absolute Terror','Blistering Roar','Cruel Joke'}
local blue_magic_stuns = T{'Head Butt','Frypan','Tail Slap','Sub-zero Smash','Sudden Lunge'};
local blue_magic_buffs = T{'Cocoon','Refueling','Feather Barrier','Memento Mori','Zephyr Mantle','Warm-Up','Amplification','Triumphant Roar','Saline Coat','Reactor Cool','Plasma Charge','Regeneration','Animating Wail','Battery Charge','Winds of Promy.','Barrier Tusk','Orcish Counterstance','Pyric Bulwark','Nat. Meditation','Restoral','Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'}
local blue_magic_skill = T{'Metallic Body','Diamondhide','Magic Barrier','Occultation','Atra. Libations'}
local blue_magic_diffuse = T{'Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'}
local blue_magic_cure = T{'Pollen','Healing Breeze','Wild Carrot','Magic Fruit','Plenilune Embrace'}
local blue_mage_enmity = T{'Actinic Burst','Exuviation','Fantod','Jettatura','Temporal Shift'}

local sets = {
    Idle = {
        Head = 'Coral Visor +1',
        Body = 'Mirage Jubbah',
        Neck = 'Jeweled Collar',
        Ear1 = 'Pigeon Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 100 },
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 },
        Feet = 'Blood Greaves',
    },
    IdleALT = {
    },
    IdleDT = {
        Head = 'Coral Visor +1',
        Body = 'Mirage Jubbah',
        Neck = 'Jeweled Collar',
        Ear1 = 'Pigeon Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 100 },
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'VIT+5'} },
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 },
        Feet = 'Blood Greaves',
    },
    IdleALTDT = {
    },
    Resting = {
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Legs = 'Libra Subligar'
    },
    Town = {
        Head = 'Darksteel Cap +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Tmph. Earring +1',
        Ear2 = 'Hades Earring +1',
        Body = 'Scp. Harness +1',
        Hands = 'Dusk Gloves +1',
        Back = 'Shadow Mantle',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'STR+5'} },
        Legs = 'Homam Cosciales',
        Feet = 'Glt. Leggings +1',
        Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Harmonius Ring',
    },
    Movement = {
        Hands = 'Dst. Mittens +1',
        Legs = 'Crimson Cuisses',
        Feet = 'Blood Greaves',
    },
    Movement_MDT = {
        Legs = 'Crimson Cuisses',
    },
    DT = {
    },
    MDT = { -- Shell IV provides 23% MDT
        Head = 'Coral Visor +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Mirage Jubbah',
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Defending Ring', Augment = { [1] = 'VIT+5'} },
        Back = 'Lamie Mantle +1',
        Waist = { Name = 'Marid Belt', Augment = { [1] = 'VIT+5'} },
        Legs = 'Coral cuisses +1',
        Feet = 'Coral Greaves +1',
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
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 100 },
        Legs = { Name = 'Homam Cosciales', Priority = 120 },
    },
    SIRD = {
        -- Neck = 'Willpower Torque', -- 5
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Defending Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1', -- 8
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Head = { Name = 'Walahra turban', Priority = 100 }, -- 5
        Ear1 = 'Loquac. Earring', -- FC
        Hands = { Name = 'Dusk Gloves +1', Priority = 22 }, -- 4
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'DEX+5'} }, -- 6
        Legs = 'Homam Cosciales', -- 3
        Feet = 'Dusk Ledelsens +1', -- 3
    },
    Haste_Ichi = { -- Optional, provided here only if you wish to mix in SIRD or other stats over max haste
    },
    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Walahra Turban',
        Neck = 'Chivalrous Chain',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Mirage Jubbah',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Harmonius Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'DEX+5'} },
        Legs = 'Homam Cosciales',
        Feet = 'Dusk Ledelsens +1',
    },
    TP_MidAcc = {
        Head = 'Walahra Turban',
        Neck = 'Peacock Charm',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Mirage Jubbah',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = { Name = 'Speed Belt', Augment = { [1] = 'DEX+5'} },
        Legs = 'Homam Cosciales',
        Feet = 'Dusk Ledelsens +1',
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Peacock Charm',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Mirage Jubbah',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = { Name = 'Life Belt', Augment = { [1] = 'DEX+5'} },
        Legs = 'Homam Cosciales',
        Feet = 'Dusk Ledelsens +1',
    },
    WS = {
		Head = 'Voyager Sallet',
        Neck = 'Fotia Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Tmph. Earring +1',
        Body = 'Magus Jubbah',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Harmonius Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'STR+5'} },
        Legs = 'Mirage Shalwar',
        Feet = 'Rutter Sabatons',
    },
    WS_MidAcc = {
        Head = 'Voyager Sallet',
        Neck = 'Fotia Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Tmph. Earring +1',
        Body = 'Magus Jubbah',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Harmonius Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'STR+5'} },
        Legs = 'Mirage Shalwar',
        Feet = 'Rutter Sabatons',
    },
    WS_HighAcc = {
        Head = 'Voyager Sallet',
        Neck = 'Fotia Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Tmph. Earring +1',
        Body = 'Magus Jubbah',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Harmonius Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'STR+5'} },
        Legs = 'Mirage Shalwar',
        Feet = 'Rutter Sabatons',
    },
    BLU_Magic = {
        Body = 'Magus Jubbah',
    },
    BLU_Stun = {
        Body = 'Magus Jubbah',
        Neck = 'Peacock Charm',
        Ear2 = 'Suppanomimi',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Waist = 'Life Belt',
    },
    BLU_STR = {
        Head = 'Voyager Sallet',
        Neck = 'Spike Necklace',
        Ear1 = 'Minuet Earring',
        Ear2 = 'Tmph. Earring +1',
        Body = 'Magus Jubbah',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Harmonius Ring',
		Ring2 = 'Rajas Ring',
        Back = 'Cerb. Mantle +1',
        Waist = { Name = 'Warwolf Belt', Augment = { [1] = 'STR+5'} },
        Legs = 'Mirage Shalwar',
        Feet = 'Rutter Sabatons',
    },
    Cure = {
        Head = 'Mirage Keffieyeh',
        Neck = 'Justice Badge',
		Ear1 = 'Harvest Earring',
        Body = 'Crm. Scale Mail',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
		Ring2 = 'Aqua Ring',
        Back = 'Beak Mantle +1',
        Waist = 'ryl.kgt. Belt',
        Legs = 'Magic Cuisses',
        Feet = 'Errant Pigaches',
    }
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
    -- gFunc.EquipSet(sets.Hate)
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

    -- local action = gData.GetAction()
    local environment = gData.GetEnvironment()
    if (vampire_earring and (environment.Time < 6 or environment.Time >= 18)) then
        gFunc.Equip('Ear2', 'Vampire Earring')
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()

    if (player.SubJob == "RDM" and warlocks_mantle) then
        cheatDelay = gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.Equip('Back', 'Warlock\'s Mantle')
    else
        gcmelee.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()
    if (action.Skill == 'Blue Magic') then
        gFunc.EquipSet(sets.BLU_Magic);
        -- if (blue_magic_debuffs:contains(action.Name)) then gFunc.EquipSet(sets.BluMagicAccuracy)
        if (blue_magic_str:contains(action.Name)) then 
            gFunc.EquipSet(sets.BLU_STR); 
            local environment = gData.GetEnvironment()
            if (vampire_earring and (environment.Time < 6 or environment.Time >= 18)) then
                gFunc.Equip('Ear2', 'Vampire Earring')
            end
        elseif (blue_magic_stuns:contains(action.Name)) then gFunc.EquipSet(sets.blue_Stun);
        elseif (blue_magic_buffs:contains(action.Name)) then gFunc.EquipSet(sets.CMP);
        elseif (blue_magic_skill:contains(action.Name)) then gFunc.EquipSet(sets.BluSkill);
        elseif (blue_magic_cure:contains(action.Name)) then gFunc.EquipSet(sets.Cure);
        elseif (blue_mage_enmity:contains(action.Name)) then gFunc.EquipSet(sets.Enmity);
        end
    elseif (action.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Haste)
        if (action.Name == 'Utsusemi: Ichi') then
            gFunc.EquipSet(sets.Haste_Ichi)
        end
    end
end

return profile
