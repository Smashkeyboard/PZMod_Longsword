require "Definitions/AttachedWeaponDefinitions"

local function addAttached(defName, items)
	local def = AttachedWeaponDefinitions[defName]
	if type(def) ~= "table" or type(def.weapons) ~= "table" then
		print("PWPN: AttachedWeaponDefinitions." .. tostring(defName) .. " missing in this build - skipped")
		return
	end
	for i = 1, #items do
		table.insert(def.weapons, items[i])
	end
end

addAttached("macheteInBack", { "SLs.SmashLongsword"})
