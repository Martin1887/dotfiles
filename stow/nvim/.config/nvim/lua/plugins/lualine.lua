local icons = require("lazyvim.config").icons

local function getChars()
  return tostring(vim.fn.wordcount().chars)
end

local function getWords()
  return tostring(vim.fn.wordcount().words)
end

local function getLines()
  return tostring(vim.fn.line("$"))
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "melange",
      disabled_filetypes = { "neo-tree" }
    },
    sections = {
      lualine_y = {
        { "filetype", icon_only = true, separator = "", padding = { left = 0, right = 1 } },
        { "encoding" },
        { "fileformat" },
        { getChars, separator = "|", padding = { left = 1, right = 1 } },
        { getWords, separator = "|", padding = { left = 1, right = 1 } },
        { getLines, separator = "", padding = { left = 1, right = 1 } },
        { "progress", separator = "", padding = { left = 2, right = 1 } },
        { "location", padding = { left = 1, right = 1 } },
      },
    },
  },
}
