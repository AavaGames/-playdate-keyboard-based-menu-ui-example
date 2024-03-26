--[[
	This is an EXAMPLE of a potential inventory menu
	that reads the players inventory on open and creates sub menus to each item
	for them to choose what to do with it (Use, Drop, Throw, etc)
]]

class("InventoryMenu").extends()

function InventoryMenu:init(menuManager, character)
    self.menuManager = menuManager
	self.character = character
	-- menu is fluid so we make it on open() everytime
    self.menu = nil
end

function InventoryMenu:open()
	local items = {}
	-- Iterate over all characters items in their inventory and add it to the menu
	for index, item in ipairs(self.character.inventory.items) do
		table.insert(items,
			MenuItem(item:getName(), nil, true, false, false, function ()
				-- Creates another menu with options for that item
				-- Use, Drop, Throw, etc.
				ItemMenu(self.menuManager, item):open()
		end))
	end

	-- Create the Menu and show on screen
	self.menu = Menu(self.menuManager, "Inventory (Non-functional)", newFont, items)
    self.menu:open()
end