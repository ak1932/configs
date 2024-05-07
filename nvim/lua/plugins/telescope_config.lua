-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  pickers = {
    find_files = {
        file_ignore_patterns = {
            "arduino/.*/build",
            "arduino/examples/.*txt",
            "arduino/examples/.*png",
        },
        path_display = {
            shorten = {
                len=2,
                exclude={2,-1},
            },
        },
    },

    live_grep = {
        file_ignore_patterns = {
            "arduino/.*/build",
            "arduino/examples/.*txt",
            "arduino/examples/.*png",
        },
        path_display = {
            shorten = {
                len=2,
                exclude={2,-1},
            },
        },
    },
  },

  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
require('telescope').load_extension('projects')
-- Telescope
-- Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Telescope find_files<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>Telescope help_tags<cr>", {})
