return {
  {
    "petertriho/nvim-scrollbar",
    opts = {
      providers = {
        gitsigns = true,
      },
      scrollbar = {
        thumb = { blend = 10, highlight = { bg = "#1F180B" } },
        preset = "intellij",
        floats = {
          snacks = { preview = true, zen = true },
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
      glance = {
        picker = "snacks",
      }
    },
    keys = {
      { "<leader>j", function() require("scrollbar").jump() end,   desc = "Jump to a scrollbar mark" },
      { "<leader>J", function() require("scrollbar").glance() end, desc = "Scrollbar glance picker" },
    }
  },
  {
    "kevinhwang91/nvim-hlslens",
  },
}
