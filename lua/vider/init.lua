require 'utils/table'

local default_setup = {
    keybinds = {
        find_files = '<Leader>f',
        hop = {
            forward_1_sameline = 'f',
            backward_1_sameline = 'F',
            bidirectional_1_sameline = nil,
            bidirectional_1 = 's',
            hopanywhere = 'S',
        },
        ide = {
            -- paste the current selection in the completion window
            completion_confirm = '<CR>',
            -- if the current function has documentation, scroll up
            completion_docs_back = '<C-b>',
            -- if the current function has documentation, scroll down
            completion_docs_next = '<C-w>',
            -- go to the next completion possibility
            completion_menu_next = '<Tab>',
            -- go to the previous completion possibility
            completion_menu_prev = '<S-Tab>',
            -- goto definition
            goto_definition = 'gd',
            -- goto implementation
            goto_implementation = 'gi',
            -- goto references
            goto_references = 'gr',
            -- format the current buffer
            format = '<Leader>i',
            -- rename the symbol under the cursor
            rename = '<Leader>r',
            -- show the current LSP diagnostics on the bottom
            show_errors = '<Leader>e',
            -- perform the LSP code action. if there are multiple, a menu will be shown allowing you to choose one
            suggestion = '<Leader>c',
        },
        live_grep = '<Leader>g',
        nvim_tree = {
            collapse_all = '-',
            copy = 'y',
            create = 'c',
            cut = 'x',
            delete = 'd',
            expand = { '<CR>', '<LeftMouse>' },
            horizontal_split = 'h',
            goto_parent = 'u',
            paste = 'p',
            rename = 'r',
            set_root = 'z',
            toggle = '<Leader>n',
            vertical_split = 'v',
        },
        open_terminal = '<Leader>t',
        stop_highlighting = '<Space>',
        surround = '<Leader>s',
        word_wrap = true
    }
}

return function(setup)
    setup = merge(default_setup, setup)

    require 'utils/require'

    require_dir('configs')(setup)

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
end
