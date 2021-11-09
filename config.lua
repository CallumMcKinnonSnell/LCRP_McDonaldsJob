Config ={}

Config.Locale = 'en'

Config.DrawDistance = 100
Config.EnableVaultManagement = true
Config.EnableMoneyWash = false
Config.MarkerDistance = 1

--Direction to face when doing animation
Config.FriesHeading =   92.22
Config.BurgerHeading =  1.00
Config.DrinkHeading =   271.95
Config.MealHeading  =   90.00

--Timings for animations
Config.CookFriesTime    = 6000
Config.CookBurgerTime   = 10000
Config.MakeDrinkTime    = 4000
Config.PrepMealTime     = 12000

--Props
Config.MealName			= 'ng_proc_food_bag01a'
Config.DrinkName		= 'prop_food_bs_juice01'
Config.BurgerNames		= {a = 'prop_cs_burger_01', b = 'prop_food_bs_burg1', c = 'prop_food_bs_burg3'}
Config.FriesName		= 'prop_food_bs_chips'
Config.TrayName			= 'prop_food_bs_tray_01'

--Boss Ped
Config.BossPed          = 'u_m_y_burgerdrug_01'
Config.BossCoords       = {x = 269.41, y = -973.73, z = 28.37}
Config.BossHeading      = 261.86

--Animation positions
Config.GetFriesPos          = {x=276.64, y = -975.78, z = 28.5}
Config.GetBurgerPos         = {x=279.60, y = -979.15, z = 28.75}
Config.GetDrinkPos          = {x=282.99, y = -978.91, z = 28.5}
Config.GetMealPos           = {x=281.18, y = -976.53, z = 28.75}

Config.Vehicle = {
    Code                 = "mcdelivery",
    Pos                  = { x = 303.11, y = -947.69, z = 29.3 },
    Heading              = 90.00,
}