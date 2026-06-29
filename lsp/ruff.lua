local lsp_cmd = require("utils.lsp_cmd")

return {
  cmd = lsp_cmd.python_tool_server("ruff"),
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
}
