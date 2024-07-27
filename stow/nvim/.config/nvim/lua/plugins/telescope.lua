return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "debugloop/telescope-undo.nvim",
      "AckslD/nvim-neoclip.lua",
    },
    build = "make",
    opts = {
      extensions = {
        undo = {
          side_by_side = false,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.6,
          },
        },
      },
    },
    config = function()
      local Util = require("lazyvim.util")
      local telescope = require("telescope")
      Util.on_load("telescope.nvim", function()
        telescope.load_extension("fzf")
        telescope.load_extension("projects")
        telescope.load_extension("undo")
        telescope.load_extension("persisted")
        telescope.load_extension("neoclip")
      end)
    end,
    keys = {
      {
        "<leader>f.f",
        LazyVim.pick("auto", { hidden = true, noignore = true, root = true }),
        desc = "Find Hidden Files (root dir)",
      },
      {
        "<leader>f.F",
        LazyVim.pick("auto", { hidden = true, noignore = true, root = false }),
        desc = "Find Hidden Files (cwd dir)",
      },
      { "<leader><space>", false },
    },
  },
  {
    "debugloop/telescope-undo.nvim",
  },
}
