local function get_diagnostic_label(props)
  local lazyicons = require("lazyvim.config").icons
  local icons = {
    Error = lazyicons.diagnostics.Error,
    Warn = lazyicons.diagnostics.Warn,
    Info = lazyicons.diagnostics.Info,
    Hint = lazyicons.diagnostics.Hint,
  }

  local label = {}
  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
    if n > 0 then
      local fg = "#" ..
          string.format("%06x", vim.api.nvim_get_hl_by_name("DiagnosticSign" .. severity, true)["foreground"])
      table.insert(label, { icon .. " " .. n .. " ", guifg = fg })
    end
  end
  return label
end

return {
  {
    'b0o/incline.nvim',
    config = function()
      require('incline').setup({
        debounce_threshold = { falling = 500, rising = 250 },
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(bufname, ":t")
          local diagnostics = get_diagnostic_label(props)
          local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
          local filetype_icon, color, _is_default = require("mini.icons").get("file", filename)

          local buffer = {
            { filetype_icon, hl = color },
            { " " },
            { filename,      gui = modified },
          }

          if #diagnostics > 0 and props.focused == true then
            table.insert(diagnostics, { "| ", guifg = "grey" })
          end
          for _, buffer_ in ipairs(buffer) do
            table.insert(diagnostics, buffer_)
          end
          return diagnostics
        end,
      })
    end,
    event = 'VeryLazy',
  }
}
