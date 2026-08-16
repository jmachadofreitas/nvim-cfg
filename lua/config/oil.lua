-- ============================================================
-- File Explorer
-- Open, create, rename files
-- ============================================================
do
  vim.pack.add { { src = gh 'stevearc/oil.nvim' } }
  require('oil').setup {
    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = true,
  }
  vim.keymap.set('n', '\\\\', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
end
