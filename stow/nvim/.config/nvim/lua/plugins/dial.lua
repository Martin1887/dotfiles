local M = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
  local mode = vim.fn.mode(true)
  -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
  local is_visual = mode == "v" or mode == "V" or mode == "\22"
  local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
  local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
  return require("dial.map")[func](group)
end

return {
  {
    "monaqa/dial.nvim",
    recommended = true,
    desc = "Increment and decrement numbers, dates, and more",
    -- stylua: ignore
    keys = {
      { "<C-x>",  false },
      { "<C-z>",  function() return M.dial(false) end,       expr = true, desc = "Decrement", mode = { "n", "v" } },
      { "g<C-x>", false },
      { "g<C-z>", function() return M.dial(false, true) end, expr = true, desc = "Decrement", mode = { "n", "v" } },
    },
  },
}
