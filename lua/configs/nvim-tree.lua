local nvim_tree = require 'nvim-tree'
local m = require 'common/map'

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
        m.map("<CR>", a.node.open.edit, opts)
        m.map("<2-LeftMouse>", a.node.open.edit, opts)
        m.map("-", a.tree.collapse_all, opts)
        m.map("z", a.tree.change_root_to_node, opts)
        m.map("<2-MiddleMouse>", a.node.open.edit, opts)
        m.map("h", a.node.open.horizontal, opts)
        m.map("v", a.node.open.vertical, opts)
        m.map("u", a.tree.change_root_to_parent, opts)
        m.map("c", a.fs.create, opts)
        m.map("r", a.fs.rename, opts)
        m.map("x", a.fs.cut, opts)
        m.map("y", a.fs.copy.node, opts)
        m.map("p", a.fs.paste, opts)
        m.map("d", a.fs.remove, opts)
    end,
    remove_keymaps = true
}

m.map('<Leader>n', '<cmd>NvimTreeToggle .<CR>', { remap = false })
