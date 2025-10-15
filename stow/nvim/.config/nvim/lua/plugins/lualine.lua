local icons = require("lazyvim.config").icons

local function getChars()
  return tostring(vim.fn.wordcount().chars) .. "c"
end

local function getWords()
  return tostring(vim.fn.wordcount().words) .. "w"
end

local function getLines()
  return tostring(vim.fn.line("$")) .. "l"
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
        { "fileformat", separator = "", padding = { left = 0, right = 0 } },
        { "encoding", padding = { left = 1, right = 1 } },
        { getChars, separator = "|", padding = { left = 1, right = 1 } },
        { getWords, separator = "|", padding = { left = 1, right = 1 } },
        { getLines, separator = "", padding = { left = 1, right = 1 } },
        { "progress", separator = "", padding = { left = 2, right = 1 } },
        { "location", padding = { left = 1, right = 1 } },
      },
    },
  },
}
