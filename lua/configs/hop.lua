local hop = require 'hop'
require 'vider/map'

hop.setup {}

noremap{'s', '<cmd>lua require"hop".hint_char1{}<CR>'}
noremap{'S', '<cmd>lua require"hop".hint_patterns{}<CR>'}
