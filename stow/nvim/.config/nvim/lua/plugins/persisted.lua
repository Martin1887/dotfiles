return {
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "olimorris/persisted.nvim",
    opts = {
      use_git_branch = true,
      autosave = true,
      should_autosave = function()
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
      { "<leader>ql", "<cmd>SessionLoadLast<cr>", desc = "Restore Last Session" },
      { "<leader>qs", "<cmd>SessionLoad<cr>", desc = "Restore Session" },
      { "<leader>qd", "<cmd>SessionDelete<cr>", desc = "Delete Current Session" },
      { "<leader>qo", "<cmd>SessionStart<cr>", desc = "Start (On) recording Session" },
      { "<leader>qf", "<cmd>SessionStop<cr>", desc = "Stop (oFF) recording Session" },
      { "<leader>qt", "<cmd>Telescope persisted<cr>", desc = "Telescope Sessions" },
    },
  },
  -- dashboard must be modified to use persisted instead of persistence
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persisted").load()',                          desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
