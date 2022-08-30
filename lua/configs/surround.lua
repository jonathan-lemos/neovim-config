return function(setup)
    local surround = require 'nvim-surround'

    surround.setup {
        keymaps = {
            visual = setup.keybinds.surround,
            visual_line = setup.keybinds.surround,
        }
    }
end
