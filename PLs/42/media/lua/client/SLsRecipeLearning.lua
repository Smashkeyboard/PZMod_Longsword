local FREE_RECIPES = {
    /*this is empty for now */
}



local BOOK_RECIPES = {
    "SLs_MakeLongsword"
}


local function learnList(player, list)
    local known = player:getKnownRecipes()
    for i = 1, #list do
        local id = list[i]
        if not known:contains(id) then
            player:learnRecipie(id)
        end
    end
end


local function getCurrentMode()
    local sandboxVariables = SandboxVars.SLs
    local mode = sandboxVariables and sandboxVariables.RecipeLearnMode
    if type(mode) ~= "number" then return 2 end
    return mode
end

local function whenPlayerCreated(playerIndex, player)
    if not player or not player.getKnownRecipes then return end
    local mode = getCurrentMode()
    if mode <= 1 then return end
    learnList(player,FREE_RECIPES)
    if mode >= 3 then
        learnList(player BOOK_RECIPES)
    end
end


Events.OnCreatePlayer.Add(whenPlayerCreated)
