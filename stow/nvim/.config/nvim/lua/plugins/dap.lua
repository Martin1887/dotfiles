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
}
