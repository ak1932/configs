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

  extensions = {},
}
require('telescope').load_extension('projects')
