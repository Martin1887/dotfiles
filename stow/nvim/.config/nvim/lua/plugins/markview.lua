return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        icon_provider = "mini",
        filetypes = { "markdown", "quarto", "rmd", "typst", "norg", "rmd", "org", "codecompanion" },
      },
    },
    config = function(_, opts)
      local presets = require("markview.presets");
      require("markview").setup({
        markdown = {
          horizontal_rules = presets.horizontal_rules.thick,
          tables = presets.tables.rounded,
        }
      });
      require("markview").setup(opts)
      -- Add extra editor support
      require("markview.extras.editor").setup();
    end,
    dependencies = {
      "saghen/blink.cmp"
    },
    keys = {
      {
        "<leader>ce", "<cmd>Editor edit<cr>", desc = "Edit the current codeblock",
      },
      {
        "<leader>cn", "<cmd>Editor create<cr>", desc = "Create a new codeblock in Markview editor",
      },
      {
        "<leader>um", "<cmd>Markview toggle<cr>", desc = "Toggle markview",
      },
    }
  }
}
