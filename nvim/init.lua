require "plugins.plugins"

-- snippets
require "snippets"
-- settings
require "settings"
require "keybindings"

-- plugins
require "plugins.telescope_config"
require "plugins.treesitter_config"
require "plugins.lualine_config"
require "plugins.other_plugins_config"

-- LSP
require "LSP.lspconfig"
require "LSP.compe"

vim.cmd("colorscheme catppuccin-macchiato")
vim.api.nvim_create_autocmd("VimEnter", {pattern = "*", command = "silent exec '!kill -s SIGWINCH $PPID'"}) -- For correct resizing during startup

-- vim.api.nvim_set_hl(0, 'Comment',{cterm = {'italic'}})
vim.cmd([[
    hi Comment cterm=italic
    hi Pmenu ctermbg=NONE ctermfg=5
    hi TabLineFill guifg=bg
]])
