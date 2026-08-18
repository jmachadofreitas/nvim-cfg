local M = {}

function M.setup()
  local path = vim.fn.expand '~/Code/Portfolio/marquee.nvim'
  if vim.fn.isdirectory(path) == 0 then
    vim.notify(('marquee plugin path not found: %s'):format(path), vim.log.levels.WARN)
    return
  end

  vim.opt.rtp:prepend(path)
  vim.cmd 'runtime plugin/marquee.lua'

  require('marquee').setup {
    telescope = true,
    which_key = true,
  }
end

return M
