--[[
	An example of a settings menu with items for looping list options and boolean toggles
	Also adding a debug menu if debugging is active
]]

class("SettingsMenu").extends()

function SettingsMenu:init(menuManager)
    self.menuManager = menuManager

	local items = {

		MenuItem("Toggle BG Color", "", false, true, false, function ()
			self.menuManager:setBackgroundColor(self.menuManager.backgroundColor == playdate.graphics.kColorWhite
			 	and playdate.graphics.kColorBlack or playdate.graphics.kColorWhite)
		end),

		-- Cycle through fonts
		MenuItemOptions("Settings Menu Padding", nil, false, false, false, { "4, 4", "10, 10", "30, 4", "0, 0" }, 1, function (option)
			if (option == "4, 4") then
				self.menu:SetPadding(4, 4)
			elseif (option == "10, 10") then
				self.menu:SetPadding(10, 10)
			elseif (option == "30, 4") then
				self.menu:SetPadding(30, 4)
			elseif (option == "0, 0") then
				self.menu:SetPadding(0, 0)
			end
		end),

		-- Cycle through fonts
		MenuItemOptions("Game Font", nil, false, false, false, { "10px", "8px" }, 2, function (option)
			-- if (option == "10px") then
			-- 	self.gameManager:setFont(baseFont)
			-- elseif (option == "8px") then
			-- 	self.gameManager:setFont(newFont)
			-- end
		end),

		-- Toggles a setting variable
        MenuItemBool("Center Camera on Character", nil, true, false, false, false, function (bool)
			-- settings.cameraFollowPlayer = bool
			-- if (bool == true) then gameManager.levelManager.currentLevel.camera:centreOnTarget() end
		end),

		MenuItemBool("Pick Up Automatically", nil, true, false, false, true, function (bool)
			-- settings.pickUpAutomatically = bool
		end),
	}

	-- if we have debug on then have access to our debug menu
	-- can switch with your global debug class if you have one
	if (debug) then
		table.insert(items, MenuItem("Debug Menu", "1", false, false, false, function ()
			debugMenu:open()
		end))
	end

    self.menu = Menu(menuManager, "SETTINGS", newFont, items)
end

function SettingsMenu:open()
    self.menu:open()
end