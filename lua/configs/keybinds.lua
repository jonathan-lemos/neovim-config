-- this is for keybinds that are not part of any plugin. use the plugin's specific .lua to manage its keybinds

local m = require 'common/map'

-- stop highlighting by pressing space
m.map('<Space>', '<cmd> nohl<CR>', { remap = false })
-- do not skip wrapped lines with the below commands
m.map('j', "gj", { remap = false })
m.map('k', "gk", { remap = false })
m.map('^', 'g^', { remap = false })
m.map('$', 'g$', { remap = false })
-- escape from terminals with <Esc>
m.tmap('<Esc>', '<C-\\><C-n>')
-- open terminal with \t
m.map('<Leader>t', '<cmd>split | startinsert | terminal<CR>')
