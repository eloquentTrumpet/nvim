require("_common")

-- diffview
local M = {
	"sindrets/diffview.nvim",
	config = function()
		local name = "Diffview"
		local label = LABEL(name)
		local actions = require("diffview.actions")
		require("diffview").setup({
			keymaps = {
				disable_defaults = false, -- Disable the default keymaps
				view = {
					-- The `view` bindings are active in the diff buffers, only when the current
					-- tabpage is a Diffview.
					{
						"n",
						"<tab>",
						actions.select_next_entry,
						{ desc = label("Open the diff for the next file") },
					},
					{
						"n",
						"<s-tab>",
						actions.select_prev_entry,
						{ desc = label("Open the diff for the previous file") },
					},
					{
						"n",
						"gf",
						actions.goto_file_edit,
						{ desc = label("Open the file in the previous tabpage") },
					},
					{ "n", "<C-w><C-f>", actions.goto_file_split, { desc = label("Open the file in a new split") } },
					{ "n", "<C-w>gf", actions.goto_file_tab, { desc = label("Open the file in a new tabpage") } },
					{ "n", "<leader>e", actions.focus_files, { desc = label("Bring focus to the file panel") } },
					{ "n", "<leader>b", actions.toggle_files, { desc = label("Toggle the file panel.") } },
					{
						"n",
						"g<C-x>",
						actions.cycle_layout,
						{ desc = label("Cycle through available layouts.") },
					},
					{
						"n",
						"[x",
						actions.prev_conflict,
						{ desc = label("In the merge-tool: jump to the previous conflict") },
					},
					{
						"n",
						"]x",
						actions.next_conflict,
						{ desc = label("In the merge-tool: jump to the next conflict") },
					},
					{
						"n",
						"<leader>co",
						actions.conflict_choose("ours"),
						{ desc = label("Choose the OURS version of a conflict") },
					},
					{
						"n",
						"<leader>ct",
						actions.conflict_choose("theirs"),
						{ desc = label("Choose the THEIRS version of a conflict") },
					},
					{
						"n",
						"<leader>cb",
						actions.conflict_choose("base"),
						{ desc = label("Choose the BASE version of a conflict") },
					},
					{
						"n",
						"<leader>ca",
						actions.conflict_choose("all"),
						{ desc = label("Choose all the versions of a conflict") },
					},
					{ "n", "dx", actions.conflict_choose("none"), { desc = label("Delete the conflict region") } },
					{
						"n",
						"<leader>cO",
						actions.conflict_choose_all("ours"),
						{ desc = label("Choose the OURS version of a conflict for the whole file") },
					},
					{
						"n",
						"<leader>cT",
						actions.conflict_choose_all("theirs"),
						{ desc = label("Choose the THEIRS version of a conflict for the whole file") },
					},
					{
						"n",
						"<leader>cB",
						actions.conflict_choose_all("base"),
						{ desc = label("Choose the BASE version of a conflict for the whole file") },
					},
					{
						"n",
						"<leader>cA",
						actions.conflict_choose_all("all"),
						{ desc = label("Choose all the versions of a conflict for the whole file") },
					},
					{
						"n",
						"dX",
						actions.conflict_choose_all("none"),
						{ desc = label("Delete the conflict region for the whole file") },
					},
				},
				diff1 = {
					-- Mappings in single window diff layouts
					{ "n", "g?", actions.help({ "view", "diff1" }), { desc = label("Open the help panel") } },
				},
				diff2 = {
					-- Mappings in 2-way diff layouts
					{ "n", "g?", actions.help({ "view", "diff2" }), { desc = label("Open the help panel") } },
				},
				diff3 = {
					-- Mappings in 3-way diff layouts
					{
						{ "n", "x" },
						"2do",
						actions.diffget("ours"),
						{ desc = label("Obtain the diff hunk from the OURS version of the file") },
					},
					{
						{ "n", "x" },
						"3do",
						actions.diffget("theirs"),
						{ desc = label("Obtain the diff hunk from the THEIRS version of the file") },
					},
					{ "n", "g?", actions.help({ "view", "diff3" }), { desc = label("Open the help panel") } },
				},
				diff4 = {
					-- Mappings in 4-way diff layouts
					{
						{ "n", "x" },
						"1do",
						actions.diffget("base"),
						{ desc = label("Obtain the diff hunk from the BASE version of the file") },
					},
					{
						{ "n", "x" },
						"2do",
						actions.diffget("ours"),
						{ desc = label("Obtain the diff hunk from the OURS version of the file") },
					},
					{
						{ "n", "x" },
						"3do",
						actions.diffget("theirs"),
						{ desc = label("Obtain the diff hunk from the THEIRS version of the file") },
					},
					{ "n", "g?", actions.help({ "view", "diff4" }), { desc = label("Open the help panel") } },
				},
				file_panel = {
					{
						"n",
						"j",
						actions.next_entry,
						{ desc = label("Bring the cursor to the next file entry") },
					},
					{
						"n",
						"<down>",
						actions.next_entry,
						{ desc = label("Bring the cursor to the next file entry") },
					},
					{
						"n",
						"k",
						actions.prev_entry,
						{ desc = label("Bring the cursor to the previous file entry") },
					},
					{
						"n",
						"<up>",
						actions.prev_entry,
						{ desc = label("Bring the cursor to the previous file entry") },
					},
					{
						"n",
						"<cr>",
						actions.select_entry,
						{ desc = label("Open the diff for the selected entry") },
					},
					{
						"n",
						"o",
						actions.select_entry,
						{ desc = label("Open the diff for the selected entry") },
					},
					{
						"n",
						"l",
						actions.select_entry,
						{ desc = label("Open the diff for the selected entry") },
					},
					{
						"n",
						"<2-LeftMouse>",
						actions.select_entry,
						{ desc = label("Open the diff for the selected entry") },
					},
					{
						"n",
						"-",
						actions.toggle_stage_entry,
						{ desc = label("Stage / unstage the selected entry") },
					},
					{
						"n",
						"s",
						actions.toggle_stage_entry,
						{ desc = label("Stage / unstage the selected entry") },
					},
					{ "n", "S", actions.stage_all, { desc = label("Stage all entries") } },
					{ "n", "U", actions.unstage_all, { desc = label("Unstage all entries") } },
					{
						"n",
						"X",
						actions.restore_entry,
						{ desc = label("Restore entry to the state on the left side") },
					},
					{ "n", "L", actions.open_commit_log, { desc = label("Open the commit log panel") } },
					{ "n", "zo", actions.open_fold, { desc = label("Expand fold") } },
					{ "n", "h", actions.close_fold, { desc = label("Collapse fold") } },
					{ "n", "zc", actions.close_fold, { desc = label("Collapse fold") } },
					{ "n", "za", actions.toggle_fold, { desc = label("Toggle fold") } },
					{ "n", "zR", actions.open_all_folds, { desc = label("Expand all folds") } },
					{ "n", "zM", actions.close_all_folds, { desc = label("Collapse all folds") } },
					{ "n", "<c-b>", actions.scroll_view(-0.25), { desc = label("Scroll the view up") } },
					{ "n", "<c-f>", actions.scroll_view(0.25), { desc = label("Scroll the view down") } },
					{
						"n",
						"<tab>",
						actions.select_next_entry,
						{ desc = label("Open the diff for the next file") },
					},
					{
						"n",
						"<s-tab>",
						actions.select_prev_entry,
						{ desc = label("Open the diff for the previous file") },
					},
					{
						"n",
						"gf",
						actions.goto_file_edit,
						{ desc = label("Open the file in the previous tabpage") },
					},
					{
						"n",
						"<C-w><C-f>",
						actions.goto_file_split,
						{ desc = label("Open the file in a new split") },
					},
					{
						"n",
						"<C-w>gf",
						actions.goto_file_tab,
						{ desc = label("Open the file in a new tabpage") },
					},
					{
						"n",
						"i",
						actions.listing_style,
						{ desc = label("Toggle between 'list' and 'tree' views") },
					},
					{
						"n",
						"f",
						actions.toggle_flatten_dirs,
						{ desc = label("Flatten empty subdirectories in tree listing style") },
					},
					{
						"n",
						"R",
						actions.refresh_files,
						{ desc = label("Update stats and entries in the file list") },
					},
					{
						"n",
						"<leader>e",
						actions.focus_files,
						{ desc = label("Bring focus to the file panel") },
					},
					{ "n", "<leader>b", actions.toggle_files, { desc = label("Toggle the file panel") } },
					{ "n", "g<C-x>", actions.cycle_layout, { desc = label("Cycle available layouts") } },
					{ "n", "[x", actions.prev_conflict, { desc = label("Go to the previous conflict") } },
					{ "n", "]x", actions.next_conflict, { desc = label("Go to the next conflict") } },
					{ "n", "g?", actions.help("file_panel"), { desc = label("Open the help panel") } },
					{
						"n",
						"<leader>cO",
						actions.conflict_choose_all("ours"),
						{ desc = label("Choose the OURS version of a conflict for the whole file") },
					},
					{
						"n",
						"<leader>cT",
						actions.conflict_choose_all("theirs"),
						{ desc = label("Choose the THEIRS version of a conflict for the whole file") },
					},
					{
						"n",
						"<leader>cB",
						actions.conflict_choose_all("base"),
						{ desc = label("Choose the BASE version of a conflict for the whole file") },
					},
					{
						"n",
						"<leader>cA",
						actions.conflict_choose_all("all"),
						{ desc = label("Choose all the versions of a conflict for the whole file") },
					},
					{
						"n",
						"dX",
						actions.conflict_choose_all("none"),
						{ desc = label("Delete the conflict region for the whole file") },
					},
				},
				file_history_panel = {
					{ "n", "g!", actions.options, { desc = label("Open the option panel") } },
					{
						"n",
						"<C-A-d>",
						actions.open_in_diffview,
						{ desc = label("Open the entry under the cursor in a diffview") },
					},
					{
						"n",
						"y",
						actions.copy_hash,
						{ desc = label("Copy the commit hash of the entry under the cursor") },
					},
					{ "n", "L", actions.open_commit_log, { desc = label("Show commit details") } },
					{ "n", "zR", actions.open_all_folds, { desc = label("Expand all folds") } },
					{ "n", "zM", actions.close_all_folds, { desc = label("Collapse all folds") } },
					{
						"n",
						"j",
						actions.next_entry,
						{ desc = label("Bring the cursor to the next file entry") },
					},
					{
						"n",
						"<down>",
						actions.next_entry,
						{ desc = label("Bring the cursor to the next file entry") },
					},
					{
						"n",
						"k",
						actions.prev_entry,
						{ desc = label("Bring the cursor to the previous file entry.") },
					},
					{
						"n",
						"<up>",
						actions.prev_entry,
						{ desc = label("Bring the cursor to the previous file entry.") },
					},
					{
						"n",
						"<cr>",
						actions.select_entry,
						{ desc = label("Open the diff for the selected entry.") },
					},
					{
						"n",
						"o",
						actions.select_entry,
						{ desc = label("Open the diff for the selected entry.") },
					},
					{
						"n",
						"<2-LeftMouse>",
						actions.select_entry,
						{ desc = label("Open the diff for the selected entry.") },
					},
					{ "n", "<c-b>", actions.scroll_view(-0.25), { desc = label("Scroll the view up") } },
					{ "n", "<c-f>", actions.scroll_view(0.25), { desc = label("Scroll the view down") } },
					{ "n", "<tab>", actions.select_next_entry, { desc = label("Open the diff for the next file") } },
					{
						"n",
						"<s-tab>",
						actions.select_prev_entry,
						{ desc = label("Open the diff for the previous file") },
					},
					{
						"n",
						"gf",
						actions.goto_file_edit,
						{ desc = label("Open the file in the previous tabpage") },
					},
					{ "n", "<C-w><C-f>", actions.goto_file_split, { desc = label("Open the file in a new split") } },
					{ "n", "<C-w>gf", actions.goto_file_tab, { desc = label("Open the file in a new tabpage") } },
					{ "n", "<leader>e", actions.focus_files, { desc = label("Bring focus to the file panel") } },
					{ "n", "<leader>b", actions.toggle_files, { desc = label("Toggle the file panel") } },
					{ "n", "g<C-x>", actions.cycle_layout, { desc = label("Cycle available layouts") } },
					{ "n", "g?", actions.help("file_history_panel"), { desc = label("Open the help panel") } },
				},
				option_panel = {
					{ "n", "<tab>", actions.select_entry, { desc = label("Change the current option") } },
					{ "n", "q", actions.close, { desc = label("Close the panel") } },
					{ "n", "g?", actions.help("option_panel"), { desc = label("Open the help panel") } },
				},
				help_panel = {
					{ "n", "q", actions.close, { desc = label("Close help menu") } },
					{ "n", "<esc>", actions.close, { desc = label("Close help menu") } },
				},
			},
		})
	end,
}

return { M }
