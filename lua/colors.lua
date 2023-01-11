require("catppuccin").setup {
  integrations = {
    barbar = true
  },
  highlight_overrides = {
    all = function(c)
      return {
        -- all colors here https://github.com/catppuccin/nvim
        -- NvimTreeWinSeparator = { fg = c.base, bg = c.base },
        NvimTreeNormal = {  bg = c.base },
        NvimTreeCursorLine = {fg = c.flamingo, bg = c.base},
        -- StatusLine = {bg = c.base},
        -- StatusLineNC = {bg = c.base},
        -- TabLine = {bg = c.base},
      }
    end,
  },
}

vim.cmd.colorscheme "catppuccin"
