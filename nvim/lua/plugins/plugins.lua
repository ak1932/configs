local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    --- LSP
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },

    -- Autocomplete
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },

    -- Snippets
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },

    {
        'alexghergh/nvim-tmux-navigation',
        config = function()
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
        end
    },

    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {}
        end
    },

    { 'elkowar/yuck.vim' },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- Arduino
    { 'stevearc/vim-arduino' },
    { 'sudar/vim-arduino-syntax' },


    -- Appearance
    { "shaunsingh/nord.nvim", lazy=false, priority=1000 },
    { "catppuccin/nvim", name = "catppuccin",lazy=false, priority = 1000 },

    { 'kyazdani42/nvim-web-devicons', lazy=false, priority=1000},

    {
        'numToStr/Comment.nvim',
        lazy = false,
    },

    { "lukas-reineke/indent-blankline.nvim" },
    { 'tpope/vim-surround' },   -- Change surrounding quotes brackets etc.
    { 'jiangmiao/auto-pairs' }, -- Auto close quotes brackets etc.

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { 'nvim-telescope/telescope-file-browser.nvim' },

    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },

    { 'nvim-lualine/lualine.nvim' },

    {
        'akinsho/flutter-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    },

    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.theta'.config)
        end
    },

    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    { "rafamadriz/friendly-snippets" },
    { 'saadparwaiz1/cmp_luasnip' },
})
