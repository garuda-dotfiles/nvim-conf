local discipline = require("phamnam.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- New tab (<Tab>/<S-Tab> cycle tabs, see bufferline in plugins/ui.lua)
keymap.set("n", "te", ":tabedit ")
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Floating terminal (<C-/> stays the bottom split). count = 9 keeps it a separate
-- shell from the bottom one; the buffer-local <A-i> hides it from terminal mode
keymap.set({ "n", "t" }, "<A-i>", function()
  Snacks.terminal.toggle(nil, {
    cwd = LazyVim.root(),
    count = 9,
    win = {
      position = "float",
      border = "rounded",
      width = 0.8,
      height = 0.8,
      keys = { hide_alt_i = { "<A-i>", "hide", desc = "Hide Terminal", mode = { "n", "t" } } },
    },
  })
end, { desc = "Terminal (Float)" })

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)

keymap.set("n", "<leader>r", function()
  require("phamnam.hsl").replaceHexWithHSL()
end, { desc = "Replace Hex with HSL" })

keymap.set("n", "<leader>i", function()
  require("phamnam.lsp").toggleInlayHints()
end, { desc = "Toggle Inlay Hints" })

vim.api.nvim_create_user_command("ToggleAutoformat", function()
  require("phamnam.lsp").toggleAutoformat()
end, {})
