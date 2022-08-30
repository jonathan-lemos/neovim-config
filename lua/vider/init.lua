require 'utils/table'

local default_setup = {
    -- add plugins using packer.nvim's use function
    add_plugins = function(use) end,
    custom_lsps = {},
    keybinds = {
        find_files = '<Leader>f',
        hop = {
            forward_1_sameline = nil,
            backward_1_sameline = nil,
            bidirectional_1 = 's',
            hop_pattern = 'S',
        },
        ide = {
            -- paste the current selection in the completion window
            completion_confirm = '<CR>',
            -- if the current function has documentation, scroll up
            completion_docs_prev = '<C-b>',
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
        -- select a region of text in visual mode, press this combination and a character to surround with that type of character.
        -- e.g. '<Leader>s(' will surround the current selection with parentheses
        surround = '<Leader>s',
    },
    -- which LSP's to enable
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls for the full list
    -- set an lsp to nil in init.lua to disable it
    lsps = {
        bashls = {},
        cssls = {},
        dockerls = {},
        emmet_ls = {},
        html = {},
        jedi_language_server = {},
        jsonls = {},
        ltex = {},
        marksman = {},
        pyright = {},
        sumneko_lua = {
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        },
        vimls = {},
        yamlls = {}
    },
    -- {keybind, button title, command}
    menu_entries = function()
        return {
            { "e", "New file", "<cmd>ene <CR>" },
            { "f", "Search by filename", "<cmd>Telescope find_files<CR>" },
            { "i", "Search by file content", "<cmd>Telescope live_grep<CR>" }
        }
    end,
    -- source the vimscript at ~/.vimrc
    use_vimrc = true,
}

return function(setup)
    setup = deepmerge(default_setup, setup)

    require 'utils/require'

    require_dir('configs')(setup)

    require('plugins')(setup)

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

    if setup.use_vimrc then
        vim.cmd 'source ~/.vimrc'
    end
end
