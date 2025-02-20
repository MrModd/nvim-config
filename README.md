# Neovim configuration

# Requirements

Required packages to be present on the system:
* neovim
* npm
* A Nerd Font in the terminal

## Nerd Font

1. Download it from [here|https://www.nerdfonts.com/font-downloads].
2. Place the file(s) under ~/.fonts
3. Trigger a cache refresh with fc-cache -f -v
4. Switch the font of the terminal application to the Nerd Font

# Keybindings

All keybindings can be listed with CTRL-H.

The custom keybindings are prefixed to a quicker grep:
* Generic: various shortcuts, not linked to any plugin
* Neotree: file browser
* Telescope: file search and grep shortcuts
* Fugitive: git shortcuts
* nvim-lspconfig: LSP servers shortcuts
* none-lua: code formatters

# Installed plugins

## Treesitter

Syntax highlighting.
It's configured to autodownload the configurations for new languages

## Lualine

Status bar with useful information

## Fugitive

Git integration

## Gitgutter

Show git line diff in files

## Gruvbox

Colorscheme

## Local-Highlight

Highlight the words under the cursor and all its occurrences in the file

## Neotree

Show the filsystem tree and allow to open the files from the sidebar

## Telescope

File search and grep engine

## LSP servers

It's made of many plugins and external applications.
The external applications are downloaded through the plugin Mason.

### Mason

A sort of package manager for external applications

### Mason-lspconfig

An autoinstaller for LSP servers using Mason

### Nvim-lspconfig

Binding between Neovim and the LSP servers

## Formatters

Format code files using external tools

### Mason-tool-installer

Similar to Mason-lspconfig, but for whatever tool that Mason handles, not only LSP servers

### None-ls

Binding between Neovim and the formatters
