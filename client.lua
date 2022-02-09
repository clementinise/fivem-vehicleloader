local Vehicles = {}

Citizen.CreateThread(function()
	TriggerServerEvent('fivem-vehicleloader:GetVehicles')
end)

RegisterNetEvent('fivem-vehicleloader:VehicleIntoTable')
AddEventHandler('fivem-vehicleloader:VehicleIntoTable', function(name)
	table.insert(Vehicles, name)
end)

RegisterNetEvent('fivem-vehicleloader:LoadVehicles')
AddEventHandler('fivem-vehicleloader:LoadVehicles', function()
    
    for i, v in pairs(Config.OtherVehicles) do
        TriggerEvent('fivem-vehicleloader:VehicleIntoTable', v)
	end

	if Config.DebugPrint then
		print("Start loading vehicles...\n")
	end
	for i, vehicle in ipairs(Vehicles) do
		if not IsModelInCdimage(vehicle) or not IsModelAVehicle(vehicle) then
			if Config.DebugPrint then
				print(vehicle .. " hasn't been found (model name isn't the same as the folder name or mispelled in \"Config.OtherVehicles\").")
			end
		else
			RequestModel(vehicle)
			
			repeat
				if Config.DebugPrint then
					print("Loading " .. vehicle.."...")
				end
				Citizen.Wait(500)
			until HasModelLoaded(vehicle)

			if HasModelLoaded(vehicle) then
				if Config.DebugPrint then
					print(vehicle .. " is loaded.\n")
				end
			end
			SetModelAsNoLongerNeeded(vehicle)
		end
	end
	if Config.DebugPrint then
		print("All addon vehicles are loaded!")
	end

end)
