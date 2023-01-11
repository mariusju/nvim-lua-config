local telescope = require('telescope.builtin')

vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.api.nvim_set_keymap('n', '<MiddleMouse>', '<LeftMouse>', { noremap = true, silent = true });

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.api.nvim_set_keymap('i', 'jk', "<Esc>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('i', 'kj', "<Esc>", { noremap = true, silent = true });

vim.api.nvim_set_keymap('n', '<esc>', ':noh<return><esc>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>j', 'k:join<CR>', { noremap = true, silent = true });

vim.keymap.set('n', 'J', '<cmd>BufferPrevious<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '<cmd>BufferNext<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>x', '<cmd>BufferClose<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })

-- "Better window navigation
vim.api.nvim_set_keymap('n', '<C-j>', "<C-w>j<Esc>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-k>', "<C-w>k<Esc>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-h>', "<C-w>h<Esc>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-l>', "<C-w>l<Esc>", { noremap = true, silent = true });

vim.api.nvim_set_keymap('n', 'B', "^", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', 'E', "$", { noremap = true, silent = true });
vim.api.nvim_set_keymap('v', 'B', "^", { noremap = true, silent = true });
vim.api.nvim_set_keymap('v', 'E', "$", { noremap = true, silent = true });

vim.api.nvim_set_keymap('n', '<leader>w', ':wa!<CR>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<leader>gp', ':Format<CR>', { noremap = true, silent = true });

vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>dd', telescope.diagnostics, {})
vim.keymap.set('n', 'gi', telescope.lsp_references, {})
vim.keymap.set('n', 'gd', telescope.lsp_definitions, { desc = 'go to definition' })
vim.keymap.set('n', 'gr', telescope.grep_string, { desc = '[S]earch current [W]ord' })

vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>Lspsaga show_line_diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'f', '<cmd>HopWord<cr>', {})

vim.api.nvim_set_keymap('n', 'glog', "yiwoconsole.log('<c-r>\"', <C-r>\")<Esc>", { noremap = true, silent = true })

