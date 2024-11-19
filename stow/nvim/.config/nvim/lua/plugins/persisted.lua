return {
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "olimorris/persisted.nvim",
    opts = {
      use_git_branch = true,
      autostart = true,
      should_save = function()
        if vim.bo.filetype == "alpha" then
          return false
        elseif vim.bo.filetype == "dashboard" then
          return false
        elseif vim.bo.filetype == "gitcommit" then
          return false
        else
          return true
        end
      end,
      autoload = false,
      follow_cwd = true,
    },
    config = function(_, opts)
      local persisted = require("persisted")
      persisted.branch = function()
        local current_branch = vim.fn.systemlist("git branch --show-current")[1]
        return vim.v.shell_error == 0 and current_branch or nil
      end
      persisted.setup(opts)
    end,
    keys = {
      { "<leader>ql", "<cmd>SessionLoadLast<cr>",     desc = "Restore Last Session" },
      { "<leader>qs", "<cmd>SessionLoad<cr>",         desc = "Restore Session" },
      { "<leader>qd", "<cmd>SessionDelete<cr>",       desc = "Delete Current Session" },
      { "<leader>qo", "<cmd>SessionStart<cr>",        desc = "Start (On) recording Session" },
      { "<leader>qf", "<cmd>SessionStop<cr>",         desc = "Stop (oFF) recording Session" },
      { "<leader>qt", "<cmd>Telescope persisted<cr>", desc = "Telescope Sessions" },
    },
  },
}
