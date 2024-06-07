Config = {}


Config.Blip = {
    Sprite = 161,        -- Default sprite for the blip
    Color = 29,         -- Default color for the blip
    Scale = 2.0,       -- Default scale for the blip
    Timeout = 10000    -- Time (in ms) before the blip is removed (dont touch unless you know what your doing)
}

Config.Cooldown = 10000 -- 60 seconds

-- List of weapon hashes that should not trigger a police notification
Config.BlacklistedWeapons = {
    [3696079510] = true,  -- Flare Gun
    [600439132] = true,   -- Grenade
    [101631238] = true,   -- BZ Gas
    [2694266206] = true,  -- Molotov
    [615608432] = true,   -- Sticky Bomb
    [1233104067] = true,  -- Proximity Mine
    [2874559379] = true,  -- Snowball
    [126349499] = true,   -- Pipe Bomb
    -- Add more weapon hashes here that should be ignored
}

-- Notification settings
Config.Notification = {
    Title = "<B>Victoria <B>Police",
    Subject = "000 Dispatch",
    Icon = "CHAR_POLICEBLUE"
}

Config.WeaponNames = {
    [-1716189206] = "Knuckle",
    [453432689] = "Pistol",
    [3219281620] = "Pistol Mk II",
    [1593441988] = "Combat Pistol",
    [584646201] = "AP Pistol",
    [2578377531] = "Pistol .50",
    [3249783761] = "SNS Pistol",
    [2285322324] = "SNS Pistol Mk II",
    [3523564046] = "Heavy Pistol",
    [137902532] = "Vintage Pistol",
    [3696079510] = "Flare Gun",
    [1198879012] = "Marksman Pistol",
    [369654866] = "Heavy Revolver",
    [3415619887] = "Heavy Revolver Mk II",
    [2548703416] = "Double Action Revolver",
    [2939590305] = "Up-n-Atomizer",
    [911657153] = "Ceramic Pistol",
    [419712736] = "Navy Revolver",
    [3872989383] = "Perico Pistol",
    [324215364] = "Micro SMG",
    [736523883] = "SMG",
    [2024373456] = "SMG Mk II",
    [4024951519] = "Assault SMG",
    [171789620] = "Combat PDW",
    [3675956304] = "Machine Pistol",
    [3173288789] = "Mini SMG",
    [1198256469] = "Unholy Hellbringer",
    [487013001] = "Pump Shotgun",
    [1432025498] = "Pump Shotgun Mk II",
    [2017895192] = "Sawed-Off Shotgun",
    [3800352039] = "Assault Shotgun",
    [2640438543] = "Bullpup Shotgun",
    [2828843422] = "Musket",
    [984333226] = "Heavy Shotgun",
    [4019527611] = "Double Barrel Shotgun",
    [317205821] = "Sweeper Shotgun",
    [3220176749] = "Assault Rifle",
    [961495388] = "Assault Rifle Mk II",
    [2210333304] = "Carbine Rifle",
    [4208062921] = "Carbine Rifle Mk II",
    [2937143193] = "Advanced Rifle",
    [3231910285] = "Special Carbine",
    [2526821735] = "Special Carbine Mk II",
    [2132975508] = "Bullpup Rifle",
    [2228681469] = "Bullpup Rifle Mk II",
    [1649403952] = "Compact Rifle",
    [2634544996] = "Military Rifle",
    [420447096] = "Heavy Rifle",
    [100416529] = "Sniper Rifle",
    [205991906] = "Heavy Sniper",
    [177293209] = "Heavy Sniper Mk II",
    [3342088282] = "Marksman Rifle",
    [1785463520] = "Marksman Rifle Mk II",
    [600439132] = "Grenade",
    [101631238] = "BZ Gas",
    [2694266206] = "Molotov",
    [615608432] = "Sticky Bomb",
    [1233104067] = "Proximity Mine",
    [2874559379] = "Snowball",
    [126349499] = "Pipe Bomb",
}

