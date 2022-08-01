local bufferline = require 'bufferline'
local opt = require 'common/opt'
local m = require 'common/map'

opt.set { termguicolors = true }

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

m.map("<Leader>bp", "<cmd> BufferLinePick<CR>")
m.map("<Leader>bq", "<cmd> bd<CR>")
m.map("<Leader>bi", "<cmd> %bd|e#|bd#<CR>")
