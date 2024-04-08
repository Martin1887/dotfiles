require("lint").linters.codespell.args = { "-L crate,Crate,crates,Crates", "-" }

return {
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
  },
  -- LanguageTool
  {
    "barreiroleo/ltex-extra.nvim",
    config = function()
      require("lspconfig").ltex.setup({
        on_attach = function(client, bufnr)
          -- your other on_attach functions.
          require("ltex_extra").setup({
            load_langs = { "en-US" }, -- a table <string> : languages for witch dictionaries will be loaded
            init_check = true, -- boolean : whether to load dictionaries on startup
            path = vim.env.HOME .. "/.nvim/ltex", -- string : path to store dictionaries. Relative path uses current working directory
            log_level = "info", -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
          })
        end,
        -- TODO: check grammar on comments, not working
        filetypes = {
          "bib",
          -- "c++",
          -- "cpp",
          "gitcommit",
          -- "lua",
          "markdown",
          "org",
          "plaintex",
          "rst",
          "rnoweb",
          -- "rust",
          "tex",
        },
        settings = {
          ltex = {
            enabled = true,
            additionalRules = {
              motherTongue = "es",
            },
            ltex_ls = {
              path = "/usr/local/bin/ltex-ls",
            },
            java = {
              path = "/bin/java",
            },
            completionEnabled = true,
            -- "edit", "save" or "manual"
            checkFrequency = "save",
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          mason = false,
        },
        jsonls = {},
        lua_ls = {
          mason = false, -- set to false if you don't want this server to be installed with mason
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        texlab = {
          settings = {
            texlab = {
              chktex = {
                onOpenAndSave = true,
              },
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        uncrustify = {
          prepend_args = function(self, ctx)
            local found = vim.fs.find(".uncrustify.cfg", { upward = true, path = ctx.dirname })[1]
            if found then
              return { "-c", found }
            end

            return {}
          end,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        c = { "uncrustify" },
        cpp = { "uncrustify" },
      },
    },
  },
}
