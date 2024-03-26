--[[
	An example of a debug menu with real examples from my ascii roguelike project
]]

class("DebugMenu").extends()

function DebugMenu:init(menuManager)

    self.menuManager = menuManager
    self.menu = Menu(self.menuManager, "DEBUG MENU #" .. math.random(0, 1000), baseFont, {

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

		-- Very long names will never go off screen and won't cause pages to break
		MenuItem("an absurdly looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong name", nil, true, true, true, function () end),
		MenuItem("an absurdly looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong name", nil, true, true, true, function () end),
		MenuItem("an absurdly looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong name", nil, true, true, true, function () end),
		MenuItem("an absurdly looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong name", nil, true, true, true, function () end),

		-- Showcases pages and that the assigned glyph (X) will always be taken by the first item encountered
		MenuItem("Padding 2", "X", true, true, true, function () end),
		MenuItem("Padding 3", nil, true, true, true, function () end),
		MenuItem("Padding 4", nil, true, true, true, function () end),
		MenuItem("Padding 5", "X", true, true, true, function () end),
		MenuItem("Padding 6", "X", true, true, true, function () end),
		MenuItem("Padding 7", "X", true, true, true, function () end),
		MenuItem("Padding 8", nil, true, true, true, function () end),
		MenuItem("Padding 9", "X", true, true, true, function () end),
		MenuItem("Padding 10", "X", true, true, true, function () end),
		MenuItem("Padding 11", "X", true, true, true, function () end),
		MenuItem("Padding 12", "X", true, true, true, function () end),
		MenuItem("Padding 13", "X", true, true, true, function () end),
		MenuItem("Padding 14", nil, true, true, true, function () end),
		MenuItem("Padding 15", nil, true, true, true, function () end),
		MenuItem("Padding 16", nil, true, true, true, function () end),
		MenuItem("Padding 17", "X", true, true, true, function () end),
		MenuItem("Padding 18", "X", true, true, true, function () end),

		-- This will appear on page 1 even though its last because it is the only 'Z'!
		MenuItem("Close All Menus", "Z", true, true, true, function () end),
	})

end

function DebugMenu:open()
    self.menu:open()
end