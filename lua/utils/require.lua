require 'utils/string'
require 'utils/table'

-- requires all '.lua' files in a directory
require_dir = function(dir)
    config_dir = vim.fn.stdpath('config') .. '/lua/'
    full_dir = config_dir .. dir
    lua_filenames = filter(vim.fn.readdir(full_dir), function(n) return ends_with(n, ".lua") end)
    requires = fmap(lua_filenames, function(n) return dir .. '/' .. string.sub(n, 1, -(string.len(".lua") + 1)) end)

    for fn in values(requires) do
        require(fn)
    end
end
