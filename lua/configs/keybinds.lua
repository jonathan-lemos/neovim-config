return function(setup)
    require 'vider/map'

    -- do not skip wrapped lines with the below commands
    noremap { 'j', "gj" }
    noremap { 'k', "gk" }
    noremap { '^', 'g^' }
    noremap { '$', 'g$' }

    -- escape from terminals with <Esc>
    tnoremap { '<Esc>', '<C-\\><C-n>' }

    -- open terminal with \t
    noremap { setup.keybinds.open_terminal, '<cmd>split | startinsert | terminal<CR>' }
end
