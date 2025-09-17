return {
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
  },
  -- LanguageTool
  {
    "barreiroleo/ltex-extra.nvim",
    config = function()
      require("lspconfig").ltex_plus.setup({
        on_attach = function(client, bufnr)
          -- your other on_attach functions.
          require("ltex_extra").setup({
            load_langs = { "en-GB", "en-US", "es" }, -- a table <string> : languages for which dictionaries will be loaded
            init_check = true,                       -- boolean : whether to load dictionaries on startup
            path = vim.env.HOME .. "/.nvim/ltex",    -- string : path to store dictionaries. Relative path uses current working directory
            log_level = "none",                      -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
          })
        end,
        -- For programming languages harper is used instead, much faster
        filetypes = {
          "bib",
          "gitcommit",
          "markdown",
          "org",
          "plaintex",
          "rst",
          "rnoweb",
          "tex",
        },
        settings = {
          ltex = {
            enabled = true,
            language = "en-GB",
            additionalRules = {
              motherTongue = "es",
            },
            ltex_ls = {
              path = "ltex-ls-plus",
              logLevel = "severe",
            },
            java = {
              maximumHeapSize = 8192,
            },
            sentenceCacheSize = 20000,
            completionEnabled = true,
            -- "edit", "save" or "manual"
            checkFrequency = "save",
            clearDiagnosticsWhenClosingFile = false,
            trace = {
              server = "off",
            }
          },
        },
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    enabled = false,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = false,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          mason = false,
        },
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
        typos_lsp = {},
        harper_ls = {}
      },
      setup = {
        ["ruff"] = function()
          LazyVim.lsp.on_attach(function(client, _)
            -- Enable hover instead of disabling it in favor of Pyright
            client.server_capabilities.hoverProvider = true
          end, "ruff")
        end,
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
