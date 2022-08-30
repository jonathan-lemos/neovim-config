return function(setup)
    local lspconfig = require 'lspconfig'
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    require 'vider/map'
    require 'utils/table'
    local tb = require 'telescope.builtin'
    local treesitter = require 'nvim-treesitter.configs'

    -- mason installs LSP's for lspconfig, so i include its setup here
    mason.setup {}

    -- auto install HLS if it's not already installed
    mason_lspconfig.setup {
        ensure_installed = keys_tolist(setup.lsps)
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

    setup_lsp = {
        haskell = function(settings)
            lspconfig.hls.setup(settings)
        end
    }

    for k, v in pairs(setup.lsps) do
        lspconfig[k].setup(v)
    end

    treesitter.setup {
        auto_install = true
    }
end
