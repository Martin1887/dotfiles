return {
  {
    "petertriho/nvim-scrollbar",
    branch = "refactor/v2",
    opts = {
      providers = {
        gitsigns = true,
      },
      scrollbar = {
        thumb = { blend = 95 },
        preset = "intellij",
        floats = {
          snacks = { list = true, preview = true },
          when = function(context)
            return context.filetype == "lazy"
          end,
        },
      },
      marks = {
        Search = {
          priority = 1,
          highlight = { fg = "#ee8715", bold = true },
        },
      },
    },
  },
  {
    "kevinhwang91/nvim-hlslens",
  },
}
