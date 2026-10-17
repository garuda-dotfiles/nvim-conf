# 💤 nvim-conf

Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim) 16.

- Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
- I follow to repo of [Craftzdog - dotfiles-public](https://github.com/craftzdog/dotfiles-public)
- Branch `production` runs on Linux and Windows; `windows-lazyvim16` is the Windows port it is based on.

## Requirements

- Neovim >= 0.11.2 built with LuaJIT (tested with 0.12)
- git, curl, a C compiler, `tree-sitter-cli`
- ripgrep, fd, fzf, lazygit
- A [Nerd Font](https://www.nerdfonts.com/) or a terminal with built-in Nerd Font symbols (kitty)
- Node.js (language servers installed by mason), Go, Rust

## Linux (Arch / Garuda)

```bash
sudo pacman -S --needed neovim tree-sitter-cli ripgrep fd fzf lazygit ttf-jetbrains-mono-nerd go

# Node.js through nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash
nvm install node && nvm alias default node

# Rust
rustup component add rust-analyzer

# Go language server (see Gopls)
go install golang.org/x/tools/gopls@latest

git clone https://github.com/garuda-dotfiles/nvim-conf ~/dotfiles-conf/nvim-conf
ln -s ~/dotfiles-conf/nvim-conf ~/.config/nvim
nvim
```

- Put `~/go/bin` on `PATH` for `gopls`.
- Rust diagnostics come from bacon-ls (installed by mason).
- The shell is `$SHELL` (bash), so `:terminal` gets nvm and the `PATH` from `~/.bashrc`.

## Windows

- Link the repo as the config: `New-Item -ItemType Junction -Path $env:LOCALAPPDATA\nvim -Target <repo>`.
- Tools (scoop): `scoop install neovim tree-sitter ripgrep fd fzf lazygit mingw`.
- Rust: `rustup component add rust-analyzer`. On Windows rust-analyzer runs clippy for diagnostics because bacon-ls hangs on `initialize` there.
- The shell is `pwsh` when installed, otherwise Windows PowerShell 5.1.

## Gopls

- Special tools for golang. Make sure you have go compiler in your computer. Install tool `gopls` to code `Golang`.
- Mason does not install `gopls` (`mason = false` in `lua/plugins/lsp.lua`), Neovim uses the one on `PATH`.

```bash
go install golang.org/x/tools/gopls@latest
```

## Layout

| Path | Purpose |
| --- | --- |
| `init.lua` | Entry point, loads `config.lazy` |
| `lua/config/` | Options, keymaps, autocmds, lazy.nvim setup and LazyVim extras |
| `lua/plugins/` | Plugin specs: colorscheme (solarized-osaka), editor (telescope), LSP, treesitter, UI |
| `lua/phamnam/` | Helpers: Hex to HSL, toggle inlay hints / autoformat |
| `lua/util/debug.lua` | `dd()` debug printer |
| `lazy-lock.json` | Pinned plugin versions |

## Languages

LazyVim extras and servers configured in `lua/config/lazy.lua` and `lua/plugins/lsp.lua`:

| Language | Language servers / tools |
| --- | --- |
| Lua | lua_ls, stylua, selene |
| TypeScript / JavaScript | vtsls, eslint, prettier |
| CSS / Tailwind | cssls, tailwindcss |
| Go | gopls (from `PATH`), gofumpt, goimports, golangci-lint, delve |
| Rust | rust-analyzer (rustaceanvim), bacon-ls, codelldb |
| Markdown | marksman, markdownlint-cli2 |
| JSON | jsonls (SchemaStore) |

## Keys

The leader is `Space`. Besides the LazyVim defaults:

| Keys | Action |
| --- | --- |
| `<A-i>` | Toggle a floating terminal |
| `<C-j>` | Next diagnostic |
| `<leader>i` | Toggle inlay hints |
| `<leader>r` | Replace the Hex color under the cursor with HSL |
| `ss` / `sv` | Split / vertical split |
| `sh` / `sj` / `sk` / `sl` | Move to the window left / below / above / right |
| `te` | `:tabedit` |
| `<C-a>` | Select all |
| `:ToggleAutoformat` | Toggle format on save |

## Updating plugins

`:Lazy update` updates plugins and rewrites `lazy-lock.json`; commit the lockfile to pin the new versions.
`:Lazy restore` goes back to the versions in the lockfile.
