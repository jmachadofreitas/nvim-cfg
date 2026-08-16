local M = {}

---Load every Lua module in a directory namespace.
---@param opts? { base_path?: string, namespace?: string, exclude?: string[] }
function M.require_all(opts)
  opts = opts or {}
  local base_path = opts.base_path or vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'config')
  local namespace = opts.namespace or 'config'
  local excluded = {}

  for _, name in ipairs(opts.exclude or { 'init.lua' }) do
    excluded[name] = true
  end

  for file_name, file_type in vim.fs.dir(base_path, { follow = true }) do
    if (file_type == 'file' or file_type == 'link') and file_name:match '%.lua$' and not excluded[file_name] then
      local module = file_name:gsub('%.lua$', '')
      require(namespace .. '.' .. module)
    end
  end
end

return M
