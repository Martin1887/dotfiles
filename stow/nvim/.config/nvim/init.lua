-- lua/init.lua
vim.g.lazyvim_json = vim.fn.stdpath("state") .. "/lazyvim.json"

-- bootstrap lazy.nvim, Lazyvim and your plugins
require("config.lazy")
