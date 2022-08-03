-- this is for keybinds that are not part of any plugin. use the plugin's specific .lua to manage its keybinds

require 'vider/map'

-- stop highlighting by pressing space
noremap{'<Space>', '<cmd> nohl<CR>'}
-- do not skip wrapped lines with the below commands
noremap{'j', "gj"}
noremap{'k', "gk"}
noremap{'^', 'g^'}
noremap{'$', 'g$'}
-- escape from terminals with <Esc>
tnoremap{'<Esc>', '<C-\\><C-n>'}
-- open terminal with \t
noremap{'<Leader>t', '<cmd>split | startinsert | terminal<CR>'}
