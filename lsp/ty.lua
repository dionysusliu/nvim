local lsp_cmd = require("utils.lsp_cmd")

return {
  cmd = lsp_cmd.python_tool_server("ty"),
  filetypes = { "python" },
  root_markers = { "uv.lock", "ty.toml", "pyproject.toml", ".git" },
}
