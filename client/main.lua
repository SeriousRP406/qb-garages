local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local PlayerGang = {}
local PlayerJob = {}
local CurrentHouseGarage = nil
local OutsideVehicles = {}
local CurrentGarage = nil
local GaragePoly = {}
local MenuItemId = nil
local VehicleClassMap = {}
local GarageZones = {}
local impoundtime = nil
-- helper functions

local function TableContains (tab, val)
    if type(val) == "table" then -- checks if atleast one the values in val is contained in tab
        for _, value in ipairs(tab) do
            if TableContains(val, value) then
                return true
            end
        end
        return false
    else
        for _, value in ipairs(tab) do
            if value == val then
                return true
            end
        end
    end
    return false
end

local function IsStringNilOrEmpty(s)
    return s == nil or s == ''
end

local function GetSuperCategoryFromCategories(categories)
    local superCategory = 'car'
    if TableContains(categories, {'car'}) then
        superCategory = 'car'
    elseif TableContains(categories, {'plane', 'helicopter'}) then
        superCategory = 'air'
    elseif TableContains(categories, 'boat') then
        superCategory = 'sea'
    end
    return superCategory
end

local function GetClosestLocation(locations, loc)
    local closestDistance = -1
    local closestIndex = -1
    local closestLocation = nil
    local plyCoords = loc or GetEntityCoords(PlayerPedId(), 0)
    for i,v in ipairs(locations) do
        local location = vector3(v.x, v.y, v.z)
        local distance = #(plyCoords - location)
        if(closestDistance == -1 or closestDistance > distance) then
            closestDistance = distance
            closestIndex = i
            closestLocation = v
        end
    end
    return closestIndex, closestDistance, closestLocation
end

function SetAsMissionEntity(vehicle)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleIsStolen(vehicle, false)
    SetVehicleIsWanted(vehicle, false)
    SetVehRadioStation(vehicle, 'OFF')
    local id = NetworkGetNetworkIdFromEntity(vehicle)
    SetNetworkIdCanMigrate(id, true)
end

--Menus
local function PublicGarage(garageName, type)
    local garage = Garages[garageName]
    local categories = garage.vehicleCategories
    local superCategory = GetSuperCategoryFromCategories(categories)

    if garage.pilotcheck == true then
        QBCore.Functions.TriggerCallback('qb-garages:getLicenseStatus', function(result)
            if result then
                exports['qb-menu']:openMenu({
                    {
                        header = garage.label,
                        isMenuHeader = true,
                    },
                    {
                        header = Lang:t("menu.text.vehicles"),
                        txt = Lang:t("menu.text.vehicles"),
                        params = {
                            event = "qb-garages:client:GarageMenu",
                            args = {
                                garageId = garageName,
                                garage = garage,
                                categories = categories,
                                header =  Lang:t("menu.header."..garage.type.."_"..superCategory, {value = garage.label}),
                                superCategory = superCategory,
                                type = type
                            }
                        }
                    },
                    {
                        header = Lang:t("menu.leave.car"),
                        txt = "",
                        params = {
                            event = 'qb-menu:closeMenu'
                        }
                    },
                })
            else
                exports['okokNotify']:Alert("FAA", "You do not have a pilots license", 5000, 'error')
            end
        end)
    elseif garage.pilotcheck == false or garage.pilotcheck == nil then
        exports['qb-menu']:openMenu({
            {
                header = garage.label,
                isMenuHeader = true,
            },
            {
                header = Lang:t("menu.text.vehicles"),
                txt = Lang:t("menu.text.vehicles"),
                params = {
                    event = "qb-garages:client:GarageMenu",
                    args = {
                        garageId = garageName,
                        garage = garage,
                        categories = categories,
                        header =  Lang:t("menu.header."..garage.type.."_"..superCategory, {value = garage.label}),
                        superCategory = superCategory,
                        type = type
                    }
                }
            },
            {
                header = Lang:t("menu.leave.car"),
                txt = "",
                params = {
                    event = 'qb-menu:closeMenu'
                }
            },
        })
    end
end

local function MenuHouseGarage()
    local superCategory = GetSuperCategoryFromCategories(HouseGarageCategories)
    exports['qb-menu']:openMenu({
        {
            header = Lang:t("menu.header.house_garage"),
            isMenuHeader = true
        },
        {
            header = Lang:t("menu.text.vehicles"),
            txt = Lang:t("menu.text.vehicles"),
            params = {
                event = "qb-garages:client:GarageMenu",
                args = {
                    garageId = CurrentHouseGarage,
                    categories = HouseGarageCategories,
                    header =  HouseGarages[CurrentHouseGarage].label,
                    garage = HouseGarages[CurrentHouseGarage],
                    superCategory = superCategory,
                    type = 'house'
                }
            }
        },
        {
            header = Lang:t("menu.leave.car"),
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end

local function ClearMenu()
	TriggerEvent("qb-menu:closeMenu")
end

-- Functions

local function ApplyVehicleDamage(currentVehicle, veh)
	local engine = veh.engine + 0.0
	local body = veh.body + 0.0
    local damage = veh.damage
    if damage then
        if damage.tyres then
            for k, tyre in pairs(damage.tyres) do
                if tyre.onRim then
                    SetVehicleTyreBurst(currentVehicle, tonumber(k), tyre.onRim, 1000.0)
                elseif tyre.burst then
                    SetVehicleTyreBurst(currentVehicle, tonumber(k), tyre.onRim, 990.0)
                end
            end
        end
        if damage.windows then
            for k, window in pairs(damage.windows) do
                if window.smashed then
                    SmashVehicleWindow(currentVehicle, tonumber(k))
                end
            end
        end

        if damage.doors then
            for k, door in pairs(damage.doors) do
                if door.damaged then
                    SetVehicleDoorBroken(currentVehicle, tonumber(k), true)
                end
            end
        end
    end

    SetVehicleEngineHealth(currentVehicle, engine)
    SetVehicleBodyHealth(currentVehicle, body)
end

local function GetCarDamage(vehicle)
    local damage = {windows = {}, tyres = {}, doors = {}}
    local tyreIndexes = {0,1,2,3,4,5,45,47}

    for _,i in pairs(tyreIndexes) do
        damage.tyres[i] = {burst = IsVehicleTyreBurst(vehicle, i, false) == 1, onRim = IsVehicleTyreBurst(vehicle, i, true) == 1, health = GetTyreHealth(vehicle, i)}
    end
    for i=0,7 do
        damage.windows[i] = {smashed = not IsVehicleWindowIntact(vehicle, i)}
    end
    for i=0,5 do
        damage.doors[i] = {damaged = IsVehicleDoorDamaged(vehicle, i)}
    end
    return damage
end

local function Round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function ExitAndDeleteVehicle(vehicle)
    local garage = Garages[CurrentGarage]
    local exitLocation = nil
    if garage and garage.ExitWarpLocations and next(garage.ExitWarpLocations) then
        _, _, exitLocation = GetClosestLocation(garage.ExitWarpLocations)
    end
    for i = -1, 5, 1 do
        local ped = GetPedInVehicleSeat(vehicle, i)
        if ped then
            TaskLeaveVehicle(ped, vehicle, 0)
            if exitLocation then
                SetEntityCoords(ped, exitLocation.x, exitLocation.y, exitLocation.z)
            end
        end
    end
    SetVehicleDoorsLocked(vehicle)
    Wait(1500)
    if UseEnc0dedPersistenVehicles then
        TriggerEvent('persistent-vehicles/delete-vehicle', vehicle)
    else
        QBCore.Functions.DeleteVehicle(vehicle)
    end
end

local function GetVehicleCategoryFromClass(class)
    return VehicleClassMap[class]
end

local function IsAuthorizedToAccessGarage(garageName)
    local garage = Garages[garageName]
    if not garage then return false end
    if garage.type == 'job' then
        if type(garage.job) == "string" and not IsStringNilOrEmpty(garage.job) then
            return PlayerJob.name == garage.job 
        elseif type(garage.job) =="table" then
            return TableContains(garage.job, PlayerJob.name)
        end
    elseif garage.type == 'gang' then 
        if type(garage.gang) == "string" and  not IsStringNilOrEmpty(garage.gang) then
            return garage.gang == PlayerGang.name
        elseif type(garage.gang) =="table" then
            return TableContains(garage.gang, PlayerGang.name)
        end
    end
    return true
end

local function CanParkVehicle(veh, garageName, vehLocation)
    local garage = garageName and Garages[garageName] or (CurrentGarage and Garages[CurrentGarage]  or HouseGarages[CurrentHouseGarage])
    if not garage then return false end
    local parkingDistance =  garage.ParkingDistance and  garage.ParkingDistance or ParkingDistance
    local vehClass = GetVehicleClass(veh)
    local vehCategory = GetVehicleCategoryFromClass(vehClass)

    if GetPedInVehicleSeat(veh, -1) ~= PlayerPedId() then
        return false
    end

    if garage.vehicleCategories and not TableContains(garage.vehicleCategories, vehCategory) then
        QBCore.Functions.Notify(Lang:t("error.not_correct_type"), "error", 4500)
        return false
    end

    local parkingSpots = garage.ParkingSpots and garage.ParkingSpots or {}
    if next(parkingSpots) ~= nil then
        local _, closestDistance, closestLocation = GetClosestLocation(parkingSpots, vehLocation)
        if closestDistance >= parkingDistance then
            QBCore.Functions.Notify(Lang:t("error.too_far_away"), "error", 4500)
            return false
        else
            return true, closestLocation
        end
    else
        return true
    end
end

local function ParkOwnedVehicle(veh, garageName, vehLocation, plate, type)
    local bodyDamage = math.ceil(GetVehicleBodyHealth(veh))
    local engineDamage = math.ceil(GetVehicleEngineHealth(veh))

    local totalFuel = 0

    if type == 'impound' then
        vehstate = 2
    elseif type == 'depot' then
        vehstate = 3
    else
        vehstate = 1
    end

    if FuelScript then
        totalFuel = exports[FuelScript]:GetFuel(veh)
    else
        totalFuel = exports['ps-fuel']:GetFuel(veh) -- Don't change this. Change it in the  Defaults to legacy fuel if not set in the config
    end

    local canPark, closestLocation = CanParkVehicle(veh, garageName, vehLocation)
    local closestVec3 = closestLocation and vector3(closestLocation.x,closestLocation.y, closestLocation.z) or nil
    if not canPark and not garageName.useVehicleSpawner then return end
    local properties = QBCore.Functions.GetVehicleProperties(veh)
    TriggerServerEvent('qb-garages:server:updateVehicle', vehstate, totalFuel, engineDamage, bodyDamage, properties, plate, garageName, StoreParkinglotAccuratly and closestVec3 or nil, StoreDamageAccuratly and GetCarDamage(veh) or nil)
    ExitAndDeleteVehicle(veh)
    if plate then
        OutsideVehicles[plate] = nil
        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
    end
    QBCore.Functions.Notify(Lang:t("success.vehicle_parked"), "success", 4500)
end

function ParkVehicleSpawnerVehicle(veh, garageName, vehLocation, plate)
    QBCore.Functions.TriggerCallback("qb-garages:server:CheckSpawnedVehicle", function (result)
        local canPark, _ = CanParkVehicle(veh, garageName, vehLocation)
        if result and canPark then
            TriggerServerEvent("qb-garages:server:UpdateSpawnedVehicle", plate, nil)
            ExitAndDeleteVehicle(veh)
        elseif not result then
            QBCore.Functions.Notify(Lang:t("error.not_owned"), "error", 3500)
        end
    end, plate)
end

local function ParkVehicle(veh, garageName, vehLocation)
    local plate = QBCore.Functions.GetPlate(veh)
    local garageName = garageName or (CurrentGarage or CurrentHouseGarage)
    local garage = Garages[garageName]
    local type = garage and garage.type or 'house'
    local gang = PlayerGang.name;
    local job = PlayerJob.name;
    local hasHouseKey = false;
    if type == 'house' and UseLoafHousing then
        hasHouseKey = exports['loaf_housing']:HasHouseKey(garageName)
    end

    QBCore.Functions.TriggerCallback('qb-garages:server:checkOwnership', function(owned)
        if owned then
            if garage.useVehicleSpawner == false or garage.useVehicleSpawner == nil then
                ParkOwnedVehicle(veh, garageName, vehLocation, plate, type)
            else
                QBCore.Functions.Notify("Cannot park in job garage.", "error", 3500)
            end
        elseif garage and garage.useVehicleSpawner and IsAuthorizedToAccessGarage(garageName) then
           ParkVehicleSpawnerVehicle(veh, vehLocation, vehLocation, plate)
        else
            QBCore.Functions.Notify(Lang:t("error.not_owned"), "error", 3500)
        end
    end, plate, type, garageName, gang, hasHouseKey)
end

local function AddRadialParkingOption()
    local Player = PlayerPedId()
    if IsPedInAnyVehicle(Player) then
        MenuItemId = exports['qb-radialmenu']:AddOption({
            id = 'put_up_vehicle',
            title = 'Park Vehicle',
            icon = 'parking',
            type = 'client',
            event = 'qb-garages:client:ParkVehicle',
            shouldClose = true
        }, MenuItemId)
    else
        MenuItemId = exports['qb-radialmenu']:AddOption({
            id = 'open_garage_menu',
            title = 'Open Garage',
            icon = 'warehouse',
            type = 'client',
            event = 'qb-garages:client:OpenMenu',
            shouldClose = true
        }, MenuItemId)
    end
end

local function AddRadialDepotOption()
    MenuItemId = exports['qb-radialmenu']:AddOption({
        id = 'open_garage_menu',
        title = 'Open Depot Lot',
        icon = 'warehouse',
        type = 'client',
        event = 'qb-garages:client:OpenMenu',
        shouldClose = true
    }, MenuItemId)
end

local function AddRadialImpoundOption()
    MenuItemId = exports['qb-radialmenu']:AddOption({
        id = 'open_garage_menu',
        title = 'Open Impound Lot',
        icon = 'warehouse',
        type = 'client',
        event = 'qb-garages:client:OpenMenu',
        shouldClose = true
    }, MenuItemId)
end

local function UpdateRadialMenu()
    local garage = Garages[CurrentGarage]
    if CurrentGarage ~= nil and garage ~= nil then
        if garage.type == 'job' and not IsStringNilOrEmpty(garage.job) then
            if PlayerJob.name == garage.job then
                AddRadialParkingOption()
            end
        elseif garage.type == 'impound' and not IsStringNilOrEmpty(garage.job) then
            if PlayerJob.name == garage.job then
                -- AddRadialImpoundOption()
                AddRadialParkingOption()
            end
        elseif garage.type == 'gang' and not IsStringNilOrEmpty(garage.gang) then
            if PlayerGang.name == garage.gang then
                AddRadialParkingOption()
            end
        elseif garage.type == 'depot' then
            AddRadialDepotOption()
        else
            AddRadialParkingOption()
        end
    elseif CurrentHouseGarage ~= nil then
       AddRadialParkingOption()
    else
        if MenuItemId ~= nil then
            exports['qb-radialmenu']:RemoveOption(MenuItemId)
            MenuItemId = nil
        end
    end
end

local function CreateGarageZone()
    print("CreateGarageZone")
    local combo = ComboZone:Create(GarageZones, {name = 'garages', debugPoly=false})
    combo:onPlayerInOut(function(isPointInside, l, zone)
        if isPointInside and IsAuthorizedToAccessGarage(zone.name) then
            CurrentGarage = zone.name
            exports['qb-core']:DrawText(Garages[CurrentGarage]['drawText'], DrawTextPosition)
        else
            CurrentGarage = nil
            if MenuItemId ~= nil then
                exports['qb-radialmenu']:RemoveOption(MenuItemId)
                MenuItemId = nil
            end
            exports['qb-core']:HideText()
        end
    end)
end

local function CreateGaragePolyZone(garage)
    local zone = PolyZone:Create(Garages[garage].Zone.Shape, {
        name = garage,
        minZ = Garages[garage].Zone.minZ,
        maxZ = Garages[garage].Zone.maxZ,
        debugPoly = Garages[garage].debug
    })
    GarageZones[#GarageZones+1] = zone
    --CreateGarageZone(zone, garage)
end

local function CreateGarageBoxZone(house, coords, debugPoly)
    local pos = vector3(coords.x, coords.y, coords.z)
    return BoxZone:Create(pos,5,3.5, {
        name = house,
        offset = {0.0, 0.0, 0.0},
        debugPoly = debugPoly,
        heading = coords.h,
        minZ = pos.z - 1.0,
        maxZ = pos.z + 1.0,
    })
end

local function RegisterHousePoly(house)
    if GaragePoly[house] then return end
    local coords = HouseGarages[house].takeVehicle
    if not coords or not coords.x then return end
    local zone = CreateGarageBoxZone(house, coords, false)
    GaragePoly[house] = {
        Polyzone = zone,
        coords = coords,
    }
    zone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            CurrentHouseGarage = house
            exports['qb-core']:DrawText(HouseParkingDrawText, DrawTextPosition)
        else
            exports['qb-core']:HideText()
            if MenuItemId ~= nil then
                exports['qb-radialmenu']:RemoveOption(MenuItemId)
                MenuItemId = nil
            end
            CurrentHouseGarage = nil
        end
    end)
end

function JobMenuGarage(garageName, vehicleindex)
    local job = QBCore.Functions.GetPlayerData().job.name
    local garage = Garages[garageName]

    if garage.pilotcheck == true then
        QBCore.Functions.TriggerCallback('qb-garages:getLicenseStatus', function(result)
            if result then
                if not JobVehicles[vehicleindex].job then
                    return
                end
                local vehicleMenu = {
                    {
                        header = JobVehicles[vehicleindex].label,
                        isMenuHeader = true
                    }
                }

                local vehicles = JobVehicles[vehicleindex].vehicles[QBCore.Functions.GetPlayerData().job.grade.level]
                for veh, label in pairs(vehicles) do
                    vehicleMenu[#vehicleMenu+1] = {
                        header = label,
                        txt = "",
                        params = {
                            event = "qb-garages:client:TakeOutGarage",
                            args = {
                                vehicleModel = veh,
                                garage = garage
                            }
                        }
                    }
                end

                vehicleMenu[#vehicleMenu+1] = {
                    header = Lang:t('menu.leave.job'),
                    txt = "",
                    params = {
                        event = "qb-menu:client:closeMenu"
                    }

                }
                exports['qb-menu']:openMenu(vehicleMenu)
            else
                exports['okokNotify']:Alert("FAA", "You do not have a pilots license", 5000, 'error')
            end
        end)
    elseif garage.pilotcheck == false or garage.pilotcheck == nil then
        if not JobVehicles[vehicleindex].job then
            return
        end
        local vehicleMenu = {
            {
                header = JobVehicles[vehicleindex].label,
                isMenuHeader = true
            }
        }

        local vehicles = JobVehicles[vehicleindex].vehicles[QBCore.Functions.GetPlayerData().job.grade.level]
        for veh, label in pairs(vehicles) do
            vehicleMenu[#vehicleMenu+1] = {
                header = label,
                txt = "",
                params = {
                    event = "qb-garages:client:TakeOutGarage",
                    args = {
                        vehicleModel = veh,
                        garage = garage
                    }
                }
            }
        end

        vehicleMenu[#vehicleMenu+1] = {
            header = Lang:t('menu.leave.job'),
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu"
            }

        }
        exports['qb-menu']:openMenu(vehicleMenu)
    end
end

function GetFreeParkingSpots(parkingSpots)
    local freeParkingSpots = {}
    for _, parkingSpot in ipairs(parkingSpots) do
        local veh, distance = QBCore.Functions.GetClosestVehicle(vector3(parkingSpot.x,parkingSpot.y, parkingSpot.z))
        if veh == -1 or distance >= 1.5 then
            freeParkingSpots[#freeParkingSpots+1] = parkingSpot
        end
    end
    return freeParkingSpots
end

function GetFreeSingleParkingSpot(freeParkingSpots, vehicle)
    local checkAt = nil
    if StoreParkinglotAccuratly and SpawnAtLastParkinglot and vehicle and vehicle.parkingspot then
        checkAt = vector3(vehicle.parkingspot.x, vehicle.parkingspot.y, vehicle.parkingspot.z) or nil
    end
    local _, _, location = GetClosestLocation(freeParkingSpots, checkAt)
    return location
end

function GetSpawnLocationAndHeading(garage, garageType, parkingSpots, vehicle, spawnDistance)
    local location
    local heading
    local closestDistance = -1

    if garageType == "house" then
        location = garage.takeVehicle
        heading = garage.takeVehicle.h -- yes its 'h' not 'w'...
    else
        if next(parkingSpots) ~= nil then
            local freeParkingSpots = GetFreeParkingSpots(parkingSpots)
            if AllowSpawningFromAnywhere then
                location = GetFreeSingleParkingSpot(freeParkingSpots, vehicle)
                if location == nil then
                    QBCore.Functions.Notify(Lang:t("error.all_occupied"), "error", 4500)
                return end
                heading = location.w
            else
                _, closestDistance, location = GetClosestLocation(SpawnAtFreeParkingSpot and freeParkingSpots or parkingSpots)
                local plyCoords = GetEntityCoords(PlayerPedId(), 0)
                local spot = vector3(location.x, location.y, location.z)
                if SpawnAtLastParkinglot and vehicle and vehicle.parkingspot then
                    spot = vehicle.parkingspot
                end
                local dist = #(plyCoords - vector3(spot.x, spot.y, spot.z))
                if SpawnAtLastParkinglot and dist >= spawnDistance then
                    QBCore.Functions.Notify(Lang:t("error.too_far_away"), "error", 4500)
                    return
                elseif closestDistance >= spawnDistance then
                    QBCore.Functions.Notify(Lang:t("error.too_far_away"), "error", 4500)
                    return
                else
                    local veh, distance = QBCore.Functions.GetClosestVehicle(vector3(location.x,location.y, location.z))
                    if veh ~= -1 and distance <= 1.5 then
                        QBCore.Functions.Notify(Lang:t("error.occupied"), "error", 4500)
                    return end
                    heading = location.w
                end
            end
        else
            local ped = GetEntityCoords(PlayerPedId())
            local pedheadin = GetEntityHeading(PlayerPedId())
            local forward = GetEntityForwardVector(PlayerPedId())
            local x, y, z = table.unpack(ped + forward * 3)
            location = vector3(x, y, z)
            if VehicleHeading == 'forward' then
                heading = pedheadin
            elseif VehicleHeading == 'driverside' then
                heading = pedheadin + 90
            elseif VehicleHeading == 'hood' then
                heading = pedheadin + 180
            elseif VehicleHeading == 'passengerside' then
                heading = pedheadin + 270
            end
        end
    end
    return location, heading
end

local function SpawnVehicleSpawnerVehicle(vehicleModel, location, heading, garage, cb)
    QBCore.Functions.SpawnVehicle(vehicleModel, function(veh)
            local garage = garage
            if garage.plateprefix == nil then
                jobplate = QBCore.Functions.GetPlate(veh)
            else
                jobplate = garage.plateprefix..tostring(math.random(1000, 9999))
            end

            PlayerData = QBCore.Functions.GetPlayerData()
            SetVehicleNumberPlateText(veh, jobplate)
            SetJobVehItems(PlayerData.job.name)
            if FuelScript then
                exports[FuelScript]:SetFuel(veh, 100)
            else
                exports['ps-fuel']:SetFuel(veh, 100) -- Don't change this. Change it in the  Defaults to legacy fuel if not set in the config
            end
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            TriggerServerEvent("qb-garages:server:UpdateSpawnedVehicle", QBCore.Functions.GetPlate(veh), true)
			TriggerServerEvent('inventory:server:addTrunkItems', QBCore.Functions.GetPlate(veh), VehJobItems[PlayerData.job.name])

            ClearMenu()
            SetEntityHeading(veh, heading)
            
            if garage.WarpPlayerIntoVehicle ~= nil and garage.WarpPlayerIntoVehicle or WarpPlayerIntoVehicle then
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            end
            
            SetAsMissionEntity(veh)
            SetVehicleEngineOn(veh, true, true)
            if cb then cb(veh) end
    end, location, true)
end

function UpdateSpawnedVehicle(spawnedVehicle, vehicleInfo, heading, garage, properties)
    local plate = QBCore.Functions.GetPlate(spawnedVehicle)
    if garage.useVehicleSpawner then
        if plate then
            OutsideVehicles[plate] = spawnedVehicle
            TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
        end
        if FuelScript then
            exports[FuelScript]:SetFuel(spawnedVehicle, 100)
        else
            exports['ps-fuel']:SetFuel(spawnedVehicle, 100) -- Don't change this. Change it in the  Defaults to legacy fuel if not set in the config
        end
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
        TriggerServerEvent("qb-garages:server:UpdateSpawnedVehicle", plate, true)
    else
        if plate then
            OutsideVehicles[plate] = spawnedVehicle
            TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
        end
        if FuelScript then
            exports[FuelScript]:SetFuel(spawnedVehicle, vehicleInfo.fuel)
        else
            exports['ps-fuel']:SetFuel(spawnedVehicle, vehicleInfo.fuel) -- Don't change this. Change it in the  Defaults to legacy fuel if not set in the config
        end
        QBCore.Functions.SetVehicleProperties(spawnedVehicle, properties)
        SetVehicleNumberPlateText(spawnedVehicle, vehicleInfo.plate)
        SetAsMissionEntity(spawnedVehicle)
        if UseEnc0dedPersistenVehicles and spawnedVehicle then
            TriggerEvent('persistent-vehicles/register-vehicle', spawnedVehicle)
        end
        ApplyVehicleDamage(spawnedVehicle, vehicleInfo)
        TriggerServerEvent('qb-garages:server:updateVehicleState', 0, vehicleInfo.plate, 'OUT')
        TriggerEvent("vehiclekeys:client:SetOwner", vehicleInfo.plate)
    end
    SetEntityHeading(spawnedVehicle, heading)
    SetAsMissionEntity(spawnedVehicle)
    SetVehicleEngineOn(spawnedVehicle, true, true)
end

function SetJobVehItems(job) -- Set trunk item for job vehicle
	local items = {}
	for k, item in pairs(VehJobItems[job]) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo['name'],
			amount = tonumber(item.amount),
			info = item.info,
			label = itemInfo['label'],
			description = itemInfo['description'] and itemInfo['description'] or '',
			weight = itemInfo['weight'],
			type = itemInfo['type'],
			unique = itemInfo['unique'],
			useable = itemInfo['useable'],
			image = itemInfo['image'],
			slot = item.slot,
		}
	end
	VehJobItems[job] = items
end

-- Events

RegisterNetEvent("qb-garages:client:GarageMenu", function(data)
    local type = data.type
    local garageId = data.garageId
    local garage = data.garage
    local categories = data.categories and data.categories or {'car'}
    local header = data.header
    local superCategory = data.superCategory
    local leave

    leave = Lang:t("menu.leave."..superCategory)

    QBCore.Functions.TriggerCallback("qb-garages:server:GetGarageVehicles", function(result)
        if result == nil then
            QBCore.Functions.Notify(Lang:t("error.no_vehicles"), "error", 5000)
        else
            local MenuGarageOptions = {
                {
                    header = header,
                    isMenuHeader = true
                },
            }
            result = result and result or {}
            for k, v in pairs(result) do
                local enginePercent = Round(v.engine / 10, 0)
                local bodyPercent = Round(v.body / 10, 0)
                local currentFuel = v.fuel
                local vehData = QBCore.Shared.Vehicles[v.vehicle]
                local vname = 'Vehicle does not exist'
                if vehData then
                    vname = vehData.name
                end

                if v.state == 0 then
                    v.state = Lang:t("status.out")
                elseif v.state == 1 then
                    v.state = Lang:t("status.garaged")
                elseif v.state == 2 then
                    v.state = Lang:t("status.impound")
                end

                if type == "depot" then
                    MenuGarageOptions[#MenuGarageOptions+1] = {
                        header = Lang:t('menu.header.depot', {value = vname, value2 = v.depotprice }),
                        txt = Lang:t('menu.text.depot', {value = v.plate, value2 = currentFuel, value3 = enginePercent, value4 = bodyPercent}),
                        params = {
                            event = "qb-garages:client:TakeOutDepot",
                            args = {
                                vehicle = v,
                                vehicleModel = v.vehicle,
                                type = type,
                                garage = garage,
                                plate = v.plate,
                            }
                        }
                    }
                elseif type == "impound" then
                    MenuGarageOptions[#MenuGarageOptions+1] = {
                        header = Lang:t('menu.header.impound', {value = vname, value2 = v.plate }),
                        txt = Lang:t('menu.text.impound', {value = v.plate, value2 = currentFuel, value3 = enginePercent, value4 = bodyPercent}),
                        params = {
                            event = "qb-garages:client:TakeOutImpound",
                            args = {
                                vehicle = v,
                                vehicleModel = v.vehicle,
                                type = type,
                                garage = garage,
                                plate = v.plate,
                            }
                        }
                    }
                else
                    MenuGarageOptions[#MenuGarageOptions+1] = {
                        header = Lang:t('menu.header.garage', {value = vname, value2 = v.plate}),
                        txt = Lang:t('menu.text.garage', {value = v.state, value2 = currentFuel, value3 = enginePercent, value4 = bodyPercent}),
                        params = {
                            event = "qb-garages:client:TakeOutGarage",
                            args = {
                                vehicle = v,
                                vehicleModel = v.vehicle,
                                type = type,
                                garage = garage,
                                superCategory = superCategory,
                            }
                        }
                    }
                end
            end

            MenuGarageOptions[#MenuGarageOptions+1] = {
                header = leave,
                txt = "",
                params = {
                    event = "qb-menu:closeMenu",
                }
            }
            exports['qb-menu']:openMenu(MenuGarageOptions)
        end
    end, garageId, type, superCategory)
end)

RegisterNetEvent('qb-garages:client:TakeOutGarage', function(data, cb)
    local garageType = data.type
    local vehicleModel = data.vehicleModel
    local vehicle = data.vehicle
    local garage = data.garage
    local spawnDistance = garage.SpawnDistance and garage.SpawnDistance or SpawnDistance
    local parkingSpots = garage.ParkingSpots or {}
    local plateprefix = data.plateprefix

    local location, heading = GetSpawnLocationAndHeading(garage, garageType, parkingSpots, vehicle, spawnDistance)
    if garage.useVehicleSpawner then
        SpawnVehicleSpawnerVehicle(vehicleModel, location, heading, garage, cb)
    else
        if SpawnVehicleServerside then
            QBCore.Functions.TriggerCallback('qb-garages:server:spawnvehicle', function(netId, properties)
                local veh = NetToVeh(netId)
                if not veh or not netId then
                    print("ISSUE HERE: ", netId)
                    print(veh)
                    QBCore.Debug(properties)
                end
                UpdateSpawnedVehicle(veh, vehicle, heading, garage, properties)
                if cb then cb(veh) end
	    end, vehicle, location, garage.WarpPlayerIntoVehicle ~= nil and garage.WarpPlayerIntoVehicle or WarpPlayerIntoVehicle)
        else
            QBCore.Functions.SpawnVehicle(vehicleModel, function(veh)
                QBCore.Functions.TriggerCallback('qb-garages:server:GetVehicleProperties', function(properties)
                    UpdateSpawnedVehicle(veh, vehicle, heading, garage, properties)
                    if cb then cb(veh) end
                end, vehicle.plate)
            end, location, true)
        end
    end
end)



RegisterNetEvent('qb-radialmenu:client:onRadialmenuOpen', function()
    UpdateRadialMenu()
end)

RegisterNetEvent('qb-garages:client:OpenMenu', function()
    if CurrentGarage then
        local garage = Garages[CurrentGarage]
        local type = garage.type
        local vehicleindex = garage.jobVehiclesIndex
        if type == 'job' and garage.useVehicleSpawner then
            JobMenuGarage(CurrentGarage, vehicleindex)
        else
            PublicGarage(CurrentGarage, type)
        end
    elseif CurrentHouseGarage then
        TriggerEvent('qb-garages:client:OpenHouseGarage')
    end
end)

RegisterNetEvent('qb-garages:client:ParkVehicle', function()
    local ped = PlayerPedId()
    local curVeh = GetVehiclePedIsIn(ped)
    ParkVehicle(curVeh)
end)

RegisterNetEvent('qb-garages:client:ParkLastVehicle', function(parkingName)
    local ped = PlayerPedId()
    local curVeh = GetLastDrivenVehicle(ped)
    if curVeh then
        local coords = GetEntityCoords(curVeh)
        ParkVehicle(curVeh, parkingName or CurrentGarage, coords)
    else
        QBCore.Functions.Notify(Lang:t('error.no_vehicle'), "error", 4500)
    end
end)

RegisterNetEvent('qb-garages:client:TakeOutDepot', function(data)
    local vehicle = data.vehicle
    local vehExists = DoesEntityExist(OutsideVehicles[vehicle.plate])
    if not vehExists then
        if UseEnc0dedPersistenVehicles then
            QBCore.Functions.TriggerCallback('qb-garages:server:checkIsSpawned', function(spawned)
                if spawned then
                    QBCore.Functions.Notify(Lang:t('error.not_impound'), "error", 5000)
                    return
                end
            end, vehicle.plate)
        end
        local PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData.money['cash'] >= vehicle.depotprice or PlayerData.money['bank'] >= vehicle.depotprice then
            TriggerEvent("qb-garages:client:TakeOutGarage", data, function (veh)
                if veh then
                    TriggerServerEvent("qb-garages:server:PayDepotPrice", data)
                end
            end)
        end
    else
        QBCore.Functions.Notify(Lang:t('error.not_impound'), "error", 5000)
    end
end)

RegisterNetEvent('qb-garages:client:TakeOutImpound', function(data)
    local vehicle = data.vehicle
    local vehExists = DoesEntityExist(OutsideVehicles[vehicle.plate])
    if not vehExists then
        if UseEnc0dedPersistenVehicles then
            QBCore.Functions.TriggerCallback('qb-garages:server:checkIsSpawned', function(spawned)
                if spawned then
                    QBCore.Functions.Notify(Lang:t('error.not_impound'), "error", 5000)
                    return
                end
            end, vehicle.plate)
        end
        local PlayerData = QBCore.Functions.GetPlayerData()
        TriggerEvent("qb-garages:client:TakeOutGarage", data, function (veh)
        end)

    else
        QBCore.Functions.Notify(Lang:t('error.not_impound'), "error", 5000)
    end
end)

RegisterNetEvent('qb-garages:client:OpenHouseGarage', function()
    if UseLoafHousing then
        local hasKey = exports['loaf_housing']:HasHouseKey(CurrentHouseGarage)
        if hasKey then
            MenuHouseGarage()
        else
            QBCore.Functions.Notify(Lang:t("error.no_house_keys"))
        end
    else
        QBCore.Functions.TriggerCallback('qb-houses:server:hasKey', function(hasKey)
            if hasKey then
                MenuHouseGarage()
            else
                QBCore.Functions.Notify(Lang:t("error.no_house_keys"))
            end
        end, CurrentHouseGarage)
    end
end)

RegisterNetEvent('qb-garages:client:houseGarageConfig', function(garageConfig)
    HouseGarages = garageConfig
    for house, _ in pairs(HouseGarages) do
        RegisterHousePoly(house)
    end
end)

RegisterNetEvent('qb-garages:client:addHouseGarage', function(house, garageInfo)
    HouseGarages[house] = garageInfo
    RegisterHousePoly(house)
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData then return end
    PlayerGang = PlayerData.gang
    PlayerJob = PlayerData.job
    QBCore.Functions.TriggerCallback('qb-garages:server:GetOutsideVehicles', function(outsideVehicles)
        OutsideVehicles = outsideVehicles
    end)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() and QBCore.Functions.GetPlayerData() ~= {} then
        PlayerData = QBCore.Functions.GetPlayerData()
        if not PlayerData then return end
        PlayerGang = PlayerData.gang
        PlayerJob = PlayerData.job
    end
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    PlayerGang = gang
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

RegisterNetEvent('qb-garages:client:ImpoundVehicle', function(fullImpound, price)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local bodyDamage = math.ceil(GetVehicleBodyHealth(vehicle))
    local engineDamage = math.ceil(GetVehicleEngineHealth(vehicle))
    local totalFuel = exports['ps-fuel']:GetFuel(vehicle)
    if fullImpound then
        progtext = 'Impound'
    else
        progtext = 'Depot'
    end
    if vehicle ~= 0 and vehicle then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local vehpos = GetEntityCoords(vehicle)
        if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) then
            local dialog = exports['qb-input']:ShowInput({
                header = "Impound",
                submitText = "Submit",
                inputs = {
                    {
                        text = "How long?", -- text you want to be displayed as a input header
                        name = "impoundtime", -- name of the input should be unique otherwise it might override
                        type = "radio", -- type of the input - Check is useful for "AND" options e.g; taxincle = gst AND business AND othertax
                        options = { -- The options (in this case for a check) you want displayed, more than 6 is not recommended
                            { value = "2", text = "2 Hours"}, -- Options MUST include a value and a text option
                            { value = "4", text = "4 Hours"}, -- Options MUST include a value and a text option
                            { value = "24", text = "1 Day" }, -- Options MUST include a value and a text option, checked = true is default value, optional
                            { value = "168", text = "1 Week" }, -- Options MUST include a value and a text option, checked = true is default value, optional
                            { value = "730", text = "1 Month"},  -- Options MUST include a value and a text option
                            { value = "99999", text = "Sieze"}  -- Options MUST include a value and a text option

                        }
                    },
                },
            })
            if dialog then
                impoundtime = dialog.impoundtime
            end
           QBCore.Functions.Progressbar('impound', progtext.." Vehicle", 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'missheistdockssetup1clipboard@base',
                anim = 'base',
                flags = 1,
            }, {
                model = 'prop_notepad_01',
                bone = 18905,
                coords = { x = 0.1, y = 0.02, z = 0.05 },
                rotation = { x = 10.0, y = 0.0, z = 0.0 },
            },{
                model = 'prop_pencil_01',
                bone = 58866,
                coords = { x = 0.11, y = -0.02, z = 0.001 },
                rotation = { x = -120.0, y = 0.0, z = 0.0 },
            }, function() -- Play When Done
                local plate = QBCore.Functions.GetPlate(vehicle)
                TriggerServerEvent("qb-garages:server:Impound", plate, fullImpound, impoundtime, price, bodyDamage, engineDamage, totalFuel)
                QBCore.Functions.DeleteVehicle(vehicle)
                TriggerEvent('QBCore:Notify', progtext.." Successful", 'success')
                ClearPedTasks(ped)
            end, function() -- Play When Cancel
                ClearPedTasks(ped)
                TriggerEvent('QBCore:Notify', "Action Cancelled", 'error')
            end)
        end
    end
end)
-- Threads

CreateThread(function()
    for _, garage in pairs(Garages) do
        if garage.showBlip then
            local Garage = AddBlipForCoord(garage.blipcoords.x, garage.blipcoords.y, garage.blipcoords.z)
            local blipColor = garage.blipColor ~= nil and garage.blipColor or 3
            SetBlipSprite(Garage, garage.blipNumber)
            SetBlipDisplay(Garage, 4)
            SetBlipScale(Garage, 0.60)
            SetBlipAsShortRange(Garage, true)
            SetBlipColour(Garage, blipColor)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(GarageNameAsBlipName and garage.label or garage.blipName)
            EndTextCommandSetBlipName(Garage)
        end
    end
end)

CreateThread(function()
    for garageName, garage in pairs(Garages) do
        if(garage.type == 'public' or garage.type == 'depot' or garage.type == 'job' or garage.type == 'gang' or garage.type == 'impound') then
            CreateGaragePolyZone(garageName)
        end
    end
    CreateGarageZone()
end)

CreateThread(function()
    local debug = false
    for _, garage in pairs(Garages) do
        if garage.debug then
            debug = true
            break
        end
    end
    while debug do
        for _, garage in pairs(Garages) do
            local parkingSpots = garage.ParkingSpots and garage.ParkingSpots or {}
            if next(parkingSpots) ~= nil and garage.debug then
                for _, location in pairs(parkingSpots) do
                    DrawMarker(2, location.x, location.y, location.z + 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                end
            end
        end
        Wait(0)
    end
end)

CreateThread(function()
    for category, classes  in pairs(VehicleCategories) do
        for _, class  in pairs(classes) do
            VehicleClassMap[class] = category
        end
    end
end)
