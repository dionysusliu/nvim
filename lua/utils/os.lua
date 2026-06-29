local M = {}

local uname = ((vim.uv or vim.loop).os_uname and (vim.uv or vim.loop).os_uname()) or {}
local sysname = uname.sysname or ""
local release = uname.release or ""

M.sysname = sysname
M.release = release

M.is_mac = sysname == "Darwin"
M.is_linux = sysname == "Linux"
M.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
M.is_wsl = M.is_linux and release:lower():match("microsoft") ~= nil

return M
