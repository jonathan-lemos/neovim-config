return function(setup)
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    require 'vider/map'

    telescope.setup {
        defaults = {
            mappings = {
                i = {
                    ["<ESC>"] = actions.close,
                }
            }
        }
    }

    noremap { setup.keybinds.find_files, '<cmd> Telescope find_files<CR>' }
    noremap { setup.keybinds.live_grep, '<cmd> Telescope live_grep<CR>' }
end
