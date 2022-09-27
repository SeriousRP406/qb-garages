# qb-garages 
This version of qb-garages is modified.  This repo was source from JDEV (see credits below).  You will need to make adjustments to your core, qb-policejob, and to your phone to accomodate added functionality and general changes.  See installation section.  READ THIS READ ME!  Feel free to reach out to me in my discord to ask questions.

http://discord.daddydubz.com

**ATENTION: THIS SCRIPT USES THE LATEST VERSION OF THE [RADIALMENU](https://github.com/qbcore-framework/qb-radialmenu) AND [QB-CORE](https://github.com/qbcore-framework/qb-core)**

This is a qb-garages script that uses the radialmenu to retrieve and park vehicles.
Almost everything is fully customizable to the last bit!

**For screenshots scroll down**

## Dependencies
 - [qb-radialmenu](https://github.com/qbcore-framework/qb-radialmenu)
 - [qb-core](https://github.com/qbcore-framework/qb-core)

## Installation
- You must add the release time column to your DB. If you have already deployed qb-garages you can use the snippet in the database.sql to add only this column.
- Delete qb-garages.
- Drag the downloaded qb-garages folder into the [qb] folder.
- If you want to use the latest features, apply patch1.sql to your DB

- Remove the impound and depot commands from qb-policejob.  Search for the commands below in qb-policejob/serer.lua.  This garage uses its own impound functions
    Comment out or delete both commands.

    QBCore.Commands.Add("impound",
    QBCore.Commands.Add("depot",

- If the options below are enabled you must run the included patch1.sql

    StoreDamageAccuratly = false -- Do not use, if on latest qb-core, if set to true, make sure to apply / run patch1.sql
    StoreParkinglotAccuratly = false  -- store the last parking lot in the DB, if set to true, make sure to apply / run patch1.sql, I recommend applying the tracking snippet for qb-phone from the ReadMe to the phone so you can track the vehicle to the exact parking lot
    SpawnAtLastParkinglot = false

- If you use qb-phone or gksphone you will need to modify the garage/vale functions to accomodate the added vehicle state.
        vehicleStates:
        - 0 - on the street
        - 1 - in garage
        - 2 - impound
        - 3 - depot

        gksphone example
        `````````````````````````````````````````````````````````````````````
                if Config.qbGarages then
                    if Garages[result[i].garage] ~= nil then
                        VehicleGarage = Garages[result[i].garage]["label"]
                    else
                        VehicleGarage = result[i].garage
                    end
                    if result[i].state == 0 then
                        VehicleState = "On The Street"
                    elseif result[i].state == 2 then
                        VehicleState = "Impounded"
                    elseif result[i].state == 3 then
                        VehicleState = "Depot"
                    end
        ``````````````````````````````````````````````````````````````````````
## Features

* Public Garages
* House Garages
* Gang Garages
* Job Garages
    Job vehicles are selected from garage by defining jobVehiclesIndex
    see examples in config.

    jobVehiclesIndex = 'pd1',

    You must use the vehicle spawner for job garages.

    useVehicleSpawner = true,
    
* Job Trunks
* Depot Garages
* Impound garages
    - PD can define impound times.  Vehicles are accessible in depot immediately following release time.  Every hour the server will move released vehicles to depot in depot making them visible in garage app in phone.
* Blips and names
* Custom DrawText
* Water Garages
* Aircraft Garages

## Screenshots

![image](https://user-images.githubusercontent.com/25738474/161191185-5bfa6805-1e89-44ef-902a-11f60ed68ea8.png)

![image](https://user-images.githubusercontent.com/25738474/161191275-2ca930fe-5583-4caa-a159-0c239b404abe.png)

![image](https://user-images.githubusercontent.com/25738474/161191330-9270f95d-182f-4709-988a-ef13f0723ba5.png)

![image](https://user-images.githubusercontent.com/25738474/161191354-057ca8d9-ee6d-4f92-8dd7-657d3bf26274.png)

## Config Example

```
Everything that says Optional can be omitted.
 -- GARAGE CONFIGURATION EXAMPLE :
--[[

    TRANSLATION:
        To create a new translation file, copy an existing one and rename it to e.g. es (spanish), then translate it and change the imported file in the fxmanifest under shared_scripts.
    GARAGE CONFIGURATION EXAMPLE:
    ['somegarage'] = {
        ['Zone'] = {
            ['Shape'] = { -- Create a polyzone by using '/pzcreate poly', '/pzadd' and '/pzfinish' or '/pzcancel' to cancel it. the newly created polyzone will be in txData/QBCoreFramework_******.base/polyzone_created_zones.txt
            vector2(-1030.4713134766, -3016.3388671875),
            vector2(-970.09686279296, -2914.7397460938),
            vector2(-948.322265625, -2927.9030761718),
            vector2(-950.47174072266, -2941.6584472656),
            vector2(-949.04180908204, -2953.9467773438),
            vector2(-940.78369140625, -2957.2941894532),
            vector2(-943.88732910156, -2964.5512695312),
            vector2(-897.61529541016, -2990.0505371094),
            vector2(-930.01025390625, -3046.0695800782),
            vector2(-942.36407470704, -3044.7858886718),
            vector2(-952.97467041016, -3056.5122070312),
            vector2(-957.11712646484, -3057.0900878906)
            },
            ['minZ'] = 12.5,  -- min height of the parking zone, cannot be the same as maxZ, and must be smaller than maxZ
            ['maxZ'] = 20.0,  -- max height of the parking zone
            -- Important: Make sure the parking zone is high enough - higher than the tallest vehicle and touches the ground (turn on debug to see)
        },
        label = 'Hangar', -- label displayed on phone
        type = 'public', -- 'public', 'job', 'depot' or 'gang'
        showBlip = true, -- Optional, when not defined, defaults to false
        blipName = 'Police', -- Optional
        blipNumber = 90, -- Optional, numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipColor = 69, -- Optional, defaults to 3 (Blue), numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipcoords = vector3(-972.66, -3005.4, 13.32), -- blip coordinates
        job = 'police', -- Optional, everyone can use it when not defined
        -- job = {'police', 'ambulance'), -- Optional, multi job support
        gang = 'vagos', -- Optional, same as job but for gangs, do not use both
        -- gang = {'vagos', 'gsf'}, -- Optional, multi gang support
        useVehicleSpawner = true, --uses the configured job vehicles, make sure to have the job attribute set! (job = 'police')
        jobVehiclesIndex = 'pd1', -- the corresponding index (JobVehicles)
        vehicleCategories = {'helicopter', 'plane'}, -- categories defined in VehicleCategories
        plateprefix = 'LSPD', -- Optional, Prefix applied to job spawner vehicles if left nil random plate will remain
        drawText = 'Hangar', -- the drawtext text, shown when entering the polyzone of that garage
        ParkingDistance = 10.0 -- Optional ParkingDistance, to override the global ParkingDistance
        SpawnDistance = 5.0 -- Optional SpawnDistance, to override the global SpawnDistance
        debug = false -- will show the polyzone and the parking spots, helpful when creating new garages. If too many garages are set to debug, it will not show all parking lots
        ExitWarpLocations: { -- Optional, Used for e.g. Boat parking, to teleport the player out of the boat to the closest location defined in the list.
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        }
    },
]]
```

### Garage/Vehicle Class/Vehicle States
    --[[
        types:
        - public 
        - job
        - depot
        - impound
        vehicleCategories:
        - car
        - motorcycle
        - boat
        - helicopter
        - plane
        - other
        vehicleStates:
        - 0 - on the street
        - 1 - in garage
        - 2 - impound
        - 3 - depot
    ]]

### parking vehicle using target
```
local garageName = 'pdgarage'
    exports['qb-target']:AddBoxZone(garageName, vector3(469.51, -992.35, 26.27), 0.2, 0.2, {
        name = garageName,
        debugPoly = true,
        minZ = 26.80,
        maxZ = 27.10,
    }, {
        options = {
            {
                type = "client",
                action = function ()
                    TriggerEvent('qb-garages:client:ParkLastVehicle', garageName)
                end,
                icon = 'parking',
                label = 'Park Vehicle',
            },
        },
        distance = 3
    })
```
### improved phone tracking
Replace:

```
RegisterNUICallback('track-vehicle', function(data, cb)
    local veh = data.veh
    if findVehFromPlateAndLocate(veh.plate) then
        QBCore.Functions.Notify("Your vehicle has been marked", "success")
    else
        QBCore.Functions.Notify("This vehicle cannot be located", "error")
    end
    cb("ok")
end)
```

With:

```
RegisterNUICallback('track-vehicle', function(data, cb)
    local veh = data.veh
    if veh.state == 'In' then
        if veh.parkingspot then
            SetNewWaypoint(veh.parkingspot.x, veh.parkingspot.y)
            QBCore.Functions.Notify("Your vehicle has been marked", "success")
        end
    elseif veh.state == 'Out' and findVehFromPlateAndLocate(veh.plate) then
        QBCore.Functions.Notify("Your vehicle has been marked", "success")
    else
        QBCore.Functions.Notify("This vehicle cannot be located", "error")
    end
    cb("ok")
end)
```

## loaf_housing

Add this to your loaf_housing/client/functions.lua all the way at the bottom:
```
exports('HasHouseKey', function(propertyId)
    local stringId = tostring(propertyId)
    local data = cache.ownedHouses[stringId] or cache.houses[stringId]
    return exports['loaf_keysystem']:HasKey(GetKeyName(propertyId, data.id))
end)
```

## Popular PD/Pillbox Garage Templates

```    ['pillboxgarage'] = {
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
    ['pillboxlowergarage'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(352.34439086914, -620.59851074219),
                vector2(344.32354736328, -636.03747558594),
                vector2(325.94189453125, -628.93359375),
                vector2(331.88412475586, -613.10968017578)
            },
            ['minZ'] = 28.2,  -- min height of the parking zone
            ['maxZ'] = 31.30,  -- max height of the parking zone
        },
        label = 'Pillbox Lower Parking',
        showBlip = true,
        blipcoords = vector3(341.7, -623.33, 29.29),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(342.07, -632.51, 28.87, 340.17),
            vector4(338.89, -631.43, 28.87, 341.89),
            vector4(335.77, -630.04, 28.87, 340.85),
            vector4(332.61, -628.68, 28.87, 342.74),
            vector4(329.16, -627.36, 28.87, 341.84),
            vector4(346.44, -620.82, 28.87, 157.15),
            vector4(343.13, -619.38, 28.87, 157.56),
            vector4(339.76, -619.01, 28.87, 157.43),
            vector4(336.5, -617.88, 28.87, 162.09),
            vector4(333.34, -616.15, 28.87, 160.22),
            vector4(269.97, -322.62, 44.5, 248.07),
        }
    },


        ['pdfront'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(405.13595581054, -998.57788085938),
            vector2(410.59521484375, -1002.8664550782),
            vector2(410.91711425782, -979.44134521484),
            vector2(405.4065246582, -974.57928466796),
            },
            ['minZ'] = 28.0,  -- min height of the parking zone
            ['maxZ'] = 31.0,  -- max height of the parking zone

        },
        label = 'Front of MRPD',
        type = 'job',
        job = "police",
        vehicleCategories = {'emergency'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(407.44, -997.7, 28.94, 52.87),
            vector4(407.55, -992.85, 28.94, 51.63),
            vector4(407.7, -988.49, 28.94, 52.48),
            vector4(407.42, -983.95, 28.94, 51.54),
            vector4(407.68, -979.62, 28.94, 51.69),
        },
        debug = false
    },
    ['pdgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
               	vector2(448.33670043945, -998.80895996094),
                vector2(423.15826416016, -998.98077392578),
                vector2(423.48205566406, -973.94946289063),
                vector2(428.74041748047, -974.35272216797),
                vector2(428.564453125, -984.02642822266),
                vector2(448.21347045898, -983.94213867188),
            },
            ['minZ'] = 24.0,  -- min height of the parking zone
            ['maxZ'] = 27.0,  -- max height of the parking zone
        },
        label = 'MRPD Garage',
        type = 'job',
        job = "police",
        useVehicleSpawner = true,
        vehicleCategories = {'emergency'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(445.67, -997.0, 24.81, 269.98),
            vector4(445.83, -994.31, 25.21, 267.42),
            vector4(445.53, -991.53, 25.21, 269.55),
            vector4(445.51, -988.84, 25.21, 269.43),
            vector4(445.55, -986.12, 25.21, 270.71),
            vector4(437.35, -986.1, 25.21, 89.31),
            vector4(437.27, -988.86, 25.21, 90.05),
            vector4(437.32, -991.57, 25.21, 90.47),
            vector4(437.3, -994.26, 25.21, 90.38),
            vector4(437.31, -996.97, 25.21, 90.1),
            vector4(425.76, -997.07, 25.21, 270.57),
            vector4(425.72, -994.41, 25.21, 269.31),
            vector4(425.72, -991.68, 25.21, 269.53),
            vector4(425.69, -989.03, 25.21, 270.22),
            vector4(425.69, -984.26, 25.21, 269.65),
            vector4(425.67, -981.55, 25.21, 269.33),
            vector4(425.68, -978.88, 25.21, 269.76),
            vector4(425.68, -976.24, 25.21, 270.49),
        },
        debug = false
    },


    ['cityhall'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-475.55926513672, -222.67430114746),
            vector2(-472.03475952148, -220.5464630127),
            vector2(-498.85870361328, -173.8444366455),
            vector2(-502.67169189454, -175.96449279786),
            },
            ['minZ'] = 35.0,  -- min height of the parking zone
            ['maxZ'] = 39.0,  -- max height of the parking zone
        },
        label = 'City Hall Parking',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(-475.26, -219.26, 36.05, 30.12),
            vector4(-478.26, -214.06, 36.21, 30.11),
            vector4(-481.41, -208.59, 36.37, 30.32),
            vector4(-484.34, -203.49, 36.52, 30.67),
            vector4(-487.17, -198.51, 36.67, 30.37),
            vector4(-490.26, -193.18, 36.83, 29.72),
            vector4(-493.21, -187.98, 36.99, 29.64),
            vector4(-496.19, -182.75, 37.14, 29.96),
            vector4(-499.21, -177.5, 37.3, 30.1),
        },
        debug = false
    },
```

## Credits

* [ARSSANTO](https://github.com/ARSSANTO) - For making code style suggestions and helping JDEV improve the performance.
* [JustLazzy](https://github.com/JustLazzy) - JDEV used part of his qb-garages script.
* [bamablood94](https://github.com/bamablood94) - JDEV used part of his qb-garages script.
* [JDEV](https://github.com/JonasDev99) - I used his qb-garages script.


# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>