return {
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      terminal = {
        win = {
          keys = {
            nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
            nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
            nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
            nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
          },
        },
      },
      indent = {
        hl = {
          "DimmedRainbowYellow",
          "DimmedRainbowRed",
          "DimmedRainbowBlue",
          "DimmedRainbowOrange",
          "DimmedRainbowGreen",
          "DimmedRainbowViolet",
          "DimmedRainbowCyan",
        }
      },
      scope = {
        hl = {
          "RainbowYellow",
          "RainbowRed",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        }
      }
    },
  }
}
