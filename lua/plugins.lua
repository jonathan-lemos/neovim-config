-- auto install packer if not already installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return function(setup)
    require('packer').startup(function(use)
        -- package manger
        use 'wbthomason/packer.nvim'

        -- configs for a bunch of lsps
        use 'neovim/nvim-lspconfig'

        -- LSP installer
        use 'williamboman/mason.nvim'

        -- integrate mason and lspconfig
        use 'williamboman/mason-lspconfig.nvim'

        -- fuzzy finder for filenames/strings/whatnot
        use {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            requires = {
                'nvim-lua/popup.nvim',
                'nvim-lua/plenary.nvim',
                { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
            }
        }

        -- better syntax highlighting
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        -- status bar at bottom
        use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

        -- paste in boilerplate snippets
        use 'SirVer/ultisnips'

        -- standard set of snippets
        use 'honza/vim-snippets'

        -- completion engine
        use {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-cmdline', -- command line
                'hrsh7th/cmp-buffer', -- buffer completions
                'hrsh7th/cmp-nvim-lua', -- nvim config completions
                'hrsh7th/cmp-nvim-lsp', -- lsp completions
                'hrsh7th/cmp-path', -- file path completions
                'quangnguyen30192/cmp-nvim-ultisnips', -- snippets completions
            }
        }

        -- nerdtree w/ lsp support
        use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

        -- diagnostic window
        use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }

        -- easymotion but better
        use { 'phaazon/hop.nvim', branch = 'v2' }

        -- highlight the word under the cursor
        use 'itchyny/vim-cursorword'

        -- indent guides
        use 'lukas-reineke/indent-blankline.nvim'

        -- surround blocks of text with delimeters
        use 'kylechui/nvim-surround'

        -- automatically put matching brace/bracket/paren
        use 'windwp/nvim-autopairs'

        -- automatically change the opposite HTML tag
        use 'windwp/nvim-ts-autotag'

        -- colorscheme similar to vscode dark
        use 'tomasiser/vim-code-dark'

        -- tabline for vim buffers
        use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons' }

        -- startup screen
        use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

        setup.add_plugins(use)

        if packer_bootstrap then
            require('packer').sync()
        end
    end)
end
