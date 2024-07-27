return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = { "nvim-telescope/telescope.nvim", "garymjr/nvim-snippets" },
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
      jsonFormatter = "jq",
    },
    keys = {
      { "<leader>cpa", "<cmd>ScissorsAddNewSnippet<cr>", desc = "Add new snippet" },
      { "<leader>cpe", "<cmd>ScissorsEditSnippet<cr>", desc = "Edit snippet" },
    },
  },
}
