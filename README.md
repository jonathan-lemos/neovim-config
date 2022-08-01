# NeoVim Config

This repository is really just meant to hold my NeoVim config. It's not meant to be particularly usable to others, but you're welcome to take a look.

## Bufferline keybinds
| Keybind | Description |
|---------|-------------|
|`<Leader>bp`|hop to a buffer|
|`<Leader>bq`|quit current buffer|
|`<Leader>bi`|close all buffers but the current one

## Hop keybinds
| Keybind | Description |
|---------|-------------|
|`s`|type a character, hop to a selected occurence of it|
|`S`|type a regex, hit enter, hop to a selected occurence of it|

## LSP keybinds
| Keybind | Description |
|---------|-------------|
|`gi`|go to implementation|
|`gd`|go to definition|
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
