local telescope = require 'telescope'
require 'vider/map'

telescope.setup {}

noremap { '<Leader>ff', '<cmd> Telescope find_files<CR>' }
noremap { '<Leader>fg', '<cmd> Telescope live_grep<CR>' }
noremap { '<Leader>fb', '<cmd> Telescope buffers<CR>' }
