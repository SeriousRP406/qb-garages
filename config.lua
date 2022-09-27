
SpawnVehicleServerside = true -- REQUIRES THE ABSOLUTE LATEST VERSION OF QBCORE, OR MAKE SURE YOU HAVE THESE: https://github.com/qbcore-framework/qb-core/blob/81ffd872319d2eb8e496c3b3faaf37e791912c84/server/events.lua#L252
SpawnAtFreeParkingSpot = true
StoreDamageAccuratly = false -- Do not use, if on latest qb-core, if set to true, make sure to apply / run patch1.sql
StoreParkinglotAccuratly = false  -- store the last parking lot in the DB, if set to true, make sure to apply / run patch1.sql, I recommend applying the tracking snippet for qb-phone from the ReadMe to the phone so you can track the vehicle to the exact parking lot
SpawnAtLastParkinglot = false -- spawn the vehicle at hte last parked location if StoreParkinglotAccuratly = true, if set to true, make sure to apply / run patch1.sql, I recommend applying the tracking snippet from the ReadMe to the phone so you can track the vehicle to the exact parking lot
GarageNameAsBlipName = true -- if set to true, the blips name will match the garage name
FuelScript = 'ps-fuel' -- change to lj-fuel / ps-fuel if you use lj-fuel / ps-fuel or something else if you use any other LegcyFuel compatible script
UseLoafHousing = false
AllowSpawningFromAnywhere = true -- if set to true, the car can be spawned from anywhere inside the zone on the closest parking lot, if set to false you will have to walk up to a parking lot 
AutoRespawn = false --True == auto respawn cars that are outside into your garage on script restart, false == does not put them into your garage and players have to go to the impound
WarpPlayerIntoVehicle = false -- True == Will Warp Player Into their vehicle after pulling it out of garage. False It will spawn on the parking lot / in front of them  (Global, can be overriden by each garage)
HouseParkingDrawText = 'Parking' -- text when driving on to the HOUSE parking lot
ParkingDistance = 2.0 -- Distance to the parking lot when trying to park the vehicle  (Global, can be overriden by each garage)
SpawnDistance = 4.5 -- The maximum distance you can be from a parking spot, to spawn a car (Global, can be overriden by each garage)
DepotPrice = 60.0 -- The price to take out a despawned vehicle from impound.
DrawTextPosition = 'left' -- location of drawtext: left, top, right
ImpoundReleaseInterval = 1800000 --time in miliseconds to run  ImpoundRelease function 
-- set useVehicleSpawner = true for each garage that has type job and should use the vehicle spawner instead of personal vehicles
JobVehicles = {
	['pd1'] = { -- job
        label = "Police Vehicles",
        job = 'police',
        -- Grade 0
        vehicles = {
            [0] = {
                ["03expeditionr"] = "Ford Expedition",
                ["newvic"] = "Ford Crown Victoria",
            },
            -- Grade 1
            [1] = {
                ["03expeditionr"] = "Ford Expedition",
                ["newvic"] = "Ford Crown Victoria",
                ["16explorer"] = "Ford Explorer",
                ["16taurus"] = "Ford Taurus",
            },
            -- Grade 2
            [2] = {
                ["03expeditionr"] = "Ford Expedition",
                ["newvic"] = "Ford Crown Victoria",
                ["16explorer"] = "Ford Explorer",
                ["16taurus"] = "Ford Taurus",
                ["11caprice"] = "Chevrolet Caprice",
                ["18tahoe"] = "Chevrolet Tahoe",
                ["19durango"] = "Dodge Durango",
            },
            -- Grade 3
            [3] = {
                ["03expeditionr"] = "Ford Expedition",
                ["newvic"] = "Ford Crown Victoria",
                ["16explorer"] = "Ford Explorer",
                ["16taurus"] = "Ford Taurus",
                ["11caprice"] = "Chevrolet Caprice",
                ["18tahoe"] = "Chevrolet Tahoe",
                ["19durango"] = "Dodge Durango",
                ["18charger"] = "Dodge Charger",
                ["poldemon"] = "Demon Interceptor",
            },
            -- Grade 4
            [4] = {
                ["03expeditionr"] = "Ford Expedition",
                ["newvic"] = "Ford Crown Victoria",
                ["16explorer"] = "Ford Explorer",
                ["16taurus"] = "Ford Taurus",
                ["11caprice"] = "Chevrolet Caprice",
                ["18tahoe"] = "Chevrolet Tahoe",
                ["19durango"] = "Dodge Durango",
                ["18charger"] = "Dodge Charger",
                ["poldemon"] = "Demon Interceptor",
            },
            [5] = {
                ["03expeditionr"] = "Ford Expedition",
                ["newvic"] = "Ford Crown Victoria",
                ["16explorer"] = "Ford Explorer",
                ["16taurus"] = "Ford Taurus",
                ["11caprice"] = "Chevrolet Caprice",
                ["18tahoe"] = "Chevrolet Tahoe",
                ["19durango"] = "Dodge Durango",
                ["18charger"] = "Dodge Charger",
                ["poldemon"] = "Demon Interceptor",
            },
            [6] = {
                ["03expeditionr"] = "Ford Expedition",
                ["newvic"] = "Ford Crown Victoria",
                ["16explorer"] = "Ford Explorer",
                ["16taurus"] = "Ford Taurus",
                ["11caprice"] = "Chevrolet Caprice",
                ["18tahoe"] = "Chevrolet Tahoe",
                ["19durango"] = "Dodge Durango",
                ["18charger"] = "Dodge Charger",
                ["poldemon"] = "Demon Interceptor",
            },
            [7] = {
                ["03expeditionr"] = "Ford Expedition",
                ["newvic"] = "Ford Crown Victoria",
                ["16explorer"] = "Ford Explorer",
                ["16taurus"] = "Ford Taurus",
                ["11caprice"] = "Chevrolet Caprice",
                ["18tahoe"] = "Chevrolet Tahoe",
                ["19durango"] = "Dodge Durango",
                ["18charger"] = "Dodge Charger",
                ["poldemon"] = "Demon Interceptor",
            },
            [8] = {
                ["03expeditionr"] = "Ford Expedition",
                ["newvic"] = "Ford Crown Victoria",
                ["16explorer"] = "Ford Explorer",
                ["16taurus"] = "Ford Taurus",
                ["11caprice"] = "Chevrolet Caprice",
                ["18tahoe"] = "Chevrolet Tahoe",
                ["19durango"] = "Dodge Durango",
                ["18charger"] = "Dodge Charger",
                ["poldemon"] = "Demon Interceptor",
            },
            [9] = {
                ["03expeditionr"] = "Ford Expedition",
                ["newvic"] = "Ford Crown Victoria",
                ["16explorer"] = "Ford Explorer",
                ["16taurus"] = "Ford Taurus",
                ["11caprice"] = "Chevrolet Caprice",
                ["18tahoe"] = "Chevrolet Tahoe",
                ["19durango"] = "Dodge Durango",
                ["18charger"] = "Dodge Charger",
                ["poldemon"] = "Demon Interceptor",
            }
        }
    },
    ['pdmarina'] = { -- job
    label = "Police Marina",
    job = 'police',
    -- Grade 0
    vehicles = {
        [0] = {
            ["largeboat"] = "PD Boat",
        },
        -- Grade 1
        [1] = {
            ["largeboat"] = "PD Boat",
        },
        -- Grade 2
        [2] = {
            ["largeboat"] = "PD Boat",
        },
        -- Grade 3
        [3] = {
            ["largeboat"] = "PD Boat",
        },
        -- Grade 4
        [4] = {
            ["largeboat"] = "PD Boat",
        },
        [5] = {
            ["largeboat"] = "PD Boat",
        },
        [6] = {
            ["largeboat"] = "PD Boat",
        },
        [7] = {
            ["largeboat"] = "PD Boat",
        },
        [8] = {
            ["largeboat"] = "PD Boat",
        },
        [9] = {
            ["largeboat"] = "PD Boat",
        }
    }
},
    ['ambulance'] = { -- job
        label = "Pillbox Vehicles",
        job = 'ambulance',
        -- Grade 0
        vehicles = {
            [0] = {
                ["20ramambo"] = "Dodge Ram Ambulance",
            },
            -- Grade 1
            [1] = {
                ["20ramambo"] = "Dodge Ram Ambulance",
            },
            -- Grade 2
            [2] = {
                ["20ramambo"] = "Dodge Ram Ambulance",
            },
            -- Grade 3
            [3] = {
                ["20ramambo"] = "Dodge Ram Ambulance",
            },
            -- Grade 4
            [4] = {
                ["20ramambo"] = "Dodge Ram Ambulance",
            },
            [5] = {
                ["20ramambo"] = "Dodge Ram Ambulance",
            },
            [6] = {
                ["20ramambo"] = "Dodge Ram Ambulance",
            }
        }
    },
    ['mech1'] = { -- job
        label = "Mechanic Vehicles",
        job = 'mechanic',
        -- Grade 0
        vehicles = {
            [0] = {
                ["20ramrb"] = "Dodge Rollback",
                ["flatbed"] = "Flatbed",
                ["minivan"] = "Van",
                ["Bison"] = "Bison",
            },
            -- Grade 1
            [1] = {
                ["20ramrb"] = "Dodge Rollback",
                ["flatbed"] = "Flatbed",
                ["minivan"] = "Van",
                ["Bison"] = "Bison",
            },
            -- Grade 2
            [2] = {
                ["20ramrb"] = "Dodge Rollback",
                ["flatbed"] = "Flatbed",
                ["minivan"] = "Van",
                ["Bison"] = "Bison",
            },
            -- Grade 3
            [3] = {
                ["20ramrb"] = "Dodge Rollback",
                ["flatbed"] = "Flatbed",
                ["minivan"] = "Van",
                ["Bison"] = "Bison",
            },
            -- Grade 4
            [4] = {
                ["20ramrb"] = "Dodge Rollback",
                ["flatbed"] = "Flatbed",
                ["minivan"] = "Van",
                ["Bison"] = "Bison",
            }
        }
    }
}

-- '/restorelostcars <destination_garage>' allows you to restore cars that have been parked in garages which no longer exist in the config (garage renamed or removed). The restored cars get sent to the destination garage or if left empty to a random garage in the list.
-- NOTE: This may also send helis and boats to said garaga so choose wisely
RestoreCommandPermissionLevel = 'god' -- sets the permission level for the above mentioned command

-- THESE VEHICLE CATEGORIES ARE NOT RELATED TO THE ONES IN shared/vehicles.lua
-- Here you can define which category contains which vehicle class. These categories can then be used in the garage config
-- All vehicle classes can be found here: https://docs.fivem.net/natives/?_0x29439776AAA00A62
VehicleCategories = {
    ['car'] = {0,1,2,3,4,5,6,7,9,10,11,12},
    ['motorcycle'] = {8},
    ['boat'] = {14},
    ['helicopter'] = {15},
    ['plane'] = {16},
    ['service'] = {17},
    ['emergency'] = {18},
    ['other'] = {13} -- cycles: 13 - you can move cycles to cars if you want and have anything else like military vehicles in this category
    -- you can also create new / delete or update categories, and use them below in the config.
}

HouseGarageCategories = {'car', 'motorcycle', 'other'} -- Which categories are allowed to be parked at a house garage


VehicleHeading = 'driverside' -- only used when NO parking spots are defined in the garage config
--[[^^^^^^^^
    'forward' = will face the sameway as the ped
    'driverside' = will put the driver door closets to the ped
    'hood' = will face the hood towards ped
    'passengerside' = will put the passenger door closets to the ped
]]

SharedJobGarages = { -- define the job garages which are shared
    --'pdgarage',
}

Garages = {
    ['pillboxgarage'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(75.48, -576.16),
                vector2(63.96, -572.52),
                vector2(55.68, -570.44),
                vector2(48.57, -568.98),
                vector2(38.42, -567.4),
                vector2(31.73, -566.63),
                vector2(20.83, -566.22),
                vector2(19.61, -569.19),
                vector2(15.02, -567.57),
                vector2(3.76, -598.58),
                vector2(23.77, -605.67),
                vector2(7.99, -648.6),
                vector2(21.81, -653.62),
                vector2(20.7, -657.82),
                vector2(32.76, -662.45),
                vector2(34.63, -661.22),
                vector2(48.2, -666.25),
                vector2(78.06, -584.13),
                vector2(73.72, -582.12),
            },
            ['minZ'] = 30.6,  -- min height of the parking zone
            ['maxZ'] = 32.6,  -- max height of the parking zone
        },
        label = 'Lower Power St Parking',
        showBlip = true,
        blipcoords = vector3(37.08, -616.99, 34.19),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
            vector4(48.46, -600.58, 31.05, 339.83),
            vector4(45.27, -598.81, 31.05, 337.94),
            vector4(41.67, -597.67, 31.05, 340.45),
            vector4(38.56, -596.16, 31.05, 338.12),
            vector4(34.99, -595.47, 31.05, 340.89),
            vector4(31.2, -593.92, 31.05, 339.65),
            vector4(27.64, -592.9, 31.05, 341.86),
            vector4(7.72, -596.58, 31.05, 251.56),
            vector4(9.52, -592.97, 31.05, 249.91),
            vector4(10.79, -589.67, 31.05, 248.15),
            vector4(11.64, -586.28, 31.05, 250.38),
            vector4(13.02, -582.73, 31.05, 250.56),
            vector4(14.43, -579.28, 31.05, 250.48),
            vector4(15.79, -575.91, 31.05, 250.57),
            vector4(16.99, -572.2, 31.05, 250.35),
            vector4(32.27, -579.78, 31.05, 338.59),
            vector4(36.28, -581.01, 31.05, 342.11),
            vector4(39.79, -581.82, 31.05, 339.93),
            vector4(42.7, -583.86, 31.05, 338.52),
            vector4(46.25, -584.88, 31.05, 343.14),
            vector4(49.66, -586.2, 31.05, 341.91),
            vector4(53.64, -586.94, 31.05, 341.75),
            vector4(57.03, -588.71, 31.05, 340.63),
            vector4(64.95, -576.19, 31.05, 163.06),
            vector4(68.08, -577.66, 31.05, 154.95),
            vector4(72.16, -578.61, 31.05, 155.89),
            vector4(73.41, -586.19, 31.05, 69.64),
            vector4(72.48, -589.82, 31.05, 67.8),
            vector4(70.89, -592.9, 31.05, 68.41),
            vector4(69.46, -596.76, 31.05, 68.6),
            vector4(67.89, -600.17, 31.05, 69.91),
            vector4(67.24, -603.68, 31.05, 67.92),
            vector4(65.89, -607.19, 31.05, 68.69),
            vector4(64.22, -611.22, 31.1, 68.4),
            vector4(54.68, -638.55, 31.09, 246.21),
            vector4(53.23, -641.75, 31.06, 69.7),
            vector4(52.06, -645.06, 31.05, 70.13),
            vector4(50.58, -648.56, 31.05, 67.35),
            vector4(49.61, -652.33, 31.05, 69.85),
            vector4(48.33, -655.49, 31.05, 68.67),
            vector4(47.37, -659.23, 31.05, 69.73),
            vector4(45.67, -662.47, 31.05, 66.96),
        }
    },
    ['mirrorpark'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(1043.447265625, -767.26947021484),
                vector2(1049.4702148438, -769.44775390625),
                vector2(1049.4797363281, -794.31622314453),
                vector2(1048.9655761719, -794.32214355469),
                vector2(1049.03125, -793.87451171875),
                vector2(1043.466796875, -793.80151367188),
                vector2(1043.3436279297, -794.52691650391),
                vector2(1031.5026855469, -794.34808349609),
                vector2(1007.7255859375, -764.88061523438),
                vector2(1022.2494506836, -752.11022949219),
                vector2(1025.6563720703, -755.25653076172),
                vector2(1030.9210205078, -758.50311279297),
                vector2(1031.2462158203, -758.19201660156),
                vector2(1035.1042480469, -760.79956054688),
                vector2(1030.6268310547, -767.16302490234),
                vector2(1025.9473876953, -763.81085205078),
                vector2(1024.8063964844, -765.39245605469),
                vector2(1033.9915771484, -772.05816650391),
                vector2(1036.6497802734, -781.24871826172),
                vector2(1038.708984375, -780.87786865234),
                vector2(1035.7690429688, -770.72528076172),
                vector2(1032.0593261719, -768.04278564453),
                vector2(1034.0390625, -764.51586914062),
                vector2(1036.8060302734, -766.30773925781),
                vector2(1038.0424804688, -763.41851806641),
                vector2(1043.5157470703, -766.21325683594)
            },
            ['minZ'] = 56.50,
            ['maxZ'] = 59.20
        },
        label = 'Mirror Park Parking',
        showBlip = true,
        blipcoords = vector3(1037.65, -771.62, 58.01),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
            vector4(1023.5, -756.15, 57.48, 225.44),
            vector4(1020.64, -758.19, 57.49, 225.22),
            vector4(1017.57, -760.75, 57.47, 222.83),
            vector4(1014.9, -763.11, 57.4, 223.82),
            vector4(1016.1, -770.57, 57.41, 311.2),
            vector4(1018.8, -773.42, 57.43, 308.15),
            vector4(1020.68, -776.34, 57.39, 311.86),
            vector4(1023.75, -779.38, 57.41, 309.66),
            vector4(1025.72, -782.07, 57.4, 308.8),
            vector4(1028.49, -784.92, 57.41, 307.36),
            vector4(1030.06, -787.96, 57.38, 310.65),
            vector4(1038.12, -791.16, 57.47, 1.48),
            vector4(1046.49, -785.56, 57.5, 89.6),
            vector4(1046.38, -782.01, 57.51, 92.17),
            vector4(1046.22, -778.03, 57.52, 89.04),
            vector4(1046.27, -774.45, 57.52, 90.5),
            vector4(1030.96, -773.4, 57.57, 144.89),
            vector4(1028.05, -771.42, 57.55, 146.44),
            vector4(1029.35, -763.6, 57.49, 56.05),
            vector4(1041.6, -791.45, 57.5, 0.97),
        }
    },
    ['casinop'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(915.48345947266, -14.229139328003),
                vector2(912.52160644531, -19.256662368774),
                vector2(914.41729736328, -20.468030929565),
                vector2(928.14013671875, -29.422761917114),
                vector2(931.68640136719, -24.097787857056),
                vector2(943.31915283203, -31.373510360718),
                vector2(940.18115234375, -36.682193756104),
                vector2(940.63336181641, -37.222324371338),
                vector2(941.06457519531, -38.056762695312),
                vector2(940.69250488281, -39.514526367188),
                vector2(945.86834716797, -42.898574829102),
                vector2(936.578125, -58.041912078857),
                vector2(935.71746826172, -59.93187713623),
                vector2(935.32781982422, -63.596141815186),
                vector2(935.49609375, -65.299346923828),
                vector2(936.2734375, -67.329566955566),
                vector2(938.08367919922, -69.736022949219),
                vector2(939.06182861328, -70.789291381836),
                vector2(942.05615234375, -73.50260925293),
                vector2(944.24096679688, -76.701873779297),
                vector2(945.71282958984, -80.333465576172),
                vector2(945.46759033203, -86.331184387207),
                vector2(944.24163818359, -90.072593688965),
                vector2(942.83435058594, -92.46647644043),
                vector2(928.69256591797, -105.37116241455),
                vector2(926.07592773438, -107.04386138916),
                vector2(922.68194580078, -107.79019927979),
                vector2(918.29956054688, -107.78350067139),
                vector2(914.76385498047, -106.68801879883),
                vector2(891.66986083984, -92.136535644531),
                vector2(894.90283203125, -86.966018676758),
                vector2(877.28314208984, -75.933624267578),
                vector2(873.83764648438, -81.048561096191),
                vector2(849.61877441406, -65.853485107422),
                vector2(842.07305908203, -59.212493896484),
                vector2(832.29779052734, -48.991901397705),
                vector2(836.66088867188, -44.546573638916),
                vector2(834.18530273438, -42.00004196167),
                vector2(832.93865966797, -39.975162506104),
                vector2(832.380859375, -35.275825500488),
                vector2(833.16229248047, -31.17188835144),
                vector2(839.43792724609, -22.388980865479),
                vector2(849.22601318359, -10.30827331543),
                vector2(871.66424560547, 12.689045906067),
                vector2(872.94342041016, 12.611633300781),
                vector2(881.33111572266, 7.0416121482849),
                vector2(880.61773681641, 5.6222538948059),
                vector2(880.45855712891, 1.066015958786),
                vector2(889.86468505859, -5.0284695625305),
                vector2(894.46960449219, -2.9582657814026),
                vector2(895.51623535156, -1.5529407262802)
            },
            ['minZ'] = 77.50,
            ['maxZ'] = 80.00
        },
        label = 'Casino Parking',
        showBlip = true,
        blipcoords = vector3(888.47, -37.44, 78.76),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
            vector4(874.36, -77.52, 78.34, 326.7),
            vector4(868.22, -74.12, 78.34, 327.6),
            vector4(865.89, -71.32, 78.34, 327.2),
            vector4(862.79, -70.26, 78.34, 327.35),
            vector4(859.57, -67.92, 78.34, 326.45),
            vector4(856.54, -66.59, 78.34, 326.94),
            vector4(853.6, -64.76, 78.34, 329.96),
            vector4(850.98, -62.23, 78.34, 315.33);
            vector4(848.28, -60.42, 78.34, 316.25),
            vector4(845.29, -58.06, 78.34, 316.99),
            vector4(843.2, -55.19, 78.34, 315.68),
            vector4(841.22, -52.13, 78.34, 315.19),
            vector4(838.31, -49.98, 78.34, 309.63),
            vector4(836.03, -47.87, 78.34, 310.48),
            vector4(871.34, -75.41, 78.34, 327.5),
            vector4(934.99, -72.5, 78.27, 132.69),
            vector4(937.69, -74.87, 78.27, 135.96),
            vector4(940.12, -77.9, 78.27, 124.93),
            vector4(874.36, -77.52, 78.34, 326.7),
            vector4(871.34, -75.41, 78.34, 327.5),
            vector4(894.66, -90.02, 78.34, 329.43),
            vector4(897.75, -92.07, 78.34, 328.5),
            vector4(900.96, -93.67, 78.34, 326.42),
            vector4(903.67, -95.7, 78.34, 328.69),
            vector4(906.77, -97.42, 78.34, 326.69),
            vector4(909.56, -98.98, 78.27, 329.54),
            vector4(912.88, -100.65, 78.27, 327.47),
            vector4(915.52, -102.44, 78.27, 328.46),
            vector4(919.92, -104.15, 78.27, 355.56),
            vector4(924.34, -102.86, 78.27, 23.29),
            vector4(928.29, -100.03, 78.27, 41.76),
            vector4(931.14, -98.26, 78.27, 42.82),
            vector4(933.29, -95.84, 78.27, 43.98),
            vector4(935.95, -93.66, 78.27, 43.12),
            vector4(938.28, -91.0, 78.27, 43.96),
            vector4(941.5, -86.74, 78.27, 71.64),
            vector4(942.22, -82.22, 78.27, 96.61),
            vector4(932.29, -67.33, 78.27, 108.81),
            vector4(931.48, -62.49, 78.27, 87.5),
            vector4(933.04, -58.41, 78.27, 74.44),
            vector4(934.81, -53.94, 78.27, 56.79),
            vector4(936.58, -51.51, 78.27, 59.07),
            vector4(938.49, -48.34, 78.27, 57.96),
            vector4(939.46, -45.37, 78.27, 57.51),
            vector4(941.87, -42.09, 78.27, 57.26),
            vector4(939.92, -33.37, 78.27, 147.28),
            vector4(937.11, -31.58, 78.27, 146.31),
            vector4(934.46, -29.74, 78.27, 147.43),
            vector4(931.24, -28.27, 78.27, 148.17),
            vector4(911.98, -15.91, 78.27, 148.59),
            vector4(908.33, -14.25, 78.27, 151.66),
            vector4(905.28, -11.85, 78.27, 146.75),
            vector4(901.6, -10.25, 78.27, 151.03),
            vector4(898.56, -7.47, 78.27, 150.42),
            vector4(894.74, -5.36, 78.27, 147.31),
            vector4(878.41, 5.09, 78.27, 148.03),
            vector4(874.81, 6.34, 78.27, 145.35),
            vector4(872.04, 8.2, 78.27, 147.69),
            vector4(857.52, -16.84, 78.27, 61.37),
            vector4(855.4, -18.91, 78.27, 56.95),
            vector4(853.22, -21.71, 78.27, 58.03),
            vector4(851.4, -24.62, 78.27, 56.48),
            vector4(849.71, -27.73, 78.27, 56.12),
            vector4(848.46, -30.95, 78.27, 58.58),
            vector4(846.43, -33.78, 78.27, 58.11),
            vector4(844.31, -36.58, 78.27, 58.6),
            vector4(851.99, -41.32, 78.27, 237.04),
            vector4(854.14, -38.45, 78.27, 237.84),
            vector4(855.52, -35.12, 78.27, 239.77),
            vector4(857.58, -32.6, 78.27, 237.61),
            vector4(859.49, -29.77, 78.27, 238.44),
            vector4(860.76, -26.41, 78.27, 239.23),
            vector4(862.82, -23.64, 78.27, 238.93),
            vector4(864.37, -20.41, 78.27, 237.61),
            vector4(867.05, -18.08, 78.27, 237.15),
            vector4(868.52, -15.1, 78.27, 236.79),
            vector4(870.25, -12.23, 78.27, 236.92),
            vector4(871.96, -9.18, 78.27, 236.79),
            vector4(860.59, -50.52, 78.27, 56.19),
            vector4(862.21, -47.59, 78.27, 57.87),
            vector4(864.07, -44.72, 78.27, 57.35),
            vector4(866.09, -41.98, 78.27, 59.81),
            vector4(868.02, -39.09, 78.27, 58.16),
            vector4(869.38, -35.99, 78.27, 59.41),
            vector4(871.76, -33.27, 78.27, 57.79),
            vector4(873.26, -30.41, 78.27, 58.11),
            vector4(875.5, -27.57, 78.27, 59.75),
            vector4(876.7, -24.3, 78.27, 55.59),
            vector4(878.68, -21.55, 78.27, 55.73),
            vector4(880.83, -18.82, 78.27, 58.7),
            vector4(882.29, -15.94, 78.27, 59.44),
            vector4(868.59, -55.55, 78.27, 239.79),
            vector4(870.31, -52.52, 78.27, 237.16),
            vector4(872.25, -49.62, 78.27, 238.25),
            vector4(873.82, -46.81, 78.27, 237.55),
            vector4(875.38, -43.64, 78.27, 240.61),
            vector4(877.57, -40.99, 78.27, 238.89),
            vector4(879.2, -37.86, 78.27, 239.24),
            vector4(881.32, -35.29, 78.27, 239.98),
            vector4(882.71, -32.06, 78.27, 239.47),
            vector4(884.88, -29.13, 78.27, 238.24),
            vector4(886.69, -26.11, 78.27, 238.21),
            vector4(888.29, -23.61, 78.27, 236.97),
            vector4(890.23, -20.25, 78.27, 237.91),
            vector4(879.01, -62.07, 78.27, 57.16),
            vector4(880.87, -59.46, 78.27, 56.4),
            vector4(882.31, -55.9, 78.27, 56.01),
            vector4(884.39, -53.05, 78.27, 55.15),
            vector4(886.74, -50.98, 78.27, 57.74),
            vector4(887.88, -47.3, 78.27, 56.18),
            vector4(889.9, -44.62, 78.27, 57.31),
            vector4(891.22, -41.1, 78.27, 56.82),
            vector4(893.37, -38.44, 78.27, 57.27),
            vector4(894.9, -35.5, 78.27, 57.88),
            vector4(896.66, -32.62, 78.27, 56.27),
            vector4(898.89, -29.89, 78.27, 59.62),
            vector4(900.59, -27.03, 78.27, 57.96),
            vector4(918.92, -38.5, 78.27, 57.96),
            vector4(917.27, -41.62, 78.27, 57.19),
            vector4(915.72, -44.57, 78.27, 58.35),
            vector4(913.25, -46.72, 78.27, 59.34),
            vector4(911.8, -50.19, 78.27, 58.27),
            vector4(909.86, -52.95, 78.27, 56.01),
            vector4(907.82, -56.09, 78.27, 58.75),
            vector4(906.64, -59.22, 78.27, 59.0),
            vector4(904.82, -62.24, 78.27, 58.09),
            vector4(902.76, -64.94, 78.27, 57.42),
            vector4(900.32, -67.77, 78.27, 60.95),
            vector4(898.92, -70.71, 78.27, 59.52),
            vector4(897.37, -73.94, 78.27, 60.01),
            vector4(905.41, -78.55, 78.27, 237.47),
            vector4(906.51, -75.4, 78.27, 239.08),
            vector4(908.51, -72.21, 78.27, 240.06),
            vector4(910.57, -69.75, 78.27, 239.33),
            vector4(912.5, -66.76, 78.27, 236.77),
            vector4(914.61, -63.85, 78.27, 236.27),
            vector4(916.47, -61.02, 78.27, 239.26),
            vector4(918.2, -57.97, 78.27, 239.18),
            vector4(919.83, -55.26, 78.27, 239.26),
            vector4(921.38, -52.13, 78.27, 239.95),
            vector4(923.46, -49.15, 78.27, 240.09),
            vector4(925.59, -46.6, 78.27, 238.16),
            vector4(925.88, -42.81, 78.27, 239.65),
            vector4(915.9, -84.07, 78.27, 56.96),
            vector4(917.48, -81.16, 78.27, 58.09),
            vector4(920.09, -78.3, 78.27, 55.86),
            vector4(927.69, -83.29, 78.27, 238.3),
            vector4(926.1, -86.14, 78.27, 236.23),
            vector4(924.0, -89.35, 78.27, 237.62),
        }
    },
    ['leigonsquarealley'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(69.414520263672, -849.34320068359),
                vector2(59.563220977783, -876.13598632812),
                vector2(53.812015533447, -873.94421386719),
                vector2(52.552845001221, -876.92974853516),
                vector2(58.53719329834, -879.25579833984),
                vector2(49.19457244873, -904.89520263672),
                vector2(12.526390075684, -891.47192382812),
                vector2(32.711112976074, -835.94616699219),
                vector2(43.370277404785, -840.03533935547),
                vector2(41.773113250732, -844.49047851562),
                vector2(44.550273895264, -845.6552734375),
                vector2(46.358081817627, -841.06768798828)
            },
            ['minZ'] = 29.0,
            ['maxZ'] = 31.10
        },
        label = 'Legion Square Parking',
        showBlip = true,
        blipcoords = vector3(52.41, -874.53, 30.42),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
            vector4(19.23, -880.71, 29.8, 341.54),
            vector4(22.45, -882.16, 29.79, 340.09),
            vector4(25.93, -883.46, 29.79, 343.72),
            vector4(37.8, -887.64, 29.77, 160.81),
            vector4(40.91, -889.25, 29.75, 160.21),
            vector4(44.33, -890.22, 29.75, 159.58),
            vector4(48.14, -890.77, 29.75, 161.49),
            vector4(51.0, -892.1, 29.74, 158.87),
            vector4(52.71, -887.68, 29.81, 158.88),
            vector4(49.66, -885.99, 29.83, 161.45),
            vector4(45.81, -885.22, 29.83, 161.8),
            vector4(42.78, -884.27, 29.83, 161.42),
            vector4(39.63, -883.03, 29.84, 159.02),
            vector4(27.5, -878.27, 29.87, 160.31),
            vector4(24.28, -877.02, 29.88, 158.81),
            vector4(20.96, -876.17, 29.88, 157.99),
            vector4(25.15, -864.12, 30.08, 161.27),
            vector4(28.23, -865.24, 30.07, 158.11),
            vector4(32.0, -866.64, 30.06, 158.96),
            vector4(44.22, -870.05, 30.05, 159.97),
            vector4(47.29, -872.04, 30.03, 160.4),
            vector4(50.56, -873.75, 30.01, 158.52),
            vector4(60.1, -866.79, 30.13, 159.36),
            vector4(56.83, -865.6, 30.14, 161.35),
            vector4(53.77, -864.08, 30.16, 158.58),
            vector4(50.79, -863.1, 30.16, 159.63),
            vector4(47.46, -861.17, 30.18, 160.06),
            vector4(35.2, -857.05, 30.21, 160.46),
            vector4(31.39, -855.98, 30.22, 163.34),
            vector4(28.65, -854.67, 30.24, 156.84),
            vector4(34.44, -839.08, 30.49, 161.56),
            vector4(37.43, -840.18, 30.48, 159.6),
            vector4(41.04, -841.14, 30.47, 157.63),
            vector4(53.89, -846.47, 30.42, 159.93),
            vector4(56.93, -847.64, 30.41, 162.76),
            vector4(60.37, -848.47, 30.41, 161.79),
            vector4(63.44, -850.18, 30.39, 157.81),
            vector4(236.68, -795.08, 30.08, 66.13),
            vector4(233.41, -774.07, 30.31, 248.68)
        }
    },
    ['motelgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(266.04238891602, -348.67025756836),
                vector2(285.89639282227, -356.23840332031),
                vector2(287.69180297852, -351.80249023438),
                vector2(294.92953491211, -354.30316162109),
                vector2(304.30255126953, -329.3703918457),
                vector2(268.12475585938, -316.15463256836),
                vector2(261.09896850586, -334.95642089844),
                vector2(268.07708740234, -337.50454711914),
                vector2(266.080078125, -343.24353027344),
                vector2(267.49453735352, -344.12811279297)
            },
            ['minZ'] = 43.5,  -- min height of the parking zone
            ['maxZ'] = 47.15,  -- max height of the parking zone
        },
        label = "Motel Parking",
        showBlip = true,
        blipcoords = vector3(273.43, -343.99, 44.91),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                -- public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},                --car, air, sea
        drawText = 'Parking',
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
            vector4(277.62, -340.01, 44.5, 70.08),
            vector4(284.0, -342.32, 44.5, 70.09),
            vector4(278.33, -336.51, 44.49, 70.34),
            vector4(284.94, -338.87, 44.5, 70.28),
            vector4(285.3, -335.65, 44.5, 70.49),
            vector4(286.94, -332.56, 44.5, 67.79),
            vector4(288.56, -329.41, 44.5, 69.87),
            vector4(289.54, -325.98, 44.5, 70.81),
            vector4(300.23, -330.3, 44.5, 69.25),
            vector4(298.52, -333.09, 44.5, 69.25),
            vector4(298.66, -337.07, 44.5, 67.98),
            vector4(297.0, -340.11, 44.49, 69.9),
            vector4(296.05, -342.85, 44.49, 68.75),
            vector4(294.61, -346.22, 44.5, 67.07),
            vector4(292.54, -349.49, 44.52, 68.4),
            vector4(268.42, -325.58, 44.5, 249.47),
            vector4(267.58, -329.12, 44.49, 247.62),
            vector4(266.03, -332.22, 44.5, 247.32),
            vector4(271.12, -319.16, 44.5, 67.31),
            vector4(283.0, -323.71, 44.5, 73.83),
            vector4(281.99, -326.86, 44.5, 69.26),
            vector4(281.1, -330.43, 44.49, 71.55),
            vector4(279.59, -333.68, 44.5, 71.98),
            vector4(269.97, -322.62, 44.5, 248.07),
        }
    },
    ['sapcounsel'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-362.48254394531, -793.2802734375),
                vector2(-362.46408081055, -730.71594238281),
                vector2(-360.078125, -727.29187011719),
                vector2(-359.91299438477, -726.02014160156),
                vector2(-355.41589355469, -725.94165039062),
                vector2(-347.00802612305, -729.64282226562),
                vector2(-312.21273803711, -742.18682861328),
                vector2(-310.43478393555, -737.13165283203),
                vector2(-266.06091308594, -753.01647949219),
                vector2(-275.53680419922, -777.63562011719),
                vector2(-284.21676635742, -774.40985107422),
                vector2(-285.57073974609, -778.85809326172),
                vector2(-287.20227050781, -778.1279296875),
                vector2(-289.10836791992, -783.76214599609),
                vector2(-319.63018798828, -772.48706054688),
                vector2(-335.69149780273, -786.58020019531),
                vector2(-345.55349731445, -791.60711669922)
            },
            ['minZ'] = 33.00,  -- min height of the parking zone
            ['maxZ'] = 37.60,  -- max height of the parking zone
        },
        label = "San Andreas Parking",
        showBlip = true,
        blipcoords = vector3(-330.01, -780.33, 33.96),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        WarpPlayerIntoVehicle = false,
        debug = false,                 --car, air, sea
        ['ParkingSpots'] = {
            vector4(-356.89, -749.29, 33.54, 270.15),
            vector4(-356.83, -753.66, 33.54, 269.64),
            vector4(-357.22, -756.74, 33.54, 269.93),
            vector4(-357.17, -760.01, 33.54, 269.71),
            vector4(-357.4, -764.54, 33.54, 268.82),
            vector4(-357.14, -767.51, 33.54, 269.67),
            vector4(-357.09, -770.59, 33.54, 271.03),
            vector4(-357.09, -776.02, 33.54, 267.95),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-357.37, -746.23, 33.54, 269.64),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-289.82, -764.25, 33.54, 160.83),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-295.59, -762.4, 33.54, 160.93),
            vector4(-298.43, -761.45, 33.54, 159.95),
            vector4(-302.41, -760.02, 33.54, 161.24),
            vector4(-305.16, -758.37, 33.54, 158.98),
            vector4(-308.23, -757.98, 33.54, 160.64),
            vector4(-311.14, -757.03, 33.54, 158.78),
            vector4(-315.09, -755.34, 33.54, 157.34),
            vector4(-317.51, -753.39, 33.54, 160.53),
            vector4(-320.45, -752.5, 33.55, 161.44),
            vector4(-323.24, -751.76, 33.54, 158.57),
            vector4(-329.02, -750.3, 33.54, 179.15),
            vector4(-331.75, -750.26, 33.54, 179.53),
            vector4(-334.52, -750.73, 33.54, 181.13),
            vector4(-337.46, -751.25, 33.54, 183.02),
            vector4(-342.14, -749.82, 33.55, 272.39),
            vector4(-341.94, -753.53, 33.55, 94.28),
            vector4(-341.97, -756.82, 33.55, 90.65),
            vector4(-342.23, -760.49, 33.55, 88.42),
            vector4(-341.84, -764.1, 33.55, 89.13),
            vector4(-341.93, -767.36, 33.55, 91.18),
            vector4(-357.3, -732.9, 33.54, 270.41),
            vector4(-357.24, -737.63, 33.55, 269.9),
            vector4(-357.33, -743.24, 33.54, 270.89),
            vector4(-295.82, -778.26, 33.54, 342.22),
            vector4(-299.37, -776.74, 33.54, 342.64),
            vector4(-307.47, -773.5, 33.54, 340.32),
            vector4(-303.19, -775.79, 33.54, 339.27),
            vector4(-310.37, -772.78, 33.54, 339.1),
            vector4(-313.07, -771.64, 33.54, 338.38),
            vector4(-315.73, -770.26, 33.54, 339.87),
            vector4(-273.07, -761.54, 33.54, 69.58),
            vector4(-273.81, -765.05, 33.54, 71.99),
            vector4(-276.05, -771.7, 33.54, 68.27),
            vector4(-277.3, -775.37, 33.54, 70.28),
            vector4(-277.07, -751.83, 33.54, 160.8),
            vector4(-279.97, -750.75, 33.54, 160.08),
            vector4(-284.28, -748.9, 33.54, 159.2),
            vector4(-287.28, -748.29, 33.54, 160.63),
            vector4(-290.22, -747.64, 33.54, 159.94),
            vector4(-292.89, -746.25, 33.54, 160.17),
            vector4(-297.03, -744.69, 33.54, 159.37),
            vector4(-299.71, -743.7, 33.54, 159.26),
            vector4(-302.62, -742.8, 33.54, 159.48),
            vector4(-275.18, -768.22, 33.54, 71.26)
        }
    },
    ['spanishave'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1135.1311035156, -778.41644287109),
                vector2(-1114.7188720703, -761.08288574219),
                vector2(-1142.3354492188, -729.19293212891),
                vector2(-1161.1352539062, -745.50402832031)
            },
            ['minZ'] = 17.69,  -- min height of the parking zone
            ['maxZ'] = 20.61,  -- max height of the parking zone
        },
        label = "Spanish Ave Parking",
        showBlip = true,
        blipcoords = vector3(-1160.86, -741.41, 19.63),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        debug = false
    },
    ['caears24'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(76.188446044922, 7.9120540618896),
                vector2(81.977760314941, 23.525623321533),
                vector2(55.219917297363, 32.982769012451),
                vector2(49.228351593018, 16.684007644653),
                vector2(68.127639770508, 9.6578321456909),
                vector2(68.597557067871, 10.655039787292)
            },
            ['minZ'] = 68.00,  -- min height of the parking zone
            ['maxZ'] = 70.45,  -- max height of the parking zone
        },
        label = "Caesar 24h Parking",
        showBlip = true,
        blipcoords = vector3(69.84, 12.6, 68.96),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
            vector4(54.49, 19.49, 69.14, 339.68),
            vector4(57.48, 17.98, 68.92, 340.13),
            vector4(60.49, 16.99, 68.8, 338.05),
            vector4(64.03, 16.28, 68.75, 337.71),
        }
    },
    ['caears242'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-480.87042236328, -819.84265136719),
                vector2(-441.08392333984, -820.39178466797),
                vector2(-440.29922485352, -795.61010742188),
                vector2(-450.12713623047, -795.83892822266),
                vector2(-450.57876586914, -792.54748535156),
                vector2(-480.38143920898, -792.79217529297)
            },
            ['minZ'] = 29.47,  -- min height of the parking zone
            ['maxZ'] = 32.82,  -- max height of the parking zone
        },
        label = "Caesar 24h Parking",
        showBlip = true,
        blipcoords = vector3(-475.31, -818.73, 30.46),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-477.62, -816.44, 30.05, 271.2),
            vector4(-477.28, -813.29, 30.1, 265.04),
            vector4(-477.3, -809.77, 30.12, 268.93),
            vector4(-477.37, -806.7, 30.12, 271.51),
            vector4(-477.45, -803.55, 30.12, 268.73),
            vector4(-477.12, -800.59, 30.12, 270.28),
            vector4(-476.98, -796.99, 30.12, 269.26),
            vector4(-476.98, -796.99, 30.12, 269.26),
            vector4(-476.99, -794.09, 30.13, 268.72),
            vector4(-459.54, -797.15, 30.12, 267.11),
            vector4(-460.45, -800.21, 30.12, 270.89),
            vector4(-460.18, -803.33, 30.11, 269.85),
            vector4(-460.74, -809.84, 30.11, 270.31),
            vector4(-460.21, -813.14, 30.13, 271.44),
            vector4(-460.21, -816.42, 30.16, 269.02),
            vector4(-444.8, -797.5, 30.12, 90.73),
            vector4(-444.33, -801.16, 30.12, 92.51),
            vector4(-444.6, -804.72, 30.11, 90.88),
            vector4(-444.63, -808.75, 30.11, 89.24),
            vector4(-443.84, -812.02, 30.13, 87.33),
            vector4(-444.21, -816.02, 30.24, 89.21),
            vector4(-460.34, -806.46, 30.11, 267.68),
            vector4(-466.14, -816.36, 30.11, 88.66),
            vector4(-466.18, -812.98, 30.11, 88.96),
            vector4(-466.22, -809.72, 30.11, 89.54),
            vector4(-467.38, -806.99, 30.11, 89.36),
            vector4(-466.99, -803.3, 30.12, 85.98),
            vector4(-466.81, -800.55, 30.12, 89.29),
            vector4(-466.41, -797.08, 30.12, 88.09),
            vector4(-460.34, -806.46, 30.11, 267.68),
        }
    },
    ['lagunapi'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(358.69207763672, 302.30017089844),
                vector2(351.44546508789, 277.92486572266),
                vector2(355.01831054688, 277.03842163086),
                vector2(353.3766784668, 270.50997924805),
                vector2(387.72875976562, 257.78961181641),
                vector2(399.73132324219, 290.71780395508),
                vector2(364.49926757812, 300.54202270508),
                vector2(362.70568847656, 295.12139892578),
                vector2(359.67681884766, 296.56146240234),
                vector2(361.49871826172, 301.58950805664)
            },
            ['minZ'] = 102.00,  -- min height of the parking zone
            ['maxZ'] = 105.89,  -- max height of the parking zone
        },
        label = "Laguna Parking",
        showBlip = true,
        blipcoords = vector3(364.37, 297.83, 103.49),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
            vector4(359.53, 270.99, 102.65, 341.37),
            vector4(363.59, 269.88, 102.64, 341.77),
            vector4(368.05, 267.75, 102.62, 337.77),
            vector4(371.2, 266.77, 102.6, 340.94),
            vector4(375.32, 265.38, 102.59, 339.29),
            vector4(379.12, 264.74, 102.59, 337.98),
            vector4(388.53, 269.67, 102.58, 68.7),
            vector4(389.17, 272.93, 102.58, 72.26),
            vector4(391.11, 276.63, 102.57, 69.67),
            vector4(392.57, 280.58, 102.57, 70.77),
            vector4(393.81, 283.91, 102.55, 71.82),
            vector4(390.92, 290.55, 102.58, 163.29),
            vector4(386.89, 291.62, 102.63, 162.58),
            vector4(383.07, 292.87, 102.69, 164.08),
            vector4(379.23, 293.87, 102.77, 162.43),
            vector4(374.93, 294.49, 102.85, 162.54),
            vector4(375.86, 274.26, 102.65, 157.86),
            vector4(371.94, 275.54, 102.71, 158.54),
            vector4(368.03, 277.26, 102.77, 156.9),
            vector4(378.84, 281.93, 102.68, 336.98),
            vector4(375.05, 283.0, 102.75, 339.72),
            vector4(370.91, 284.66, 102.83, 337.04),
            vector4(361.12, 293.52, 103.08, 251.69),
            vector4(359.6, 290.0, 103.08, 249.21),
            vector4(357.99, 286.45, 103.1, 248.69),
            vector4(356.98, 283.01, 103.0, 248.05),
        }
    },
    ['airportp'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-779.76104736328, -2023.2966308594),
                vector2(-775.14440917969, -2019.8140869141),
                vector2(-767.18334960938, -2012.3591308594),
                vector2(-760.70989990234, -2004.76171875),
                vector2(-756.01049804688, -1997.4604492188),
                vector2(-753.18353271484, -1990.4525146484),
                vector2(-751.64544677734, -1983.7036132812),
                vector2(-748.98046875, -1969.5380859375),
                vector2(-748.11468505859, -1967.5456542969),
                vector2(-746.72650146484, -1965.5721435547),
                vector2(-744.23596191406, -1963.4608154297),
                vector2(-739.22473144531, -1961.9007568359),
                vector2(-733.59368896484, -1962.0502929688),
                vector2(-729.30279541016, -1963.3483886719),
                vector2(-727.666015625, -1964.8414306641),
                vector2(-725.72021484375, -1966.9916992188),
                vector2(-714.04919433594, -2019.2927246094),
                vector2(-710.76025390625, -2032.8103027344),
                vector2(-707.01336669922, -2040.8115234375),
                vector2(-704.6533203125, -2044.3029785156),
                vector2(-703.19024658203, -2045.3291015625),
                vector2(-701.63171386719, -2045.6253662109),
                vector2(-699.74157714844, -2045.2917480469),
                vector2(-687.05395507812, -2039.5653076172),
                vector2(-685.76708984375, -2038.6518554688),
                vector2(-684.13092041016, -2036.3044433594),
                vector2(-672.29400634766, -2041.8348388672),
                vector2(-670.67193603516, -2043.4077148438),
                vector2(-665.39947509766, -2046.6591796875),
                vector2(-657.96466064453, -2048.1787109375),
                vector2(-655.55963134766, -2048.3508300781),
                vector2(-651.94177246094, -2047.6011962891),
                vector2(-649.02130126953, -2046.1932373047),
                vector2(-633.71252441406, -2030.9672851562),
                vector2(-631.34783935547, -2030.0726318359),
                vector2(-628.30303955078, -2030.5014648438),
                vector2(-616.89349365234, -2042.3790283203),
                vector2(-616.16394042969, -2045.1605224609),
                vector2(-617.02777099609, -2047.9118652344),
                vector2(-648.34002685547, -2079.3305664062),
                vector2(-652.69281005859, -2082.1706542969),
                vector2(-658.36376953125, -2083.3293457031),
                vector2(-671.02252197266, -2082.0708007812),
                vector2(-676.02673339844, -2082.1984863281),
                vector2(-684.85815429688, -2084.7019042969),
                vector2(-695.00408935547, -2087.8937988281),
                vector2(-701.19207763672, -2088.712890625),
                vector2(-703.89630126953, -2088.4221191406),
                vector2(-708.56176757812, -2085.2458496094),
                vector2(-713.30065917969, -2087.1435546875),
                vector2(-718.29937744141, -2082.3813476562),
                vector2(-724.05651855469, -2078.2341308594),
                vector2(-736.53204345703, -2071.5529785156),
                vector2(-746.24493408203, -2067.9118652344),
                vector2(-751.45703125, -2073.4653320312),
                vector2(-787.72106933594, -2037.2147216797)
            },
            ['minZ'] = 8.85,  -- min height of the parking zone
            ['maxZ'] = 10.10,  -- max height of the parking zone
        },
        label = "Airport Parking",
        showBlip = true,
        blipcoords = vector3(-796.86, -2024.85, 8.88),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        WarpPlayerIntoVehicle = false,
        debug = false
    },
    ['beachp'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1177.4599609375, -1504.8297119141),
                vector2(-1170.6567382812, -1500.1866455078),
                vector2(-1167.892578125, -1496.4272460938),
                vector2(-1167.0075683594, -1491.4938964844),
                vector2(-1168.083984375, -1487.3162841797),
                vector2(-1184.8902587891, -1461.9444580078),
                vector2(-1203.3045654297, -1475.2700195312),
                vector2(-1202.2609863281, -1476.640625),
                vector2(-1208.1496582031, -1480.9470214844),
                vector2(-1207.1524658203, -1483.8693847656),
                vector2(-1207.7424316406, -1485.8941650391),
                vector2(-1188.0931396484, -1513.3830566406),
                vector2(-1185.7036132812, -1511.7416992188),
                vector2(-1187.1550292969, -1509.7088623047),
                vector2(-1183.7425537109, -1507.1494140625),
                vector2(-1182.2048339844, -1508.9814453125)
            },
            ['minZ'] = 3.20,  -- min height of the parking zone
            ['maxZ'] = 6.53,  -- max height of the parking zone
        },
        label = "Beach Parking",
        showBlip = true,
        blipcoords = vector3(-1183.1, -1511.11, 4.36),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        debug = false
    },
    ["themotorhotel"] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1140.2746582031, 2644.5261230469),
                vector2(1108.8831787109, 2644.2172851562),
                vector2(1108.5783691406, 2660.1645507812),
                vector2(1089.9521484375, 2660.1198730469),
                vector2(1091.3571777344, 2677.4743652344),
                vector2(1133.5280761719, 2674.8422851562),
                vector2(1133.7532958984, 2658.8393554688),
                vector2(1140.4176025391, 2658.8898925781)
            },
            ['minZ'] = 36.78,  -- min height of the parking zone
            ['maxZ'] = 39.74,  -- max height of the parking zone
        },
        label = "The Motor Hotel Parking",
        showBlip = true,
        blipcoords = vector3(1137.77, 2663.54, 37.9),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        debug = false
    },
    ['liqourparking'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(934.54669189453, 3604.5546875),
                vector2(954.29815673828, 3604.1672363281),
                vector2(954.35180664062, 3626.7893066406),
                vector2(934.75305175781, 3626.3806152344)
            },
            ['minZ'] = 31.5,  -- min height of the parking zone
            ['maxZ'] = 35.99,  -- max height of the parking zone
        },
        label = "Liquor Parking",
        showBlip = true,
        blipcoords = vector3(934.95, 3606.59, 32.81),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        debug = false
    },
    ['haanparking'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(67.230964660645, 6414.7719726562),
                vector2(53.828144073486, 6401.8227539062),
                vector2(59.075645446777, 6396.736328125),
                vector2(57.678955078125, 6394.4799804688),
                vector2(55.321895599365, 6393.0532226562),
                vector2(49.954971313477, 6398.6840820312),
                vector2(32.203670501709, 6380.2915039062),
                vector2(36.029750823975, 6376.328125),
                vector2(33.88489151001, 6373.9545898438),
                vector2(31.614000320435, 6372.1850585938),
                vector2(27.5251121521, 6376.2802734375),
                vector2(3.0867385864258, 6350.3901367188),
                vector2(7.4540538787842, 6345.6538085938),
                vector2(6.2227344512939, 6343.2216796875),
                vector2(3.7218370437622, 6341.9638671875),
                vector2(-0.76969349384308, 6346.2749023438),
                vector2(-22.776170730591, 6325.3828125),
                vector2(-24.351142883301, 6322.0849609375),
                vector2(-23.452659606934, 6319.2861328125),
                vector2(-12.439478874207, 6304.8647460938),
                vector2(-10.365778923035, 6304.6127929688),
                vector2(5.0310492515564, 6313.4970703125),
                vector2(5.2357106208801, 6314.859375),
                vector2(41.809215545654, 6335.396484375),
                vector2(42.73751449585, 6334.2446289062),
                vector2(71.22339630127, 6349.8232421875),
                vector2(68.208351135254, 6355.2939453125),
                vector2(117.06902313232, 6378.890625)
            },
            ['minZ'] = 30.00,  -- min height of the parking zone
            ['maxZ'] = 33.38,  -- max height of the parking zone
        },
        label = "Bell Farms Parking",
        showBlip = true,
        blipcoords = vector3(78.34, 6418.74, 31.28),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false
    },
    ['legionsquare'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(239.88751220703, -820.52038574219),
                vector2(252.71513366699, -784.91027832031),
                vector2(258.39483642578, -786.82489013672),
                vector2(264.27755737305, -769.99841308594),
                vector2(218.69738769531, -754.69787597656),
                vector2(200.07238769531, -805.74285888672)
            },
            ['minZ'] = 29.07,  -- min height of the parking zone
            ['maxZ'] = 40.0,  -- max height of the parking zone
        },
        label = "Legion Square Parking",
        showBlip = true,
        blipcoords = vector3(215.9499, -809.698, 30.731),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
            vector4(219.38, -765.95, 30.41, 247.04),
            vector4(218.07, -768.47, 30.41, 248.86),
            vector4(216.93, -770.89, 30.42, 249.93),
            vector4(216.35, -773.48, 30.43, 249.43),
            vector4(215.02, -775.62, 30.44, 252.59),
            vector4(214.22, -778.6, 30.45, 247.99),
            vector4(213.67, -780.92, 30.45, 248.98),
            vector4(212.9, -783.52, 30.46, 249.01),
            vector4(210.97, -785.75, 30.5, 250.38),
            vector4(210.35, -788.41, 30.51, 249.85),
            vector4(209.74, -790.91, 30.51, 248.14),
            vector4(209.21, -793.47, 30.52, 249.87),
            vector4(207.96, -795.82, 30.55, 248.81),
            vector4(206.91, -798.68, 30.57, 248.97),
            vector4(205.45, -800.74, 30.6, 249.38),
            vector4(234.07, -771.23, 30.33, 249.64),
            vector4(232.09, -776.31, 30.3, 248.31),
            vector4(230.94, -778.87, 30.29, 248.97),
            vector4(230.7, -781.41, 30.28, 250.6),
            vector4(229.02, -783.81, 30.28, 250.06),
            vector4(227.64, -789.2, 30.26, 247.99),
            vector4(226.28, -791.42, 30.26, 248.95),
            vector4(225.72, -794.21, 30.24, 249.28),
            vector4(224.66, -796.59, 30.24, 247.01),
            vector4(223.2, -798.92, 30.25, 248.79),
            vector4(222.61, -801.4, 30.25, 248.1),
            vector4(221.77, -804.1, 30.26, 245.92),
            vector4(221.6, -806.74, 30.25, 247.77),
            vector4(219.83, -808.89, 30.26, 251.3),
            vector4(228.63, -768.88, 30.36, 69.31),
            vector4(227.76, -771.74, 30.35, 71.5),
            vector4(226.39, -773.88, 30.35, 68.62),
            vector4(225.43, -776.69, 30.35, 69.02),
            vector4(224.35, -778.81, 30.34, 64.93),
            vector4(224.25, -781.78, 30.33, 70.11),
            vector4(222.81, -784.16, 30.34, 72.1),
            vector4(221.16, -786.48, 30.35, 68.66),
            vector4(221.04, -789.3, 30.34, 68.07),
            vector4(219.76, -791.48, 30.34, 70.29),
            vector4(218.97, -794.38, 30.34, 68.04),
            vector4(218.34, -796.97, 30.34, 66.59),
            vector4(217.56, -799.45, 30.35, 69.51),
            vector4(216.23, -801.69, 30.37, 70.17),
            vector4(215.69, -804.56, 30.38, 68.56),
            vector4(228.66, -786.48, 30.27, 248.6),
            vector4(233.41, -774.07, 30.31, 248.68),
            vector4(236.32, -812.55, 29.88, 248.26),
            vector4(237.41, -809.93, 29.89, 244.26),
            vector4(238.45, -807.4, 29.9, 244.04),
            vector4(238.94, -804.82, 29.93, 248.53),
            vector4(240.36, -802.39, 29.94, 246.63),
            vector4(241.52, -799.87, 29.96, 245.68),
            vector4(242.03, -797.37, 29.98, 246.08),
            vector4(243.06, -794.79, 30.01, 249.35),
            vector4(244.27, -792.42, 30.03, 247.07),
            vector4(245.14, -789.87, 30.06, 247.13),
            vector4(246.18, -787.38, 30.08, 248.58),
            vector4(246.61, -784.52, 30.12, 248.32),
            vector4(248.17, -782.46, 30.14, 248.95),
            vector4(249.12, -779.63, 30.18, 249.01),
            vector4(249.32, -776.78, 30.22, 247.42),
            vector4(250.19, -774.3, 30.26, 248.86),
            vector4(244.75, -772.24, 30.29, 69.17),
            vector4(228.66, -786.48, 30.27, 248.6),
            vector4(233.41, -774.07, 30.31, 248.68),
            vector4(231.42, -810.44, 30.01, 70.18),
            vector4(231.62, -807.79, 30.03, 68.27),
            vector4(232.96, -805.51, 30.02, 66.62),
            vector4(234.88, -803.0, 30.02, 69.62),
            vector4(235.38, -800.43, 30.04, 68.23),
            vector4(236.58, -797.83, 30.05, 69.89),
            vector4(236.68, -795.08, 30.08, 66.13),
            vector4(237.88, -792.75, 30.08, 66.76),
            vector4(238.84, -790.11, 30.11, 68.34),
            vector4(240.15, -787.59, 30.13, 67.55),
            vector4(241.01, -785.27, 30.15, 69.84),
            vector4(244.51, -775.07, 30.26, 70.7),
            vector4(243.65, -777.69, 30.22, 67.25),
            vector4(242.44, -779.84, 30.2, 68.04),
            vector4(241.32, -782.41, 30.18, 69.19),
        }
    },
    ['cardepot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(410.33, -1660.35),
			vector2(423.39, -1645.19),
			vector2(424.0, -1640.5),
			vector2(423.87, -1632.95),
			vector2(423.17, -1628.41),
			vector2(411.61, -1619.73),
			vector2(406.27, -1626.09),
			vector2(403.39, -1623.67),
			vector2(388.1, -1641.98)
            },
            ['minZ'] = 27.00,  -- min height of the parking zone
            ['maxZ'] = 32.00,  -- max height of the parking zone
            debug = false,
        },
        label = "Depot Lot",
        showBlip = true,
        blipcoords = vector3(410.02, -1638.0, 29.29),
        blipName = "Depot Lot",
        blipColor = 33,
        blipNumber = 68,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Depot',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
			vector4(396.3, -1644.46, 28.79, 318.91),
			vector4(398.43, -1646.58, 28.79, 319.31),
			vector4(400.71, -1648.67, 28.79, 319.33),
			vector4(403.25, -1650.56, 28.79, 320.16),
			vector4(405.54, -1652.74, 28.79, 319.84),
			vector4(407.9, -1654.8, 28.79, 319.92),
			vector4(410.58, -1656.9, 28.79, 320.2),
			vector4(418.39, -1646.38, 28.79, 49.59),
			vector4(420.99, -1641.97, 28.79, 88.61),
			vector4(421.03, -1638.86, 28.79, 89.3),
			vector4(420.88, -1635.8, 28.79, 89.22),
			vector4(419.92, -1629.3, 28.79, 140.08),
			vector4(417.3, -1627.48, 28.79, 141.37),
        }
    },
    ['airdepot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-999.03, -2963.27),
            vector2(-984.43, -2940.1),
            vector2(-929.56, -2972.58),
            vector2(-946.13, -2993.06)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Air Depot',
        type = 'depot',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'AIR DEPOT',
        pilotcheck = true,
        WarpPlayerIntoVehicle = false,
        showBlip = true,
        blipName = 'Air Depot',
        blipNumber = 68,
        blipColor = 33,
        blipcoords = vector3(-952.99, -2971.44, 13.95),
        ParkingDistance = 200.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-943.33, -2976.68, 13.66, 60.43),
            vector4(-961.61, -2965.97, 13.67, 58.6),

        },
    },
    ['marinedepot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1810.19, -1233.03),
                vector2(-1799.33, -1218.73),
                vector2(-1789.91, -1228.46),
                vector2(-1799.9, -1239.3)
            },
            ['minZ'] = 0.00,  -- min height of the parking zone
            ['maxZ'] = 5.0,  -- max height of the parking zone
        },
        label = 'Marine Depot',
        type = 'depot',
        vehicleCategories = {'boat'},
        drawText = 'Marine Depot',
        WarpPlayerIntoVehicle = true,
        showBlip = true,
        blipName = 'Marine Depot',
        blipNumber = 68,
        blipColor = 33,
        blipcoords = vector3(-1798.56, -1228.96, 2.56),
        ParkingDistance = 200.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1799.33, -1234.35, 0.12, 321.97),
        },
    },
    ['pdimpound'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-1064.59, -880.22),
			vector2(-1079.66, -889.43),
			vector2(-1087.68, -877.75),
			vector2(-1070.35, -869.75)
            },
            ['minZ'] = 4.06,  -- min height of the parking zone
            ['maxZ'] = 10.06,  -- max height of the parking zone
            debug = false,
        },
        label = "Police Impound",
        showBlip = false,
        blipcoords = vector3(-1074.98, -877.02, 4.76),
        blipName = "Police Impound",
        blipNumber = 68,
        type = 'impound',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Police Impound',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        job = "police",
        debug = false,
        ['ParkingSpots'] = {
			vector4(-1079.54, -884.47, 4.17, 29.51),
			vector4(-1076.27, -882.5, 4.25, 29.57),
			vector4(-1072.71, -880.42, 4.34, 28.81),
			vector4(-1069.65, -878.42, 4.41, 30.68),
        }
    },
    ['pdairimpound'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-1028.36, -3014.71),
			vector2(-1018.08, -2996.04),
			vector2(-959.98, -3030.6),
			vector2(-969.84, -3051.52)
            },
            ['minZ'] = 13.06,  -- min height of the parking zone
            ['maxZ'] = 16.06,  -- max height of the parking zone
            debug = false,
        },
        label = "PD Air Impound",
        showBlip = false,
        blipcoords = vector3(-1074.98, -877.02, 4.76),
        blipName = "PD Air Impound",
        blipNumber = 68,
        type = 'impound',                --public, job, gang, depot
        vehicleCategories = {'helicopter', 'plane'},
        pilotcheck = false,
        drawText = 'PD Air Impound',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        job = "police",
        debug = false,
        ['ParkingSpots'] = {
			vector4(-971.67, -3036.99, 13.28, 60.44),
			vector4(-1006.87, -3016.17, 13.27, 57.66),

        }
    },
    ['pdmarinaimpound'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-805.35, -1504.99),
			vector2(-784.44, -1496.77),
			vector2(-790.07, -1481.0),
			vector2(-813.82, -1486.02)
            },
            ['minZ'] = 0.0,  -- min height of the parking zone
            ['maxZ'] = 5.0,  -- max height of the parking zone
            debug = false,
        },
        label = "PD Marina Impound",
        showBlip = false,
        blipcoords = vector3(-803.67, -1491.32, 0.65),
        blipName = "PD Marina Impound",
        blipNumber = 68,
        type = 'impound',                --public, job, gang, depot
        vehicleCategories = {'boat'},
        drawText = 'PD Marina Impound',                 --car, air, sea
        WarpPlayerIntoVehicle = false,
        job = "police",
        debug = false,
        ['ParkingSpots'] = {
			vector4(-803.67, -1491.32, 0.62, 109.79),
			vector4(-801.14, -1499.76, 0.63, 110.88),

        }
    },
    ['policevespuci'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-1127.01, -870.32),
			vector2(-1145.57, -848.31),
			vector2(-1125.84, -832.9),
			vector2(-1108.38, -856.51)
            },
            ['minZ'] = 10.5,  -- min height of the parking zone
            ['maxZ'] = 16.5,  -- max height of the parking zone
        },
        label = "Police",
        showBlip = false,
        blipName = "Police",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        plateprefix = 'LSPD',
        drawText = 'Parking',              --car, air, sea
        job = "police",
        plateprefix = 'LSPD',
        useVehicleSpawner = true,
        jobVehiclesIndex = 'pd1', -- the corresponding index (JobVehicles)
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
			vector4(-1112.21, -855.26, 13.1, 36.89),
			vector4(-1115.85, -857.17, 13.1, 37.88),
			vector4(-1123.29, -862.36, 13.14, 36.06),
			vector4(-1125.98, -865.1, 13.13, 40.76),
			vector4(-1131.76, -838.57, 13.32, 129.68),
        }
    },
    ['policepaleto'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-450.42, 6041.38),
			vector2(-460.89, 6051.86),
			vector2(-488.33, 6024.43),
			vector2(-478.57, 6013.98),
            },
            ['minZ'] = 29.5,  -- min height of the parking zone
            ['maxZ'] = 34.5,  -- max height of the parking zone
        },
        label = "Paleto Police Station",
        showBlip = false,
        blipName = "Police",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        plateprefix = 'LSPD',
        drawText = 'Parking',              --car, air, sea
        job = "police",
        plateprefix = 'LSPD',
        useVehicleSpawner = true,
        jobVehiclesIndex = 'pd1', -- the corresponding index (JobVehicles)
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
			vector4(-483.14, 6025.14, 31.34, 229.94),
			vector4(-479.64, 6028.56, 31.34, 225.86),
			vector4(-476.34, 6031.85, 31.34, 227.84),
			vector4(-472.82, 6035.78, 31.34, 224.71),
			vector4(-469.65, 6039.36, 31.34, 223.6),
        }
    },
    ['pdmarina'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(-809.44, -1508.11),
                vector2(-782.38, -1497.97),
                vector2(-776.72, -1513.67),
                vector2(-796.54, -1521.56)
            },
            ['minZ'] = 0.00,
            ['maxZ'] = 5.00
        },
        label = 'Police Marina',
        type = 'job',
        plateprefix = 'LSPD',
        drawText = 'Police Marina',
        showBlip = true,
        job = "police",
        useVehicleSpawner = true,
        jobVehiclesIndex = 'pdmarina', -- the corresponding index (JobVehicles)
        blipName = 'Boat House',
        blipNumber = 427,
        blipColor = 15,
        blipcoords = vector3(-784.84, -1498.33, 0.2),
        ParkingDistance = 20.0,
        SpawnDistance = 10.0,
        WarpPlayerIntoVehicle = true,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-795.97, -1516.33, 0.64, 110.54),
            vector4(-798.91, -1507.76, 0.67, 111.35),
        },
        ExitWarpLocations = {
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        },
    },
    ['pdmarina2'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(723.29, 4131.9),
                vector2(727.38, 4093.13),
                vector2(710.93, 4083.87),
                vector2(709.55, 4146.09)
            },
            ['minZ'] = 28.00,
            ['maxZ'] = 39.00
        },
        label = 'Police Marina Sandy',
        type = 'job',
        plateprefix = 'LSPD',
        drawText = 'Police Marina',
        showBlip = true,
        job = "police",
        useVehicleSpawner = true,
        jobVehiclesIndex = 'pdmarina', -- the corresponding index (JobVehicles)
        blipName = 'Boat House',
        blipNumber = 427,
        blipColor = 15,
        blipcoords = vector3(713.95, 4121.91, 40.86),
        ParkingDistance = 20.0,
        SpawnDistance = 10.0,
        WarpPlayerIntoVehicle = true,
        debug = false,
        ['ParkingSpots'] = {
            vector4(721.79, 4121.25, 31.32, 182.96),
        },
        ExitWarpLocations = {
            vector3(714.63, 4123.15, 35.78),
        },
    },
    ['pillboxlowergarage'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(340.99, -579.37),
                vector2(346.47, -562.02),
                vector2(318.41, -552.53),
                vector2(313.86, -572.95),
            },
            ['minZ'] = 28.2,  -- min height of the parking zone
            ['maxZ'] = 31.30,  -- max height of the parking zone
        },
        label = 'Pillbox Lower Parking',
        showBlip = false,
        blipName = 'Pillbox Parking',
        blipNumber = 357,
        type = 'job',
        plateprefix = 'PBOX',
        job = "ambulance",
        plateprefix = 'PBOX',
        useVehicleSpawner = true,
        WarpPlayerIntoVehicle = false,
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
			vector4(326.5, -568.08, 28.81, 350.49),
			vector4(336.79, -571.97, 28.8, 337.9),
        }
    },
    ['theshop'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(157.72, -2984.65),
			vector2(182.56, -2986.1),
			vector2(173.85, -3062.56),
			vector2(155.8, -3062.36)
            },
            ['minZ'] = 4.5,  -- min height of the parking zone
            ['maxZ'] = 10.6,  -- max height of the parking zone
            debug = false,
        },
        label = "Shop Parking",
        showBlip = false,
        blipName = "theSHOP",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        drawText = 'Shop Parking',              --car, air, sea
        plateprefix = 'GEAR',
        job = "mechanic",
        jobVehiclesIndex = 'mech1',
        plateprefix = 'GEAR',
        useVehicleSpawner = true,
        WarpPlayerIntoVehicle = false,
        debug = false,
        ['ParkingSpots'] = {
			vector4(165.74, -3042.97, 5.98, 269.32),
			vector4(165.67, -3047.49, 5.98, 269.7),
			vector4(165.73, -3052.05, 5.98, 270.65),
			vector4(165.59, -3009.53, 5.99, 269.41),
			vector4(165.46, -3006.2, 5.98, 270.01),
			vector4(165.99, -3002.98, 5.97, 269.93),
			vector4(165.7, -2996.31, 5.99, 269.52),
			vector4(166.13, -2993.18, 6.0, 270.29),
			vector4(165.61, -2989.92, 5.99, 270.31),
        }
    },
    ['boathouse1'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(-951.53, -1480.32),
                vector2(-880.04, -1454.61),
                vector2(-873.1, -1469.86),
                vector2(-948.82, -1497.75)
            },
            ['minZ'] = 0.00,
            ['maxZ'] = 5.00
        },
        label = 'Boat House LS',
        type = 'public',
        vehicleCategories = {'boat'},
        drawText = 'BOAT HOUSE',
        WarpPlayerIntoVehicle = true,
        showBlip = true,
        blipName = 'Boat House',
        blipNumber = 427,
        blipColor = 15,
        blipcoords = vector3(-948.59, -1487.75, 1.6),
        ParkingDistance = 20.0,
        SpawnDistance = 10.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-883.8, -1461.24, 0.12, 20.18),
            vector4(-892.69, -1462.97, 0.13, 18.57),
            vector4(-901.15, -1465.64, 0.12, 21.87),
            vector4(-911.24, -1468.47, 0.13, 20.58),
            vector4(-919.76, -1472.06, 0.12, 20.81),
            vector4(-927.92, -1474.75, 0.13, 20.48),
            vector4(-936.57, -1478.01, 0.12, 17.9),
            vector4(-945.26, -1480.26, 0.12, 19.6),
        },
        ExitWarpLocations = {
            vector3(-950.06, -1485.17, 1.6),
            vector3(-939.42, -1483.07, 1.6),
            vector3(-931.08, -1480.08, 1.6),
            vector3(-923.09, -1476.24, 1.6),
            vector3(-914.14, -1473.13, 1.6),
            vector3(-905.84, -1468.79, 1.6),
            vector3(-896.14, -1466.68, 1.6),
            vector3(-887.57, -1463.15, 1.6),
            vector3(-877.94, -1461.84, 1.6),

        },
    },
    ['boathouse2'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(1281.95, 4218.05),
                vector2(1297.37, 4292.49),
                vector2(1346.22, 4282.91),
                vector2(1335.25, 4197.99)
            },
            ['minZ'] = 28.00,
            ['maxZ'] = 35.00
        },
        label = 'Boat House Sandy',
        type = 'public',
        vehicleCategories = {'boat'},
        drawText = 'BOAT HOUSE',
        WarpPlayerIntoVehicle = true,
        showBlip = true,
        blipName = 'Boat House',
        blipNumber = 427,
        blipColor = 15,
        blipcoords = vector3(1303.31, 4238.21, 37.35),
        ParkingDistance = 20.0,
        SpawnDistance = 10.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(1319.16, 4220.22, 30.83, 256.03),
            vector4(1327.6, 4234.52, 30.11, 262.64),
            vector4(1293.55, 4233.25, 30.55, 169.15),
        },
        ExitWarpLocations = {
            vector3(1300.8, 4234.33, 33.91),
            vector3(1317.51, 4230.34, 33.92),
            vector3(1328.51, 4226.11, 33.92),
        },
    },
    ['boathouse3'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(-264.78, 6642.43),
                vector2(-290.39, 6615.4),
                vector2(-307.08, 6631.76),
                vector2(-278.11, 6659.39)
            },
            ['minZ'] = -1.00,
            ['maxZ'] = 12.00
        },
        label = 'Boat House Paleto',
        type = 'public',
        vehicleCategories = {'boat'},
        drawText = 'BOAT HOUSE',
        WarpPlayerIntoVehicle = true,
        showBlip = true,
        blipName = 'Boat House',
        blipNumber = 427,
        blipColor = 15,
        blipcoords = vector3(-273.51, 6632.76, 10.57),
        ParkingDistance = 20.0,
        SpawnDistance = 10.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-289.74, 6638.1, 0.96, 129.95),
        },
        ExitWarpLocations = {
            vector3(-281.72, 6632.62, 7.43),
        },
    },
    ['helipad'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-757.8896484375, -1469.876953125),
                vector2(-744.54223632812, -1480.4110107422),
                vector2(-733.07989501954, -1467.4460449218),
                vector2(-746.4605102539, -1456.0607910156)
            },
            ['minZ'] = 4.0,  -- min height of the parking zone
            ['maxZ'] = 8.0,  -- max height of the parking zone
        },
        label = 'Helipad',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Helipad',
        WarpPlayerIntoVehicle = false,
        showBlip = true,
        blipName = "Helipad",
        blipNumber = 64,
        blipColor = 50,
        blipcoords = vector3(-745.61, -1468.57, 4.37),
        ["ParkingSpots"] = {
            vector4(-745.53, -1468.68, 5.0, 321.19)
        },
        ParkingDistance = 10.0,
        debug = false
    },
    ['shoreheli'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1774.4047851562, 3246.9484863281),
                vector2(1762.30859375, 3244.3928222656),
                vector2(1765.3605957031, 3231.908203125),
                vector2(1777.5689697266, 3235.4580078125)
            },
            ['minZ'] = 40.0,  -- min height of the parking zone
            ['maxZ'] = 46.0,  -- max height of the parking zone
        },
        label = 'Sandy Shores Helipad',
        type = 'public',
        vehicleCategories = {'helicopter', 'plane'},
        pilotcheck = false,
        drawText = 'Sandy Shores Helipad',
        WarpPlayerIntoVehicle = false,
        showBlip = true,
        blipName = 'Helipad',
        blipNumber = 64,
        blipColor = 50,
        blipcoords = vector3(1769.62, 3240.14, 42.01),
        ['ParkingSpots'] = {
            vector4(1769.62, 3240.14, 42.01, 60.44),
        },
        ParkingDistance = 100.0,
        debug = false
    },
    ['intairport'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1014.89, -2988.87),
                vector2(-1003.75, -2971.24),
                vector2(-946.45, -3003.95),
                vector2(-959.29, -3017.91)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Airport Hangar',
        type = 'public',
        vehicleCategories = {'helicopter', 'plane'},
        pilotcheck = true,
        drawText = 'Airport Hangar',
        WarpPlayerIntoVehicle = false,
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 359,
        blipColor = 50,
        blipcoords = vector3(-930.23, -2995.38, 19.85),
        ParkingDistance = 100.0,
        SpawnDistance = 100.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-985.04, -2965.05, 14.55, 128.92),
            vector4(-979.16, -2996.55, 13.27, 60.28),
        },

    },
}


HouseGarages = {} -- DO NOT TOUCH!


--Items are available in the trunk of the vehicle for industries in the vehicle system for work:
VehJobItems = {
    ['police'] = {
		[1] = {
			name = 'heavyarmor',
			amount = 2,
			info = {},
			type = 'item',
			slot = 1,
		},
		[2] = {
			name = 'empty_evidence_bag',
			amount = 10,
			info = {},
			type = 'item',
			slot = 2,
		},
		[3] = {
			name = 'police_stormram',
			amount = 1,
			info = {},
			type = 'item',
			slot = 3,
		},
	},
	['mechanic'] = {
		[1] = {
			name = 'repairkit',
			amount = 10,
			info = {},
			type = 'item',
			slot = 1,
		},
		[2] = {
			name = 'advancedrepairkit',
			amount = 2,
			info = {},
			type = 'item',
			slot = 2,
		},
		[3] = {
			name = 'cleaningkit',
			amount = 10,
			info = {},
			type = 'item',
			slot = 3,
		},
	},
	['ambulance'] = {
		[1] = {
			name = 'bandage',
			amount = 10,
			info = {},
			type = 'item',
			slot = 1,
		},
		[2] = {
			name = 'firstaid',
			amount = 2,
			info = {},
			type = 'item',
			slot = 2,
		},
		[3] = {
			name = 'painkillers',
			amount = 10,
			info = {},
			type = 'item',
			slot = 3,
		},
	}
}
