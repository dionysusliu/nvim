local os_util = require("utils.os")

local M = {}

local function venv_tool_bin(root_dir, tool)
  local venv_subdir = os_util.is_windows and "Scripts" or "bin"
  return vim.fs.joinpath(root_dir, ".venv", venv_subdir, tool .. (os_util.is_windows and ".exe" or ""))
end

local function mason_tool_bin(tool)
  return vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin", tool)
end

--- Prefer project .venv, then Mason, then PATH.
---@param tool string e.g. "ty", "ruff"
---@return fun(config: table): string[]
function M.python_tool_server(tool)
  return function(config)
    local root_dir = config.root_dir
    if root_dir then
      local venv_bin = venv_tool_bin(root_dir, tool)
      if vim.fn.executable(venv_bin) == 1 then
        return { venv_bin, "server" }
      end
    end

    local mason_bin = mason_tool_bin(tool)
    if vim.fn.executable(mason_bin) == 1 then
      return { mason_bin, "server" }
    end

    return { tool, "server" }
  end
end

return M
