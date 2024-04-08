return {
  {
    "petertriho/nvim-scrollbar",
    opts = {
      handle = {
        blend = 0,
      },
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true,
        handle = true,
        search = true,
        ale = false,
      },
      marks = {
        Search = { color = "#ee8715" },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      -- require('hlslens').setup() is not required
      require("scrollbar.handlers.search").setup({
        -- hlslens config overrides, nvim and hop keymaps defaults are better
      })
    end,
    dependencies = {
      "petertriho/nvim-scrollbar",
    },
  },
}
