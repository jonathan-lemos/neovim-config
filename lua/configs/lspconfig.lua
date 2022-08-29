return function(setup)
    local lspconfig = require 'lspconfig'
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    require 'vider/map'
    local tb = require 'telescope.builtin'

    -- mason installs LSP's for lspconfig, so i include its setup here
    mason.setup {}

    -- auto install HLS if it's not already installed
    mason_lspconfig.setup {
        ensure_installed = { "hls" }
    }

    local lsp_defaults = {
        flags = {
            debounce_text_changes = 50,
        },
        capabilities = require('cmp_nvim_lsp').update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        ),
        on_attach = function(client, bufnr)
            vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })

            noremap { setup.keybinds.ide.goto_implementation, tb.lsp_implementations, bufnr = bufnr }

            noremap { setup.keybinds.ide.goto_definition, tb.lsp_definitions, bufnr = bufnr }

            noremap { setup.keybinds.ide.goto_references, tb.lsp_references, bufnr = bufnr }

            noremap { setup.keybinds.ide.format, vim.lsp.buf.formatting, bufnr = bufnr }

            noremap { setup.keybinds.ide.suggestion, vim.lsp.buf.code_action, bufnr = bufnr }

            noremap { setup.keybinds.ide.rename, vim.lsp.buf.rename, bufnr = bufnr }
        end
    }

    lspconfig.util.default_config = vim.tbl_deep_extend(
        'force',
        lspconfig.util.default_config,
        lsp_defaults
    )

    -- set up HLS (haskell)
    lspconfig.hls.setup {
        settings = {
            haskell = {
                formattingProvider = 'fourmolu'
            }
        }
    }

    -- set up LTeX grammar checker
    lspconfig.ltex.setup {}

    -- set up markdown linter
    lspconfig.marksman.setup {}

    -- set up sumneko's lua-language-server
    lspconfig.sumneko_lua.setup {
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
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    }

    lspconfig.solidity_ls.setup {}
end
