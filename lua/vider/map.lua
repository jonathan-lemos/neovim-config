require 'utils/table'

local make_map_function = function(modes, base_opts)
    return function(t)
        return vim.keymap.set(
            modes,
            t[1],
            t[2],
            merge(base_opts, merge(t[3], { silent = true, remap = false })))
    end
end

noremap = make_map_function('')
map = make_map_function('', { remap = true })
lnoremap = make_map_function('l')
cnoremap = make_map_function('c')
tnoremap = make_map_function('t')
