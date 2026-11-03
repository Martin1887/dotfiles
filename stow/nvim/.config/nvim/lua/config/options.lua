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

-- this is needed to avoid focus.nvim error on loading sessions
vim.go.winminwidth = 0

-- ruff instead of pyright or basedpyright, it is not a supported value
-- but neither are loaded in this way
vim.g.lazyvim_python_lsp = "ruff"
vim.g.lazyvim_python_ruff = "ruff"
