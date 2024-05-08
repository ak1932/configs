-- Snippets
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

vim.g.mapleader = " "
-- " setup mapping to call :LazyGit

-- vim.api.nvim_set_keymap("n", "bq", "<cmd>bdelete!<CR>",{})

-- Press F5 to run python script into separate term window
vim.api.nvim_set_keymap("n", "<F5>", ":call Run() <CR>", {})
vim.api.nvim_set_keymap("i", "jk", "<ESC>", {})
vim.api.nvim_set_keymap("t", "jk", "<ESC>", {})

-- Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
vim.api.nvim_set_keymap("n", "<A-S-j>", "m`:silent +g/\\m^\\s*$/d<CR>``:noh<CR>", {})
vim.api.nvim_set_keymap("n", "<A-S-k>", "m`:silent -g/\\m^\\s*$/d<CR>``:noh<CR>", {})
vim.api.nvim_set_keymap("n", "<A-j>", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", {})
vim.api.nvim_set_keymap("n", "<A-k>", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", {})

-- Search through all projects
vim.api.nvim_set_keymap("n", "<leader>P", ":Telescope projects<CR>", {})

-- Use Y to copy rest of the line
vim.api.nvim_set_keymap("n", "Y", "y$", {})

-- keeping cursor in center of screen when moving around finds
vim.api.nvim_set_keymap("n", "n", "nzzzv", {})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {})

-- Delete text in visual mode and paste
vim.api.nvim_set_keymap("v", "p", "\"_dP", {})

-- Get out of terminal mode
vim.api.nvim_set_keymap("t", "<ESC>", "<c-\\><c-n>", {})
vim.api.nvim_set_keymap("t", "<F5>", "<cmd>q<CR>", {})


-- Resizing windows
vim.api.nvim_set_keymap("n", "<C-h>", ":vert resize -1<CR>", {})
vim.api.nvim_set_keymap("n", "<C-l>", ":vert resize +1<CR>", {})
vim.api.nvim_set_keymap("n", "<C-j>", ":resize -1<CR>", {})
vim.api.nvim_set_keymap("n", "<C-k>", ":resize +1<CR>", {})

vim.api.nvim_set_keymap("n", "<leader>/", "/(Search Highlight Removed)<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>IBLToggle<CR>", {})

--  Arduino
vim.api.nvim_set_keymap("n", "<leader>aa", "<cmd>ArduinoAttach<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>am", "<cmd>ArduinoVerify<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>au", "<cmd>ArduinoUpload<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ad", "<cmd>ArduinoUploadAndSerial<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ab", "<cmd>ArduinoChooseBoard<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ap", "<cmd>ArduinoChooseProgrammer<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>as", "<cmd>ArduinoSerial<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>aq", "<ESC>i<C-a>\\y:q<CR>", {})
