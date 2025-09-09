require("mason").setup()
require("mason-lspconfig").setup()


require("flutter-tools").setup {} -- use defaults

-- require("dapui").setup()
-- require ('mason-nvim-dap').setup({
--     handlers = {
--         function(config)
--           -- all sources with no handler get passed here
--
--           -- Keep original functionality
--           require('mason-nvim-dap').default_setup(config)
--         end,
--         python = function(config)
--             config.adapters = {
-- 	            type = "executable",
-- 	            command = "/usr/bin/python3",
-- 	            args = {
-- 		            "-m",
-- 		            "debugpy.adapter",
-- 	            },
--             }
--             require('mason-nvim-dap').default_setup(config) -- don't forget this!
--         end,
--     },
-- })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
    })
end
require('ufo').setup()


-- require("mason-lspconfig").setup_handlers {
--     -- The first entry (without a key) will be the default handler
--     -- and will be called for each installed server that doesn't have
--     -- a dedicated handler.
--     function(server_name) -- default handler (optional)
--         require("lspconfig")[server_name].setup {}
--     end,
--     -- Next, you can provide a dedicated handler for specific servers.
--     -- For example, a handler override for the `rust_analyzer`:
--     ["clangd"] = function()
--         require 'lspconfig'.clangd.setup {
--             cmd = {
--                 "/usr/bin/clangd",
--                 "--fallback-style=webkit",
--                 "--background-index",
--                 "--query-driver=/home/ak/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-gcc*,/home/ak/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-g++*,xtensa-esp32-elf-gcc*,xtensa-esp32-elf-g++*",
--                 "--log=verbose",
--             },
--
--         }
--     end,
--     ["lua_ls"] = function()
--         require 'lspconfig'.lua_ls.setup {
--             settings = {
--                 Lua = {
--                     runtime = {
--                         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                         version = 'LuaJIT',
--                     },
--                     diagnostics = {
--                         -- Get the language server to recognize the `vim` global
--                         globals = { 'vim' },
--                     },
--                     workspace = {
--                         -- Make the server aware of Neovim runtime files
--                         library = vim.api.nvim_get_runtime_file("lua", true),
--                     },
--                     -- Do not send telemetry data containing a randomized but unique identifier
--                     telemetry = {
--                         enable = false,
--                     },
--                 },
--             },
--         }
--     end,
--
--     ["arduino_language_server"] = function()
--         require 'lspconfig'.arduino_language_server.setup {
--             on_attach = on_attach,
--             cmd = {
--                 "/home/ak/go/bin/arduino-language-server",
--                 "-cli-config", "/home/ak/.arduino15/arduino-cli.yaml",
--                 "-clangd", "/usr/bin/clangd",
--                 "-cli", "/usr/bin/arduino-cli",
--                 "-fqbn", "esp32:esp32:esp32doit-devkit-v1"
--                 -- "-fqbn", "arduino:avr:uno"
--
--             },
--         }
--     end,
--
--     ["tailwindcss"] = function()
--         require 'lspconfig'.tailwindcss.setup {
--             settings = {
--                 {
--                     tailwindCSS = {
--                         classAttributes = { "class", "className", "class:list", "classList", "ngClass", ".*Class" },
--                         lint = {
--                             cssConflict = "warning",
--                             invalidApply = "error",
--                             invalidConfigPath = "error",
--                             invalidScreen = "error",
--                             invalidTailwindDirective = "error",
--                             invalidVariant = "error",
--                             recommendedVariantOrder = "warning"
--                         },
--                         validate = true
--                     }
--                 }
--             }
--         }
--     end
-- }
