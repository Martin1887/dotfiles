return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    config = function(_, opts)
      local presets = require("markview.presets");
      require("markview").setup({
        preview = {
          icon_provider = "mini",
          filetypes = { "latex", "markdown", "quarto", "rmd", "tex", "typst", "norg", "rmd", "org", "codecompanion" },
        },
        html = {
          enable = false,
        },
        latex = {
          enable = true,
        },
        markdown = {
          enable = true,
          headings = presets.headings.numbered,
          horizontal_rules = presets.horizontal_rules.thick,
          tables = presets.tables.rounded,
        },
        markdown_inline = {
          enable = true,
        },
        typst = {
          enable = true,
        },
        yaml = {
          enable = true,
        },
      });
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
