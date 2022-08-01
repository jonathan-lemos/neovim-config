local hop = require 'hop'
local m = require 'common/map'

hop.setup {}

m.map('s', '<cmd>lua require"hop".hint_char1{}<CR>')
m.map('S', '<cmd>lua require"hop".hint_patterns{}<CR>')
