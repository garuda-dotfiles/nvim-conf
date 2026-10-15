return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        on_highlights = function(hl, c)
          -- `fn` (Rust), `func` (Go): the theme styles these as functions, not keywords, so they aren't italic
          hl["@keyword.function"] = { fg = c.green500, italic = true }
          -- The rest of Rust's keywords: these link to Statement/Operator/PreProc, which aren't italic
          hl["@keyword.conditional.rust"] = { fg = c.green500, italic = true } -- if else match
          hl["@keyword.repeat.rust"] = { fg = c.green500, italic = true } -- loop while break continue in
          hl["@keyword.operator.rust"] = { fg = c.green500, italic = true } -- as (cast)
          hl["@keyword.import.rust"] = { fg = c.red500, italic = true } -- use mod
        end,
      }
    end,
  },
}
