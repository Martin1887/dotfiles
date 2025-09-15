local icons = require("lazyvim.config").icons

local function getWords()
  return tostring(vim.fn.wordcount().words) .. " words"
end

local function getLines()
  return tostring(vim.fn.line("$")) .. " lines"
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "melange",
      disabled_filetypes = { "neo-tree" }
    },
    sections = {
      -- the path (with symbols navigation) is put in winbar instead
      lualine_c = {
        LazyVim.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "navic", color_correction = "dynamic" },
      },
      lualine_y = {
        { "filetype",  icon_only = true,                 separator = "",                   padding = { left = 0, right = 1 } },
        { "encoding" },
        { "fileformat" },
        { getWords,    padding = { left = 1, right = 1 } },
        { getLines,    separator = "",                   padding = { left = 1, right = 1 } },
        { "progress",  separator = "",                   padding = { left = 2, right = 1 } },
        { "location",  padding = { left = 1, right = 1 } },
      },
    },
  },
}
