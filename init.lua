require('vider').setup {
    add_plugins = function(use)
        -- haskell syntax highlighting
        use 'neovimhaskell/haskell-vim'

        -- solidity syntax highlighting
        use 'tomlion/vim-solidity'
    end,
    lsps = {
        clangd = {},
        dartls = {},
        elixirls = {},
        eslint = {},
        hls = {
            settings = {
                haskell = {
                    formattingProvider = 'fourmolu'
                }
            }
        },
        racket_langserver = {},
        rust_analyzer = {},
        terraformls = {},
        tsserver = {},
        solidity_ls = {}
    },
    use_vimrc = false
}

require 'vider/map'

-- stop highlighting by pressing space
noremap { '<Space>', '<cmd> nohl<CR>' }
