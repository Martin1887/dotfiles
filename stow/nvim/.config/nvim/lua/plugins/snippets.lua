return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = { "garymjr/nvim-snippets" },
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
      jsonFormatter = "none",
      sources = {
        providers = {
          snippets = {
            opts = {
              search_paths = { vim.fn.stdpath("config") .. "/snippets" },
            },
          }
        }
      }
    },
    keys = {
      { "<leader>cpa", "<cmd>ScissorsAddNewSnippet<cr>", desc = "Add new snippet" },
      { "<leader>cpe", "<cmd>ScissorsEditSnippet<cr>",   desc = "Edit snippet" },
    },
  },
  require("blink.cmp").setup {
    sources = {
      providers = {
        snippets = {
          opts = {
            search_paths = { "path/to/your/snippetFolder" },
          },
        }
      }
    }
  }
}
