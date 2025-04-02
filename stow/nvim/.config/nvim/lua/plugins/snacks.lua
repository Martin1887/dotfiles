return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        config = function(opts, _)
          -- rainbow and indent highlight groups
          vim.api.nvim_set_hl(0, "BrightRainbowYellow", { fg = "#E8BB26" })
          vim.api.nvim_set_hl(0, "BrightRainbowRed", { fg = "#FF7070" })
          vim.api.nvim_set_hl(0, "BrightRainbowBlue", { fg = "#7087FF" })
          vim.api.nvim_set_hl(0, "BrightRainbowOrange", { fg = "#DD8726" })
          vim.api.nvim_set_hl(0, "BrightRainbowGreen", { fg = "#40AA40" })
          vim.api.nvim_set_hl(0, "BrightRainbowViolet", { fg = "#DD7780" })
          vim.api.nvim_set_hl(0, "BrightRainbowCyan", { fg = "#60AAAA" })

          vim.api.nvim_set_hl(0, "ScopeYellow", { fg = "#BB8726" })

          vim.api.nvim_set_hl(0, "DimmedRainbowYellow", { fg = "#675020" })
          vim.api.nvim_set_hl(0, "DimmedRainbowRed", { fg = "#401515" })
          vim.api.nvim_set_hl(0, "DimmedRainbowBlue", { fg = "#262640" })
          vim.api.nvim_set_hl(0, "DimmedRainbowOrange", { fg = "#572600" })
          vim.api.nvim_set_hl(0, "DimmedRainbowGreen", { fg = "#153015" })
          vim.api.nvim_set_hl(0, "DimmedRainbowViolet", { fg = "#402640" })
          vim.api.nvim_set_hl(0, "DimmedRainbowCyan", { fg = "#264040" })
          opts.indent.hl = {
            "DimmedRainbowYellow",
            "DimmedRainbowRed",
            "DimmedRainbowBlue",
            "DimmedRainbowOrange",
            "DimmedRainbowGreen",
            "DimmedRainbowViolet",
            "DimmedRainbowCyan",
          }
          opts.scope.hl = "ScopeYellow"

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

          -- wider lines
          opts.indent.char = "┃"
          opts.scope.char = "┃"

          -- shorter animations
          opts.animate.duration = {
            step = 20,
            total = 200,
          }
        end,
      },
      animate = {
        fps = 165,
      },
      scroll = {
        animate = {
          duration = { step = 17, total = 510 },
        }
      },
      zen = {
        config = function(_, _)
          vim.api.nvim_set_hl(0, "SnacksDim", { fg = "#444444" })
        end,
        zoom = {
          win = {
            width = 150,
            backdrop = { transparent = true, blend = 0 },
          }
        }
      },
      styles = {
        zen = {
          enter = true,
          fixbuf = false,
          minimal = false,
          width = 120,
          height = 0,
          backdrop = { transparent = true, blend = 0 },
          keys = { q = false },
          zindex = 40,
          wo = {
            winhighlight = "NormalFloat:Normal",
          },
          w = {
            snacks_main = true,
          },
        }
      },
    },
    keys = {},
  }
}
