vim.g.mapleader = " "

vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*", "*/vendor/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""

-- Shell: PowerShell on Windows; elsewhere keep the default ($SHELL, bash) so nvm and ~/.bashrc PATH apply in :terminal
if vim.fn.has("win32") == 1 then
  if vim.fn.executable("pwsh") == 1 then
    LazyVim.terminal.setup("pwsh")
  else
    -- Windows PowerShell 5.1: LazyVim's flags touch $PSStyle, which only exists in pwsh 7 (see :h shell-powershell)
    vim.opt.shell = "powershell"
    vim.opt.shellcmdflag =
      "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
    vim.opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
    vim.opt.shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
  end
end

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.filetype.add({
  extension = { astro = "astro" },
  filename = { Podfile = "ruby" },
})

-- bacon-ls hangs on `initialize` on Windows, so rust-analyzer runs clippy there instead (see plugins/lsp.lua)
vim.g.lazyvim_rust_diagnostics = vim.fn.has("win32") == 1 and "rust-analyzer" or "bacon-ls"
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_cmp = "blink.cmp"
