return {
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      { "<leader>du", false },
      { "<leader>de", false },
      {
        "<leader>dut",
        function()
          require("dapui").toggle({})
        end,
        desc = "DAP UI Toggle",
      },
      {
        "<leader>due",
        function()
          require("dapui").eval()
        end,
        desc = "DAP UI Eval",
        mode = { "n", "v" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      if not dap.adapters["codelldb"] then
        require("dap").adapters["codelldb"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = {
              "--port",
              "${port}",
            },
          },
        }
      end
      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            type = "codelldb",
            request = "launch",
            name = "Launch file",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            stdio = { function()
              local input = vim.fn.input("Path to input file: ", vim.fn.getcwd() .. "/", "file")
              if not input == "" then
                return input
              else
                return nil
              end
            end, nil, nil },
            cwd = "${workspaceFolder}",
          },
          {
            type = "codelldb",
            request = "attach",
            name = "Attach to process",
            pid = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  }
}
