local mmf = function(modes)
    return function(from, to, opts)
        if opts == nil then
            opts = {}
        end

        local default_opts = { silent = true }
        for k, v in pairs(opts) do
            default_opts[k] = v
        end

        return vim.keymap.set(modes, from, to, default_opts)
    end
end

return {
    map = mmf(''),
    lmap = mmf('l'),
    cmap = mmf('c'),
    tmap = mmf('t')
}
