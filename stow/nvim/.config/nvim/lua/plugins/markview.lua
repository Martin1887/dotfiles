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
          headings = require("markview.presets").headings.slanted,
          horizontal_rules = require("markview.presets").horizontal_rules.thick,
          tables = require("markview.presets").tables.rounded,
        }
      });
      require("markview").setup(opts)
      -- Add extra editor support
      require("markview.extras.editor").setup();
      Snacks.toggle({
        name = "Markview Render",
        get = function()
          return require("markview").actions.__is_enabled()
        end,
        set = function(enabled)
          local m = require("markview")
          if enabled then
            m.actions.enable()
          else
            m.actions.disable()
          end
        end,
      }):map("<leader>um")
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
    }
  }
}
