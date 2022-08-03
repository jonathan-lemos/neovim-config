-- sets the color scheme
colorscheme = function(s)
    vim.cmd('colorscheme ' .. s)
end

-- sets each key to its value, e.g. { scrolloff = 999, number = true }
setopt = function(o)
    for k, v in pairs(o) do
        vim.opt[k] = v
    end
end

-- sets ignorecase/smartcase to 'b'
setsmartcase = function(b)
    setopt {
        ignorecase = b,
        smartcase = b
    }
end

-- sets the tab length to 'l' spaces
settablength = function(l)
    setopt {
        tabstop = l,
        shiftwidth = l,
        softtabstop = l,
        expandtab = true
    }
end

