local bufferline = require 'bufferline'
require 'vider/vim'
require 'vider/map'

setopt { termguicolors = true }

bufferline.setup {
    options = {
        numbers = "buffer_id",
        offsets = {
            {
                filetype = "NvimTree",
                text = "NvimTree",
                highlight = "Directory",
                text_align = "left"
            }
        }
    }
}

noremap { "<Leader>bp", "<cmd> BufferLinePick<CR>" }
noremap { "<Leader>bq", "<cmd> bd<CR>" }
noremap { "<Leader>bi", "<cmd> %bd|e#|bd#<CR>" }
