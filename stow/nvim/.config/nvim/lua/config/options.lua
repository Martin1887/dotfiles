-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/Lazyvim/Lazyvim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.termguicolors = true
-- Replace `~` by space as enf-of-buffer
opt.fcs = "eob: "

-- set tab width to 4 spaces
opt.tabstop = 4
-- writing tab means 4 spaces, in Lua files 2 spaces can be written instead
opt.shiftwidth = 4

opt.colorcolumn = "80,90,100"

-- disable ferret auto mappings
vim.g.FerretMap = 0

-- this is needed to avoid focus.nvim error on loading sessions
vim.go.winminwidth = 0

-- basedpyright instead of pyright
vim.g.lazyvim_python_lsp = "basedpyright"

-- Neotree icons for diagnostic errors
local icons = require("lazyvim.config").icons
vim.fn.sign_define("DiagnosticSignError", { text = icons.diagnostics.Error, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = icons.diagnostics.Warning, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = icons.diagnostics.Info, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = icons.diagnostics.Hint, texthl = "DiagnosticSignHint" })
