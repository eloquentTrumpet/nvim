require("_common")

-- local openDiffForNextFile = "Open diff for next file"
-- local openDiffForPreviousFile = "Open diff for prev file"
-- local openFileInPreviousTabpage = "Open file in previous tabpage"
-- local openFileInNewSplit = "Open file in new split"
-- local openFileInNewTabpage = "Open file in new tabpage"
-- local focusFilePanel = "Focus file panel"
-- local toggleFilePanel = "Toggle file panel"
-- local cycleLayouts = "Cycle layouts"
-- local ours = "OURS"
-- local theirs = "THEIRS"
-- local openHelpPanel = "Open help panel"
-- local closeHelpMenu = "Close help menu"
-- local bringCursorToNextFileEntry = "Bring cursor to next file entry"
-- local openDiffForSelectedEntry = "Open diff for selected entry"
-- local scrollViewUp = "Scroll view up"
-- local scrollViewDown = "Scroll view down"
-- local allVersionsOfConflictForWholeFile = "All v. of c. for whole file"

-- diffview
local M = {
	"sindrets/diffview.nvim",
	config = function()
		-- local name = "Diffview"
		-- local label = LABEL(name)
		-- local actions = require("diffview.actions")
		require("diffview").setup({
			keymaps = {
				disable_defaults = false, -- Disable the default keymaps
			},
		})
	end,
}

return { M }
