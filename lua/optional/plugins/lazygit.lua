-- Floating LazyGit terminal. Requires the `lazygit` executable on PATH.
vim.pack.add { 'https://github.com/kdheepak/lazygit.nvim' }

vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'Open Lazy[g]it' })
