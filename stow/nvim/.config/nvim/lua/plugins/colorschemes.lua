return {
  {
    "https://github.com/Martin1887/melangeDarkerWarm-nvim",
  },
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", name = "catppuccin", enabled = false },
  {
    "ramojus/mellifluous.nvim",
    enabled = false,
    dependencies = {
      { "rktjmp/lush.nvim" },
    },
    config = function()
      -- comments without italic style, the rest is default values
      require("mellifluous").setup({
        mellifluous = {
          neutral = true,
          bg_contrast = "medium",
        },
        dim_inactive = false,
        color_set = "mellifluous",
        styles = {
          comments = "NONE",
          conditionals = "NONE",
          folds = "NONE",
          loops = "NONE",
          functions = "NONE",
          keywords = "NONE",
          strings = "NONE",
          variables = "NONE",
          numbers = "NONE",
          booleans = "NONE",
          properties = "NONE",
          types = "NONE",
          operators = "NONE",
        },
        transparent_background = {
          enabled = false,
          floating_windows = false,
          telescope = true,
          file_tree = true,
          cursor_line = true,
          status_line = false,
        },
        plugins = {
          cmp = true,
          gitsigns = true,
          indent_blankline = true,
          nvim_tree = {
            enabled = true,
            show_root = false,
          },
          telescope = {
            enabled = true,
            nvchad_like = true,
          },
          startify = true,
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "melange",
    },
  },
}
