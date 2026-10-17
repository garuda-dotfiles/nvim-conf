# 💤 LazyVim

- A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
- Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
- I follow to repo of [Craftzdog - dotfiles-public](https://github.com/craftzdog/dotfiles-public)

# Linux (Arch / Garuda)

- Link the repo as the config: `ln -s <repo> ~/.config/nvim`.
- Tools (pacman): `sudo pacman -S --needed neovim tree-sitter-cli ripgrep fd fzf lazygit ttf-jetbrains-mono-nerd go`.
- Node.js through [nvm](https://github.com/nvm-sh/nvm): `nvm install node && nvm alias default node`.
- Rust: `rustup component add rust-analyzer`. Diagnostics come from bacon-ls (installed by mason).
- Put `~/go/bin` on `PATH` for `gopls` (see below).
- The shell is `$SHELL` (bash), so `:terminal` gets nvm and the `PATH` from `~/.bashrc`.

# Windows

- Link the repo as the config: `New-Item -ItemType Junction -Path $env:LOCALAPPDATA\nvim -Target <repo>`.
- Tools (scoop): `scoop install neovim tree-sitter ripgrep fd fzf lazygit mingw`.
- Rust: `rustup component add rust-analyzer`. On Windows rust-analyzer runs clippy for diagnostics because bacon-ls hangs on `initialize` there.
- The shell is `pwsh` when installed, otherwise Windows PowerShell 5.1.

# Gopls

- Special tools for golang. Make sure you have go compiler in your computer. Install tool `gopls` to code `Golang`.
- Mason does not install `gopls` (`mason = false` in `lua/plugins/lsp.lua`), Neovim uses the one on `PATH`.

```bash
go install golang.org/x/tools/gopls@latest
```

