return {
  { "simnalamburt/vim-mundo" },
  -- new selection targets, like parentheses
  { "wellle/targets.vim" },
  -- powerful find and replace
  { "wincent/ferret" },
  -- :Abolish, :Subvert and coercion (text cases)
  { "tpope/vim-abolish" },
  { "tpope/vim-repeat" },
  -- gS to split and gJ to join
  { "AndrewRadev/splitjoin.vim" },
  -- better '%'
  { "andymass/vim-matchup" },
  { "hiphish/rainbow-delimiters.nvim" },
  -- LaTeX symbols in telescope
  { "nvim-telescope/telescope-symbols.nvim" },
  -- barbar (bufferline)
  {
    "akinsho/bufferline.nvim",
    enabled = false
  },
  {
    "romgrk/barbar.nvim",
    -- version = "^1.0.0",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
      auto_hide = false,
      exclude_ft = {},
      exclude_name = {},
      highlight_visible = true,
      highlight_inactive_file_icons = false,
      focus_on_close = "previous",
      icons = {
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true },
          [vim.diagnostic.severity.WARN] = { enabled = true },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        separator = { left = "▊", right = "  " },
        inactive = {
          button = "",
          filetype = { enabled = false },
          separator = { left = "|", right = "" },
        },
      },
    },
  },
  -- resize using Alt+direction
  { "mrjones2014/smart-splits.nvim", lazy = false, version = ">=1.0.0" },
  {
    "mrjones2014/legendary.nvim",
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    keys = {
      { "<leader>P", "<cmd>Legendary<cr>", desc = "Legendary Command Palette" },
    },
    opts = {
      sort = { frecency = false },
      extensions = {
        lazy_nvim = {
          auto_register = true,
        },
        which_key = {
          auto_register = true,
          use_groups = false,
        },
        diffview = true,
        smart_splits = {},
      },
      -- sqlite is only needed if you want to use frecency sorting
      -- dependencies = { 'kkharji/sqlite.lua' }
    },
  },
  {
    "cpea2506/relative-toggle.nvim",
  },
  {
    "nat-418/boole.nvim",
    config = function()
      require("boole").setup({
        mappings = {
          increment = "<C-a>",
          decrement = "<C-z>",
        },
      })
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
  },
  {
    "nvim-focus/focus.nvim",
    enabled = true,
    version = "*",
    event = "BufReadPre",
    opts = {
      enable = true,
      commands = true,
      autoresize = {
        enable = false,
      },
    },
    keys = {
      { "<C-h>", "<cmd>FocusSplitLeft<cr>",  desc = "Focus Left Window or Create it" },
      { "<C-j>", "<cmd>FocusSplitDown<cr>",  desc = "Focus Down Window or Create it" },
      { "<C-k>", "<cmd>FocusSplitUp<cr>",    desc = "Focus Up Window or Create it" },
      { "<C-l>", "<cmd>FocusSplitRight<cr>", desc = "Focus Right Window or Create it" },
      { "<C-m>", "<cmd>FocusMaxOrEqual<cr>", desc = "Focus Toggle between Maximise or Equal size" },
      { "<C-:>", "<cmd>FocusAutoresize<cr>", desc = "Focus Autoresize by golden ratio" },
      {
        "<C-,>",
        function()
          require("focus").setup({ autoresize = { enable = false } })
        end,
        desc = "Focus Disable Autoresize",
      },
      {
        "<C-.>",
        function()
          require("focus").setup({ autoresize = { enable = true } })
        end,
        desc = "Focus Enable Autoresize",
      },
    },
  },
  {
    "aohoyd/broot.nvim",
    lazy = false,
    opts = {
      broot_conf_path = vim.fn.expand("~/.config/broot/nvim.hjson"),
    },
    keys = {
      { "<leader><space>", "<cmd>BrootProjectDir<cr>", desc = "Broot Project Dir" },
      { "<leader>.",       "<cmd>BrootCurrentDir<cr>", desc = "Broot Current Dir" },
      { "<leader>Bh",      "<cmd>BrootHomeDir<cr>",    desc = "Broot Home Dir" },
      { "<leader>B.",      "<cmd>BrootCurrentDir<cr>", desc = "Broot Current Dir" },
      { "<leader>Bw",      "<cmd>BrootWorkingDir<cr>", desc = "Broot Working Dir" },
      { "<leader>Bp",      "<cmd>BrootProjectDir<cr>", desc = "Broot Project Dir" },
    },
  },
  {
    "nacro90/numb.nvim",
    lazy = false,
    config = function()
      require("numb").setup()
    end,
  }
}
