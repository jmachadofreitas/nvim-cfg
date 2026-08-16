-- Git interface
vim.pack.add { 'https://github.com/NeogitOrg/neogit' }

-- Git normally reports an untracked-only directory as one entry, so Neogit
-- cannot stage its children selectively. Override that behavior only for Git
-- processes launched by this Neovim instance; terminal Git and LazyGit keep
-- their own configuration.
vim.env.GIT_CONFIG_COUNT = '1'
vim.env.GIT_CONFIG_KEY_0 = 'status.showUntrackedFiles'
vim.env.GIT_CONFIG_VALUE_0 = 'all'

require('neogit').setup {
  sections = {
    untracked = {
      folded = false,
      hidden = false,
    },
  },
}

vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<CR>', { desc = 'Open Neo[g]it' })
