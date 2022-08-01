-- sets all of the vim pairs in the object
local setopt = function(o)
    for k, v in pairs(o) do
        vim.opt[k] = v
    end
end

-- sets ignorecase/smartcase to 'b'
local setsmartcase = function(b)
    setopt {
        ignorecase = b,
        smartcase = b
    }
end

-- sets the tab length to 'l' spaces
local settablength = function(l)
    setopt {
        tabstop = l,
        shiftwidth = l,
        softtabstop = l,
        expandtab = true
    }
end

return {
    set = setopt,
    setsmartcase = setsmartcase,
    settablength = settablength
}
