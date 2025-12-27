-- File browser in buffer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Folding using ufo
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- neotree
vim.api.nvim_set_keymap("n", "<leader>t", ":Neotree toggle<CR>", { noremap = true })

--
vim.api.nvim_set_keymap("n", "<leader>dt", ":DapUiToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })


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

local telescope_builtin = require('telescope.builtin')
-- Telescope
-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<leader>fcf", function()
  local cwd = vim.fn.expand("%:p:h")
  telescope_builtin.find_files({ cwd = cwd })
end, { desc = "Live grep in buffer's directory" })

vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set("n", "<leader>fcg", function()
  local cwd = vim.fn.expand("%:p:h")
  telescope_builtin.live_grep({ cwd = cwd })
end, { desc = "Live grep in buffer's directory" })

vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>fk', telescope_builtin.keymaps, { desc = 'Telescope keymaps' })
vim.keymap.set('n', '<leader>fm', telescope_builtin.man_pages, { desc = 'Telescope man pages' })

vim.keymap.set('n', '<leader>rg', telescope_builtin.registers, { desc = 'Telescope man pages' })

vim.keymap.set('n', '<leader>gr', telescope_builtin.lsp_references, { desc = 'Telescope LSP references' })
vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, { desc = 'Telescope lsp definitions'})

-- Gitsigns
-- Git actions
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gN", "<cmd>Gitsigns prev_hunk<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<cr>", {})


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

vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

-- LSP keybindings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--

vim.diagnostic.config({ severity_sort = true })


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
-- Enable completion triggered by <c-x><c-o>
-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
