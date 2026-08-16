local M = {}

local function check_version()
  local verstr = tostring(vim.version())
  if not vim.version.ge then
    vim.health.error(("Neovim out of date: '%s'. Upgrade to latest stable or nightly"):format(verstr))
    return
  end

  if vim.version.ge(vim.version(), '0.12') then
    vim.health.ok(("Neovim version is: '%s'"):format(verstr))
  else
    vim.health.error(("Neovim out of date: '%s'. Upgrade to latest stable or nightly"):format(verstr))
  end
end

local function check_external_reqs()
  for _, exe in ipairs { 'git', 'make', 'unzip', 'rg' } do
    if vim.fn.executable(exe) == 1 then
      vim.health.ok(("Found executable: '%s'"):format(exe))
    else
      vim.health.warn(("Could not find executable: '%s'"):format(exe))
    end
  end
end

function M.check()
  vim.health.start 'nvim-cfg'

  vim.health.info [[NOTE: Not every warning is a 'must-fix' in `:checkhealth`

  Fix only warnings for plugins and languages you intend to use.
  Mason will give warnings for languages that are not installed.
  You do not need to install them unless you want to use those languages.]]

  local uv = vim.uv or vim.loop
  vim.health.info('System Information: ' .. vim.inspect(uv.os_uname()))

  check_version()
  check_external_reqs()
end

return M
