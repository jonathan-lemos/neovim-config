(function()
    require 'utils/require'

    require_dir 'configs'
    require 'plugins'

    require 'vider/vim'

    setopt {
        -- keep indentation of the current line to the next
        autoindent = true,

        -- if the file changes outside of neovim, automatically update the buffer
        autoread = true,

        -- ask for confirmation on :q instead of failing if buffer has changed
        confirm = true,

        -- highlight current line
        cursorline = true,

        -- set utf8 encoding as standard
        encoding = 'utf8',

        -- highlight search as i type it
        hlsearch = true,

        -- web browser like searches
        incsearch = true,

        -- blink the matching bracket
        mat = 2,

        -- allow use of the mouse in all modes
        mouse = 'a',

        -- show line number
        number = true,

        -- keep current line in center of screen
        scrolloff = 999,

        -- show the matching brace/bracket
        showmatch = true,

        -- merge the line number column and diagnostic column
        signcolumn = 'number',

        -- split below instead of above the current window
        splitbelow = true,

        -- indent based on the filetype
        smartindent = true,

        -- better command-line completion
        wildmenu = true,

        -- wrap lines
        wrap = true,
    }

    settablength(4)
    setsmartcase(true)

    colorscheme 'codedark'

    -- strip trailing whitespace on save
    vim.api.nvim_create_autocmd('BufWritePre', { command = ':%s/\\s\\+$//e' })
end)()
