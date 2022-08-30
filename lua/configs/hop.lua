return function(setup)
    local hop = require 'hop'
    local hd = require 'hop.hint'.HintDirection
    require 'vider/map'

    hop.setup {}

    noremap {
        setup.keybinds.hop.forward_1_sameline,
        function()
            hop.hint_char1 {
                direction = hd.AFTER_CURSOR,
                current_line_only = true
            }
        end
    }

    noremap {
        setup.keybinds.hop.backward_1_sameline,
        function()
            hop.hint_char1 {
                direction = hd.BEFORE_CURSOR,
                current_line_only = true
            }
        end
    }

    noremap {
        setup.keybinds.hop.bidirectional_1,
        function() hop.hint_char1 {} end
    }

    noremap {
        setup.keybinds.hop.hop_pattern,
        function() hop.hint_patterns {} end
    }
end
