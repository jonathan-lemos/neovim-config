local telescope = require 'telescope'
local m = require 'common/map'

telescope.setup {}

m.map('<Leader>ff', '<cmd> Telescope find_files<CR>')
m.map('<Leader>fg', '<cmd> Telescope live_grep<CR>')
m.map('<Leader>fb', '<cmd> Telescope buffers<CR>')
