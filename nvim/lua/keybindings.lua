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

-- Snippets tab functionality
local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_next_item()
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    else
        cmp.complete()
    end
    return ""
end
_G.s_tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    else
        return t "<S-Tab>"
    end
    return ""
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

