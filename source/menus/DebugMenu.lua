--[[
	An example of a debug menu with real examples from my ascii roguelike project
]]

class("DebugMenu").extends()

function DebugMenu:init(menuManager)
    self.menuManager = menuManager
	
    self.menu = Menu(self.menuManager, "DEBUG MENU #" .. math.random(0, 1000), {

		MenuItemBool("FPS", nil, true, false, false, true, function (bool)
			fps = bool
		end),

		MenuItemBool("Distance Map Draw", nil, true, true, false, false, function (bool)
			--gameManager.levelManager.currentLevel.debugDrawDistMap = bool
		end),

		MenuItemOptions("Distance Map", nil, false, false, false, { "toPlayerPathMap", "smellMap", "soundMap" }, 1, function (option)
			--gameManager.levelManager.currentLevel.debugDistMap = option
		end),

		MenuItem("Load *Town*", nil, true, true, true, function () 
			-- if (gameManager.levelManager.currentLevel.className ~= "Town") then
			-- 	pDebug:log("Changed level to town")
			-- 	gameManager.levelManager:loadLevel(Town, true)
			-- else
			-- 	gameManager.logManager:add("Already at level")
			-- end
		end),

		MenuItem("Load Prototype", nil, true, true, true, function () 
			-- if (gameManager.levelManager.currentLevel.className ~= "Prototype") then
			-- 	pDebug:log("Changed level to Prototype")
			-- 	gameManager.levelManager:loadLevel(Prototype, true)
			-- else
			-- 	gameManager.logManager:add("Already at level")
			-- end
		end),

		MenuItem("Close All Menus", "Z", true, true, true, function () end),

		-- Showcases pages and that the assigned glyph (Z) will always be taken by the first item encountered
		MenuItem("Padding 1", nil, true, true, true, function () end),
		MenuItem("Padding 2", "Z", true, true, true, function () end),
		MenuItem("Padding 3", nil, true, true, true, function () end),
		MenuItem("Padding 4", nil, true, true, true, function () end),
		MenuItem("Padding 5", "Z", true, true, true, function () end),
		MenuItem("Padding 6", "Z", true, true, true, function () end),
		MenuItem("Padding 7", "Z", true, true, true, function () end),
		MenuItem("Padding 8", nil, true, true, true, function () end),
		MenuItem("Padding 9", "Z", true, true, true, function () end),
		MenuItem("Padding 10", "Z", true, true, true, function () end),
		MenuItem("Padding 11", "Z", true, true, true, function () end),
		MenuItem("Padding 12", "Z", true, true, true, function () end),
		MenuItem("Padding 13", "Z", true, true, true, function () end),
		MenuItem("Padding 14", nil, true, true, true, function () end),
		MenuItem("Padding 15", nil, true, true, true, function () end),
		MenuItem("Padding 16", nil, true, true, true, function () end),
		MenuItem("Padding 17", "Z", true, true, true, function () end),
		MenuItem("Padding 18", "Z", true, true, true, function () end),
	})

end

function DebugMenu:open()
    self.menuManager:addMenu(self.menu)
end