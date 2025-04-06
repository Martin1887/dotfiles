-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/Lazyvim/Lazyvim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- change neo-tree untracked files highlight
vim.cmd("hi NeoTreeGitUntracked guifg=#eebb15")
vim.cmd("hi NeoTreeGitUnstaged guifg=#DD8764")

-- conceal disabled by default in Markdown and LaTeX, it is not very useful in
-- TUI because many things are not correctly displayed
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "tex" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})
-- set tabstop and shiftwidth=2 only for selected languages
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
  end,
})

-- disable autoresize for neo-tree
local ignore_filetypes = { "neo-tree" }
local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function(_)
    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      vim.b.focus_disable = true
    else
      vim.b.focus_disable = false
    end
  end,
  desc = "Disable focus autoresize for FileType",
})
