require 'Items/ProceduralDistributions'

local function addLoot(listName, fullType, weight)
    local list = ProceduralDistributions["list"][listName]
    if not list or not list.items then
        print("PWPN: loot list not found in this build, skipped: " .. tostring(listName))
        return
    end
    if weight <= 0 then
        return
    end
    table.insert(list.items, fullType)
    table.insert(list.items, weight)
end

local SV = SandboxVars.SLs

local spots = {}

spots.forgedLongBlade = {
    { "MeleeWeapons", 4 },
    { "WildWestBlacksmith", 5},
    { "BlacksmithTools", 3 },
    { "BlacksmithMolds", 3 },
    { "CrateBlacksmithing", 3 },
    { "MedievalTools", 8 },
    { "Antiques", 2 },
    { "PawnShopTools", 3 },
    { "GarageMetalwork", 2 },
    { "CrateMetalBars", 2 },
}



local weapons = {
    { "SLs.SmashLongsword", SV.SmashLongswordSpawnMult, spots.forgedLongBlade, 1 }
    
}


for _, w in ipairs(weapons) do
    for _, spot in ipairs(w[3]) do
        addLoot(spot[1], w[1], spot[2] * w[4] * w[2])
    end
end



local books = {
    { item = "PWPN.ScrapWeaponsBook", mult = SV.ScrapWeaponsBookSpawnMult, spots = {
        { "GarageMetalwork", 2 },
        { "MetalShopTools", 4 },
        { "WeldingWorkshopTools", 6 },
        { "ToolStoreBooks", 5 },
        { "MechanicShelfBooks", 3 },
        { "CrateBooks", 5 },
        { "JunkHoard", 2 },
        { "LivingRoomShelf", 0.05 },
        { "BedroomSidetable", 0.05 },
        { "WardrobeRedneck", 0.04 },
        { "WardrobeGeneric", 0.02 },
    } }
}

for _, book in ipairs(books) do
    for _, spot in ipairs(book.spots) do
        addLoot(spot[1], book.item, spot[2] * book.mult)
    end
end
