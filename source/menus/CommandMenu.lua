class("CommandMenu").extends()

function CommandMenu:init(menuManager)

    self.showing = false
    self.menuManager = menuManager
    self.menu = Menu(menuManager, "COMMANDS", {

        MenuItem("Centre Camera on Player", nil, true, true, false, function ()
            -- A global game manager
			-- gameManager.levelManager.currentLevel.camera:centreOnTarget()
		end),

		MenuItem("Fullscreen Log", nil, true, true, false, function () 
			-- gameManager:setFullscreenLog(not gameManager.logManager.fullscreen)
		end),

    })

end

function CommandMenu:open()
    self.menu:open()
end