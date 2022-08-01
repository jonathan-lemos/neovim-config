local trouble = require 'trouble'
local m = require 'common/map'

trouble.setup {}

m.map('<Leader>e', '<cmd>TroubleToggle<CR>')
