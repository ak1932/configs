-- IndentBlankline

vim.opt.listchars:append "space:⋅"
require("ibl").setup()
require('Comment').setup()

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
