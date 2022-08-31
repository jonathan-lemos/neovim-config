return function(setup)
    local nvim_tree = require 'nvim-tree'
    require 'vider/map'

    nvim_tree.setup {
        diagnostics = {
            enable = true,
            show_on_dirs = true
        },
        -- keep the cursor on the first character of the filename
        hijack_cursor = true,
        on_attach = function(bufnr)
            local a = require 'nvim-tree.api'
            local opts = { buffer = bufnr, remap = false }
            noremap { setup.keybinds.nvim_tree.expand, a.node.open.edit, opts }
            noremap { "-", a.tree.collapse_all, opts }
            noremap { "z", a.tree.change_root_to_node, opts }
            noremap { "h", a.node.open.horizontal, opts }
            noremap { "v", a.node.open.vertical, opts }
            noremap { "u", a.tree.change_root_to_parent, opts }
            noremap { "c", a.fs.create, opts }
            noremap { "r", a.fs.rename, opts }
            noremap { "x", a.fs.cut, opts }
            noremap { "y", a.fs.copy.node, opts }
            noremap { "p", a.fs.paste, opts }
            noremap { "d", a.fs.remove, opts }
        end,
        remove_keymaps = true
    }

    noremap { '<Leader>n', '<cmd>NvimTreeToggle .<CR>' }
end
