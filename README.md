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

You can format the current buffer with `<Leader>i` or the `keybinds.ide.format` option which you control as follows:

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
| Expand folder/Open in new buffer | `keybinds.nvim_tree.expand` | `<CR>`/`<LeftMouse>` |
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

### Telescope

You can find

## New keybinds
All keybinds below are configurable

### Hop keybinds
| Keybind | Description |
|---------|-------------|
|`s`|type a character, hop to a selected occurrence of it|
|`S`|type a regex, hit enter, hop to a selected occurrence of it|

## LSP keybinds
| Keybind | Description |
|---------|-------------|
|`gd`|go to definition|
|`gi`|go to implementation|
|`gr`|go to references|
|`<Leader>c`|apply code action (auto-fix)|
|`<Leader>i`|format current buffer|
|`<Leader>e`|open diagnostic window below|

## NvimTree keybinds
| Keybind | Description |
|---------|-------------|
|`<Leader>n`|Open/Close the tree|
|`<CR>`/Double Click|Expand or collapse folder/open file in new buffer|
|`d`|delete file|
|`h`|open file in horizontal split|
|`p`|paste file|
|`r`|rename file|
|`u`|set root to `..`|
|`v`|open file in vertical split|
|`x`|cut file|
|`y`|copy file|
|`z`|set root to cursor|
|`-`|collapse all|

## Misc keybinds
| Keybind | Description |
|---------|-------------|
|`<Space>`|stop highlighting|
|`<Leader>t`|open terminal in horizontal split|

## Surround keybinds
| Keybind | Description |
|---------|-------------|
|`<Leader>s`|Type character, surround selected (visual mode) text with that type of char|

## Telescope keybinds
| Keybind | Description |
|---------|-------------|
|`<Leader>ff`|Fuzzy find files in current directory|
|`<Leader>fg`|Fuzzy grep file contents in current directory|
|`<Leader>fb`|Fuzzy grep currently open buffers|
