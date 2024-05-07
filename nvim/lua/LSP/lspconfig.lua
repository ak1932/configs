-- Mappings.
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
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...



require 'lspconfig'.vimls.setup {
    cmd = { "vim-language-server", "--stdio" },
    filetypes = { "vim" },
    init_options = {
        diagnostic = {
            enable = true
        },
        indexes = {
            count = 3,
            gap = 100,
            projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
            runtimepath = true
        },
        isNeovim = true,
        iskeyword = "@,48-57,_,192-255,-#",
        runtimepath = "",
        suggest = {
            fromRuntimepath = true,
            fromVimruntime = true
        },
        vimruntime = ""
    },
    single_file_support = { true },
}

require 'lspconfig'.clangd.setup {
    cmd = {
        "/usr/bin/clangd",
        "--background-index",
        "--query-driver=/home/ak/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-gcc*,/home/ak/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-g++*,xtensa-esp32-elf-gcc*,xtensa-esp32-elf-g++*",
        "--log=verbose",
    },
}

require 'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("lua", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

require 'lspconfig'.arduino_language_server.setup {
    on_attach = on_attach,
    cmd = {
        "/home/ak/go/bin/arduino-language-server",
        "-cli-config", "/home/ak/.arduino15/arduino-cli.yaml",
        "-clangd", "/usr/bin/clangd",
        "-cli", "/usr/bin/arduino-cli",
        "-fqbn", "esp32:esp32:esp32doit-devkit-v1"
        -- "-fqbn", "arduino:avr:uno"

    },
    capabilities = {
        textDocument = {
            callHierarchy = {
                dynamicRegistration = false
            },
            codeAction = {
                codeActionLiteralSupport = {
                    codeActionKind = {
                        valueSet = { "", "quickfix", "refactor", "refactor.extract", "refactor.inline",
                            "refactor.rewrite", "source", "source.organizeImports" }
                    }
                },
                dataSupport = true,
                dynamicRegistration = false,
                isPreferredSupport = true,
                resolveSupport = {
                    properties = { "edit" }
                }
            },
            completion = {
                completionItem = {
                    commitCharactersSupport = false,
                    deprecatedSupport = false,
                    documentationFormat = { "markdown", "plaintext" },
                    preselectSupport = false,
                    snippetSupport = false
                },
                completionItemKind = {
                    valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
                        25 }
                },
                contextSupport = false,
                dynamicRegistration = false
            },
            declaration = {
                linkSupport = true
            },
            definition = {
                linkSupport = true
            },
            documentHighlight = {
                dynamicRegistration = false
            },
            documentSymbol = {
                dynamicRegistration = false,
                hierarchicalDocumentSymbolSupport = true,
                symbolKind = {
                    valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
                        25, 26 }
                }
            },
            hover = {
                contentFormat = { "markdown", "plaintext" },
                dynamicRegistration = false
            },
            implementation = {
                linkSupport = true
            },
            publishDiagnostics = {
                relatedInformation = true,
                tagSupport = {
                    valueSet = { 1, 2 }
                }
            },
            references = {
                dynamicRegistration = false
            },
            rename = {
                dynamicRegistration = false,
                prepareSupport = true
            },
            semanticTokens = vim.NIL,
            signatureHelp = {
                dynamicRegistration = false,
                signatureInformation = {
                    activeParameterSupport = true,
                    documentationFormat = { "markdown", "plaintext" },
                    parameterInformation = {
                        labelOffsetSupport = true
                    }
                }
            },
            synchronization = {
                didSave = true,
                dynamicRegistration = false,
                willSave = true,
                willSaveWaitUntil = true
            },
            typeDefinition = {
                linkSupport = true
            }
        },
        window = {
            showDocument = {
                support = true
            },
            showMessage = {
                messageActionItem = {
                    additionalPropertiesSupport = false
                }
            },
            workDoneProgress = true
        },
        workspace = {
            applyEdit = true,
            configuration = true,
            didChangeWatchedFiles = {
                dynamicRegistration = false,
                relativePatternSupport = true
            },
            semanticTokens = vim.NIL,
            symbol = {
                dynamicRegistration = false,
                hierarchicalWorkspaceSymbolSupport = true,
                symbolKind = {
                    valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
                        25, 26 }
                }
            },
            workspaceEdit = {
                resourceOperations = { "rename", "create", "delete" }
            },
            workspaceFolders = true
        }
    }
}

require 'lspconfig'.bashls.setup {}

require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {}
    }
}

require 'lspconfig'.asm_lsp.setup {}
require 'lspconfig'.tailwindcss.setup {
    settings = {
        {
            tailwindCSS = {
                classAttributes = { "class", "className", "class:list", "classList", "ngClass", ".*Style*" },
                lint = {
                    cssConflict = "warning",
                    invalidApply = "error",
                    invalidConfigPath = "error",
                    invalidScreen = "error",
                    invalidTailwindDirective = "error",
                    invalidVariant = "error",
                    recommendedVariantOrder = "warning"
                },
                validate = true
            }
        } }
}
-- require 'lspconfig'.eslint.setup({
--     on_attach = function(client, bufnr)
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             buffer = bufnr,
--             command = "EslintFixAll",
--         })
--     end,
-- })
require("flutter-tools").setup {} -- use defaults
require 'lspconfig'.jdtls.setup {}
require 'lspconfig'.gdscript.setup {}
require 'lspconfig'.texlab.setup {}
require 'lspconfig'.emmet_language_server.setup({})
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require 'lspconfig'.html.setup {
    capabilities = capabilities,
} -- require 'lspconfig'.bufls.setup({
--     cmd = { vim.env.HOME .. "/go/bin/bufls", "serve" },
-- }
-- )
