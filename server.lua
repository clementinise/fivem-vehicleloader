local VehTable = {}
AlreadyGotAllVeh = false

RegisterServerEvent('fivem-vehicleloader:GetVehicles')
AddEventHandler('fivem-vehicleloader:GetVehicles', function()

	if not AlreadyGotAllVeh and (string.len(Config.VehicleFolderName) >= 1) then
		VehicleFolder = string.gsub(Config.VehicleFolderName, "%[", "%%["):gsub("%]", "%%]")

		local Resources = GetNumResources()

		for i=0, Resources, 1 do
			local resource = GetResourceByFindIndex(i)
			if resource then
				local resourcePath = GetResourcePath(resource)
				if string.find(resourcePath, VehicleFolder) then
					table.insert(VehTable, resource)
				end
			end
		end

	end

	AlreadyGotAllVeh = true
	if next(VehTable) then
		for i, v in pairs(VehTable) do
			TriggerClientEvent('fivem-vehicleloader:VehicleIntoTable', source, v)
		end
	end
    
    TriggerClientEvent('fivem-vehicleloader:LoadVehicles', source)

end)