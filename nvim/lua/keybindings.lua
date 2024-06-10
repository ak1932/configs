-- File browser in buffer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
--
vim.api.nvim_set_keymap("n", "<leader>dt", ":DapUiToggle<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap = true})

vim.g.mapleader = " "

-- Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
vim.api.nvim_set_keymap("n", "<A-S-j>", "m`:silent +g/\\m^\\s*$/d<CR>``:noh<CR>", {})
vim.api.nvim_set_keymap("n", "<A-S-k>", "m`:silent -g/\\m^\\s*$/d<CR>``:noh<CR>", {})
vim.api.nvim_set_keymap("n", "<A-j>", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", {})
vim.api.nvim_set_keymap("n", "<A-k>", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", {})

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

-- snippets keybindings
local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- Telescope
-- Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Telescope find_files<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>Telescope help_tags<cr>", {})


-- Search through all projects
vim.api.nvim_set_keymap("n", "<leader>P", ":Telescope projects<CR>", {})

-- Tmux movements keybindings
require 'nvim-tmux-navigation'.setup {
    disable_when_zoomed = true, -- defaults to false
    keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
    }
}
