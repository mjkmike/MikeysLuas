local fenrirs_earring = false -- Not used for RNG at all
local fenrirs_earring_slot = 'Ear2'

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcinclude = gFunc.LoadFile('common\\gcinclude.lua')
gcmage = gFunc.LoadFile('common\\gcmage.lua')
-- conquest = gFunc.LoadFile('common\\conquest.lua')

local fire_staff = 'Vulcan\'s Staff'
local earth_staff = 'Terra\'s Staff'
local water_staff = 'Neptune\'s Staff'
local wind_staff = 'Auster\'s Staff'
local ice_staff = 'Aquilo\'s Staff'
local thunder_staff = 'Jupiter\'s Staff'
local light_staff = 'Apollo\'s Staff'
local dark_staff = 'Pluto\'s Staff'

local gcmelee = {}

local isDPS = true
local lag = false

local TpVariantTable = {
    [1] = 'LowAcc',
    [2] = 'MidAcc',
    [3] = 'HighAcc',
}

local tp_variant = 1

local lastIdleSetBeforeEngaged = ''

local SurvivalSpells = T{ 'Utsusemi: Ichi','Utsusemi: Ni','Blink','Aquaveil','Stoneskin' }

local AliasList = T{
    'tpset','tp','mode','dps','lag',
}

local utsuBuffs = T{
    [66] = 1,
    [444] = 2,
    [445] = 3,
    [446] = 4,
}

local NukeObiOwnedTable = {
    ['Fire'] = karin_obi,
    ['Earth'] = dorin_obi,
    ['Water'] = suirin_obi,
    ['Wind'] = furin_obi,
    ['Ice'] = hyorin_obi,
    ['Thunder'] = rairin_obi,
    ['Light'] = korin_obi,
    ['Dark'] = anrin_obi
}

local WeakElementTable = {
    ['Fire'] = 'Water',
    ['Earth'] = 'Wind',
    ['Water'] = 'Thunder',
    ['Wind'] = 'Ice',
    ['Ice'] = 'Fire',
    ['Thunder'] = 'Earth',
    ['Light'] = 'Dark',
    ['Dark'] = 'Light'
}

local NukeObiTable = {
    ['Fire'] = 'Hachirin-no-obi',
    ['Earth'] = 'Hachirin-no-obi',
    ['Water'] = 'Hachirin-no-obi',
    ['Wind'] = 'Hachirin-no-obi',
    ['Ice'] = 'Hachirin-no-obi',
    ['Thunder'] = 'Hachirin-no-obi',
    ['Light'] = 'Hachirin-no-obi',
    ['Dark'] = 'Hachirin-no-obi'
}

local ElementalStaffTable = {
    ['Fire'] = fire_staff,
    ['Earth'] = earth_staff,
    ['Water'] = water_staff,
    ['Wind'] = wind_staff,
    ['Ice'] = ice_staff,
    ['Thunder'] = thunder_staff,
    ['Light'] = light_staff,
    ['Dark'] = dark_staff
}


function gcmelee.SetIsDPS(isDPSVal)
    isDPS = isDPSVal
end

function gcmelee.Load()
    gcinclude.SetAlias(AliasList)
    gcinclude.Load()
end

function gcmelee.Unload()
    gcinclude.Unload()
    gcinclude.ClearAlias(AliasList)
end

function gcmelee.DoCommands(args)
    if not (AliasList:contains(args[1])) then
        gcinclude.DoCommands(args)
        do return end
    end

    if (args[1] == 'tpset' or args[1] == 'tp' or args[1] == 'mode') then
        tp_variant = tp_variant + 1
        if (tp_variant > #TpVariantTable) then
            tp_variant = 1
        end
        gcinclude.Message('TP Set', TpVariantTable[tp_variant])
    elseif (args[1] == 'dps') then
        isDPS = not isDPS
        gcinclude.Message('DPS Mode', isDPS)
        if (not isDPS) then
            gcinclude.ToggleIdleSet('Normal')
            lastIdleSetBeforeEngaged = ''
        end
    elseif (args[1] == 'lag') then
        lag = not lag
        gcinclude.Message('[Note: Midcast Delays are disabled if Lag is true] Lag', lag)
    end
end

function gcmelee.DoDefault()
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    gcinclude.DoDefaultIdle()

    if (isDPS) then
        if (gcdisplay.IdleSet == 'Normal' or gcdisplay.IdleSet == 'Alternate' or gcdisplay.IdleSet == 'LowAcc' or gcdisplay.IdleSet == 'MidAcc' or gcdisplay.IdleSet == 'HighAcc') then
            if (player.Status == 'Engaged') then
                if (lastIdleSetBeforeEngaged == '') then
                    lastIdleSetBeforeEngaged = gcdisplay.IdleSet
                end
                gFunc.EquipSet('TP_' .. TpVariantTable[tp_variant])
                if (gcdisplay.IdleSet ~= TpVariantTable[tp_variant]) then
                    gcinclude.ToggleIdleSet(TpVariantTable[tp_variant])
                end

                if (player.MainJob ~= 'RNG') then
                    if (fenrirs_earring and (environment.Time >= 6 and environment.Time < 18)) then
                        gFunc.Equip(fenrirs_earring_slot, 'Fenrir\'s Earring')
                    end
                end
            end
            if (player.Status == 'Idle' and lastIdleSetBeforeEngaged ~= '') then
                gcinclude.ToggleIdleSet(lastIdleSetBeforeEngaged)
                lastIdleSetBeforeEngaged = ''
            end
        end
    elseif(player.MainJob == 'PLD' and player.Status == 'Engaged') then
        gFunc.EquipSet('DT')
    end
end

function gcmelee.DoFenrirsEarring()
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    if (isDPS) then
        if (player.MainJob ~= 'RNG') then
            if (fenrirs_earring and (environment.Time >= 6 and environment.Time < 18)) then
                gFunc.Equip(fenrirs_earring_slot, 'Fenrir\'s Earring')
            end
        end
    end
end

function gcmelee.DoDefaultOverride()
    gcinclude.DoDefaultOverride(true)
end

function gcmelee.DoPrecast(fastCastValue, curePrecast)
    
    if(curePrecast == true) then
        gFunc.EquipSet('Precast_Cure')
    else 
        local spell = gData.GetAction();
        gcinclude.DoShadows(spell);

        gFunc.EquipSet('Precast')
    end
    if (not lag) then
        return gcmelee.SetupMidcastDelay(fastCastValue)
    end    
    return 0
end

function gcmelee.SetupMidcastDelay(fastCastValue)
    local player = gData.GetPlayer()
    local action = gData.GetAction()
    local castTime = action.CastTime

    local hasso = gData.GetBuffCount('Hasso')
    local seigan = gData.GetBuffCount('Seigan')
    local castTimeMod = 1
    if (hasso == 1 or seigan == 1) then
        castTimeMod = 1.5
    end

    if (action.Skill == 'Divine Magic' and action.Name == 'Banish III') then
        castTime = 3000
    end

    if (player.SubJob == "RDM") then
         fastCastValue = fastCastValue + 0.15 -- Fast Cast Trait
    end
    local minimumBuffer = 0.25 -- Can be lowered to 0.1 if you want
    local packetDelay = 0.25 -- Change this to 0.4 if you do not use PacketFlow
    local castDelay = ((castTime * castTimeMod * (1 - fastCastValue)) / 1000) - minimumBuffer
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay)
    end

    -- print(chat.header('DEBUG'):append(chat.message('Cast delay is ' .. castDelay)))

    return castDelay - 1
end

function gcmelee.DoMidcast(sets)
    if (not lag) then
        gcmelee.SetupInterimEquipSet(sets)
    end
    gFunc.EquipSet('Haste')
end

function gcmelee.SetupInterimEquipSet(sets)
    local action = gData.GetAction()

    gFunc.InterimEquipSet(sets.DT)

    if (SurvivalSpells:contains(action.Name)) then
        gFunc.InterimEquipSet(sets.SIRD)
    end

    if (gcdisplay.IdleSet == 'MDT') then gFunc.InterimEquipSet(sets.MDT) end
    if (gcdisplay.IdleSet == 'FireRes') then gFunc.InterimEquipSet(sets.FireRes) end
    if (gcdisplay.IdleSet == 'IceRes') then gFunc.InterimEquipSet(sets.IceRes) end
    if (gcdisplay.IdleSet == 'LightningRes') then gFunc.InterimEquipSet(sets.LightningRes) end
    if (gcdisplay.IdleSet == 'EarthRes') then gFunc.InterimEquipSet(sets.EarthRes) end
end

function gcmelee.DoWS()
    gFunc.EquipSet('WS')
    if (TpVariantTable[tp_variant] == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end

    gcmelee.DoFenrirsEarring()
end

function gcmelee.GetAccuracyMode()
    return TpVariantTable[tp_variant]
end

function gcmelee.equipStaff(action)
    local staff = ElementalStaffTable[action.Element]
    if staff ~= '' then
        gFunc.Equip('Main', staff)
    end
end

function gcmelee.equipObi(action)
    if (gcmage.ObiCheck(action)) then
        local obi = NukeObiTable[action.Element]
        local obiOwned = NukeObiOwnedTable[action.Element]
        if (obiOwned) then
            gFunc.Equip('Waist', obi)
        end
    end
end

return gcmelee
