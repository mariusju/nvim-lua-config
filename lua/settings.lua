-- set highlight on search
vim.o.hlsearch = true

-- make line numbers default
vim.wo.number = true

-- enable mouse mode
vim.o.mouse = 'a'

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case insensitive searching unless /c or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- decrease update time
vim.wo.signcolumn = 'yes'

vim.o.termguicolors = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local signs = { Error = "X ", Warn = "X ", Hint = "H ", Info = "i " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


require('Comment').setup()

require('bufferline').setup( {
  animation = false,
  icons = false,
  closable = false,
})

require'hop'.setup()

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

require("nvim-autopairs").setup {}

vim.opt.clipboard = "unnamedplus"

require("nvim-surround").setup {}

