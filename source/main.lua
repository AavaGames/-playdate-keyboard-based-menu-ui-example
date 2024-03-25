import "keyboard-based-menu/imports"
import "imports"

local gfx <const> = playdate.graphics

baseFont = gfx.getFont()
newFont = gfx.font.new("font/CompaqThin_8x16")

--[[MenuManager constructor can take a font and two callbacks.
	First when a menu opens from no menus and second when all menus have closed
	You can use these call backs to disable/enable input to your gameplay
]] 
local menuManager = MenuManager(
	newFont,
	function() 
		print("opened the first menu!");
	end,
	function ()
		print("all menus have closed!")
	end
)

-- MENU EXAMPLES
-- open the corresponding file to see how the menu items work 
local settingsMenu = SettingsMenu(menuManager)
local commandMenu = CommandMenu(menuManager)

-- DEBUG MENU EXAMPLE
-- you can put something like this in your debug class and have a menu 
-- show the option to open this menu if debug is enabled
debugMenu = DebugMenu(menuManager)
-- if this is false there is no option to open the debug menu from settings menu
debug = true
fps = true

local function loadGame()
	playdate.display.setRefreshRate(50)
	gfx:setFont(newFont)
end

local function updateGame()

	if (menuManager.currentMenu == nil) then
		if (playdate.buttonJustPressed(playdate.kButtonA)) then
			settingsMenu:open()
		elseif (playdate.buttonJustPressed(playdate.kButtonB)) then
			commandMenu:open()
		end
	end

	menuManager:update();
end

local function drawGame()
	gfx.clear() -- Clears the screen

	if (menuManager.currentMenu == nil) then
		gfx.drawTextInRect(
			"KEYBOARD BASED MENU SHOWCASE\n\n" ..
			"A: Open Settings Menu\n" ..
			"B: Open Command Menu",
			0, 5, 400, 240, nil, nil, kTextAlignment.center
		)
	end

	menuManager:draw();
end

loadGame()

function playdate.update()
	updateGame()
	drawGame()
	if (fps) then
		playdate.drawFPS(0,0) -- FPS widget
	end
end