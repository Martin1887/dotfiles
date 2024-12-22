-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/Lazyvim/Lazyvim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.termguicolors = true
-- Replace `~` by space as end-of-buffer
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

-- ruff instead of pyright or basedpyright, it is not a supported value
-- but nwither are loaded in this way
vim.g.lazyvim_python_lsp = "ruff"
vim.g.lazyvim_python_ruff = "ruff"

-- Neotree icons for diagnostic errors
local icons = require("lazyvim.config").icons
vim.fn.sign_define("DiagnosticSignError", { text = icons.diagnostics.Error, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = icons.diagnostics.Warn, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = icons.diagnostics.Info, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = icons.diagnostics.Hint, texthl = "DiagnosticSignHint" })

-- rainbow and indent highlight groups
vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#707000" })
vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#870000" })
vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#000087" })
vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#876000" })
vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#008700" })
vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#700070" })
vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#006060" })

vim.api.nvim_set_hl(0, "BrightRainbowYellow", { fg = "#E8BB26" })
vim.api.nvim_set_hl(0, "BrightRainbowRed", { fg = "#FF7070" })
vim.api.nvim_set_hl(0, "BrightRainbowBlue", { fg = "#7087FF" })
vim.api.nvim_set_hl(0, "BrightRainbowOrange", { fg = "#DD8726" })
vim.api.nvim_set_hl(0, "BrightRainbowGreen", { fg = "#40AA40" })
vim.api.nvim_set_hl(0, "BrightRainbowViolet", { fg = "#DD7780" })
vim.api.nvim_set_hl(0, "BrightRainbowCyan", { fg = "#60AAAA" })

vim.api.nvim_set_hl(0, "DimmedRainbowYellow", { fg = "#675020" })
vim.api.nvim_set_hl(0, "DimmedRainbowRed", { fg = "#401515" })
vim.api.nvim_set_hl(0, "DimmedRainbowBlue", { fg = "#262640" })
vim.api.nvim_set_hl(0, "DimmedRainbowOrange", { fg = "#572600" })
vim.api.nvim_set_hl(0, "DimmedRainbowGreen", { fg = "#153015" })
vim.api.nvim_set_hl(0, "DimmedRainbowViolet", { fg = "#402640" })
vim.api.nvim_set_hl(0, "DimmedRainbowCyan", { fg = "#264040" })

-- brighter highlights for rainbow delimiters
local delims_highlight = {
  "BrightRainbowYellow",
  "BrightRainbowRed",
  "BrightRainbowBlue",
  "BrightRainbowOrange",
  "BrightRainbowGreen",
  "BrightRainbowViolet",
  "BrightRainbowCyan",
}
vim.g.rainbow_delimiters = { highlight = delims_highlight }
