return function(setup)
    local cmp = require 'cmp'

    cmp.setup {
        snippet = {
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            [setup.keybinds.ide.completion_docs_prev] = cmp.mapping.scroll_docs(-4),
            [setup.keybinds.ide.completion_docs_next] = cmp.mapping.scroll_docs(4),
            [setup.keybinds.ide.completion_confirm] = cmp.mapping.confirm({ select = true }),
            [setup.keybinds.ide.completion_menu_next] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            [setup.keybinds.ide.completion_menu_prev] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'ultisnips' },
            { name = 'buffer' },
        })
    }

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
end
