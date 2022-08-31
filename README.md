# Neovim Config

A batteries-included Neovim config that tries to respect Vim defaults as much as possible.

## Dependencies

* Neovim 0.7+
* git
* wget or curl
* Python 3 and [pynvim](https://github.com/neovim/pynvim)

## Installation

Make sure your system has the dependencies listed above.

Copy the `lua/` directory into `~/.config/nvim/`.

Then create `~/.config/nvim/init.lua` with the following contents:

```lua
require('vider').setup {
    -- your options here
}
```

## Features

### IDE features

This config includes IDE support (completion, diagnostics, formatting, code fixes) for several file types out of the box:

* Bash (bashls)
* CSS (cssls, emmet_ls)
* Dockerfile (dockerls)
* HTML (html, emmet_ls)
* JSON (jsonls)
* Lua (sumneko_lua)
* Markdown (marksman)
* Python (jedi_language_server, pyright)
* Vimscript (vimls)
* YAML (yamlls)

If a given language server is not installed on your system, this config will automatically install it for you.

Support for other languages can be [configured](#install-ide-support-for-other-languages), and their appropriate language servers will also be installed automatically (if not already installed).

#### Installing IDE support for other languages

Find the server you want to install [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html).
Then, add the appropriate LSP setup object to the `lsps` setup option.

For example, if you want to set up the [Haskell Language Server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html), you can do so like
```lua
require('vider').setup {
    lsps = {
        hls = {}
    }
}
```

If you want to pass a setup object to the LSP configuration, you can do so as follows

```lua
require('vider').setup {
    lsps = {
        hls = {
            settings = {
                haskell = {
                    formattingProvider = 'fourmolu'
                }
            }
        }
    }
}
```

Multiple language servers by passing multiple keys to the `lsps` object as follows:

```lua
require('vider').setup {
    lsps = {
        clangd = {},
        hls = {}
    }
}
```

#### Disabling a built-in language server.

Find the appropriate language server(s) in [the list above](#ide-features) and set it to `nil` in the `lsps` object.

For example: to disable the `sumneko_lua` server for Lua:

```lua
require('vider').setup {
    lsps = {
        sumneko_lua = nil
    }
}
```

#### Showing all diagnostics at the bottom like VSCode

A window at the bottom showing all current diagnostics can be toggled with `<Leader>e` or through a bind you configure through `keybinds.ide.show_errors` like follows:

```lua
require('vider').setup {
    keybinds = {
        ide = {
            show_errors = '<C-e>'
        }
    }
}
```

#### IDE controls

The remaining IDE controls are as follows
| Action | Option | Default |
|--------|--------|---------|
| Confirm completion | `keybinds.ide.completion_confirm` | `<CR>`
| Scroll up in completion docs | `keybinds.ide.completion_docs_prev` | `<C-b>`
| Scroll down in completion docs | `keybinds.ide.completion_docs_next` | `<C-w>`
| Completion menu next item | `keybinds.ide.copmletion_menu_next` | `<Tab>`
| Completion menu previous item | `keybinds.ide.copmletion_prev_next` | `<S-Tab>`
| Goto definition | `keybinds.ide.goto_definition` | `gd`
| Goto implementation | `keybinds.ide.goto_implementation` | `gi`
| Goto references | `keybinds.ide.goto_references` | `gr`
| Format | `keybinds.ide.format` | `<Leader>i`
| Rename | `keybinds.ide.rename` | `<Leader>r`
| Show errors on bottom | `keybinds.ide.show_errors` | `<Leader>e`
| Fix error under cursor | `keybinds.ide.suggestion` | `<Leader>c`

##### Changing the keybinds

For example, to change the `keybinds.ide.format` bind to `<S-i>` (Shift-I), configure as follows:

```lua
require('vider').setup {
    keybinds = {
        ide = {
            format = '<S-i>'
        }
    }
}
```

You can go to the definition of the symbol under the cursor with `gd` or the `keybinds.ide.goto_definition` bind.

You can show the current errors on the bottom with `<Leader>e` or the `keybinds.ide.show_errors` bind. Errors will be shown next to the applicable line by default.

### File Tree

A file tree can be shown/hidden by pressing `<Leader>n`. To configure this bind, use the `keybinds.nvim_tree.toggle` option like follows

```lua
require('vider').setup {
    keybinds = {
        nvim_tree = {
            toggle = '<C-n>'
        }
    }
}
```

#### File Tree Controls

You can use any of the following controls within the file tree to perform the specified action

| Action | Option | Default | Notes |
|--------|--------|---------|-------|
| Collapse all | `keybinds.nvim_tree.collapse_all` | `-` |
| Copy   | `keybinds.nvim_tree.copy` | `y` |
| Create | `keybinds.nvim_tree.create` | `c` | Leaving a trailing slash on the filename will create a directory instead of a file.
| Cut | `keybinds.nvim_tree.cut` | `x` |
| Delete | `keybinds.nvim_tree.delete` | `d` |
| Expand folder/Open in new buffer | `keybinds.nvim_tree.expand` | `<CR>`/`<2-LeftMouse>` |
| Open in horizontal split | `keybinds.nvim_tree.horizontal_split` | `h` |
| Go to parent directory | `keybinds.nvim_tree.goto_parent` | `.` |
| Paste | `keybinds.nvim_tree.paste` | `p` |
| Rename | `keybinds.nvim_tree.rename` | `r` |
| Set root to selected directory | `keybinds.nvim_tree.set_root` | `z` |
| Toggle file tree window | `keybinds.nvim_tree.toggle` | `<Leader>n` |
| Open in vertical split | `keybinds.nvim_tree.vertical_split` | `v` |

### Hop

After pressing the `s` key (or the configurable `keybinds.hop.bidirectional_1` bind), you can type one character, then all of the instances of that character will be highlighted with a red, distinct character. You type the character corresponding to the instance you want to go to, and navigation will jump there. Effectively, you can navigate to any spot in your file with only three character strokes.

You can also press `S` (or the configurable `keybinds.hop.hop_pattern` bind) to type in a regex, and all matches will be highlighted similarly to above.

### Miscellaneous

You can find files in the current directory with `<Leader>f`/`keybinds.find_files`.

You can ripgrep files in the current directory with `<Leader>g`/`keybinds.live_grep`.

You can select a region of text and surround it with parentheses, angle brackets, etc. by using `<Leader>s`/`keybinds.surround` followed by the first character to surround with.

You can open a terminal with `<Leader>t`/`keybinds.open_terminal`

## Plugins

The following plugins are already included with the config:

* wbthomason/packer.nvim
* neovim/nvim-lspconfig
* williamboman/mason.nvim
* williamboman/mason-lspconfig.nvim
* nvim-telescope/telescope.nvim
* nvim-lua/popup.nvim
* nvim-lua/plenary.nvim
* nvim-telescope/telescope-fzf-native.nvim
* nvim-treesitter/nvim-treesitter
* hoob3rt/lualine.nvim
* SirVer/ultisnips
* honza/vim-snippets
* hrsh7th/nvim-cmp
* hrsh7th/cmp-cmdline
* hrsh7th/cmp-buffer
* hrsh7th/cmp-nvim-lua
* hrsh7th/cmp-nvim-lsp
* hrsh7th/cmp-path
* quangnguyen30192/cmp-nvim-ultisnips
* kyazdani42/nvim-tree.lua
* folke/trouble.nvim
* phaazon/hop.nvim
* itchyny/vim-cursorword
* lukas-reineke/indent-blankline.nvim
* kylechui/nvim-surround
* windwp/nvim-autopairs
* windwp/nvim-ts-autotag
* tomasiser/vim-code-dark
* akinsho/bufferline.nvim
* goolord/alpha-nvim

If you would like to include a plugin not on the list, you can do so as follows:

```lua
require('vider').setup {
    add_plugins = function(use)
        use 'neovimhaskell/haskell-vim'
    end,
    -- other options
}
```

The `use` function passed in is the same one that Packer uses, so including a plugin for this config is the same process as including a plugin for Packer.

