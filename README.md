# 💤 LazyVim

- A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
- Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
- I follow to repo of [Craftzdog - dotfiles-public](https://github.com/craftzdog/dotfiles-public)

# Windows

- Link the repo as the config: `New-Item -ItemType Junction -Path $env:LOCALAPPDATA\nvim -Target <repo>`.
- Tools (scoop): `scoop install neovim tree-sitter ripgrep fd fzf lazygit mingw`.
- Rust: `rustup component add rust-analyzer`. On Windows rust-analyzer runs clippy for diagnostics because bacon-ls hangs on `initialize` there.
- The shell is `pwsh` when installed, otherwise Windows PowerShell 5.1.

# Gopls

- Special tools for golang. Make sure you have go compiler in your computer. Install tool `gopls` to code `Golang`.

```bash
go install golang.org/x/tools/gopls@latest
```

