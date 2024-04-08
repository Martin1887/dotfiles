-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/Lazyvim/Lazyvim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Map ¡ (very more usable in Spanish keyboards) to ^
map("n", "¡", "^", { desc = "Start of line (non-blank)", silent = true, noremap = true })

-- C-q to close window
map("n", "<C-q>", "<C-w>q", { desc = "Delete buffer", silent = true, noremap = true })
-- C-x to close buffer and barbar mappings
map("n", "<C-x>", "<cmd>BufferClose<cr>", { desc = "Delete buffer", silent = true, noremap = true })
map("n", "H", "<cmd>BufferPrevious<cr>", { desc = "Previous buffer", silent = true, noremap = true })
map("n", "L", "<cmd>BufferNext<cr>", { desc = "Next buffer", silent = true, noremap = true })
map(
  "n",
  "<A-<>",
  "<cmd>BufferMovePrevious<cr>",
  { desc = "Re-order to previous buffer", silent = true, noremap = true }
)
map("n", "<A->>", "<cmd>BufferMoveNext<cr>", { desc = "Re-order to next buffer", silent = true, noremap = true })
map("n", "<A-1>", "<cmd>BufferGoto 1<cr>", { desc = "Go to buffer 1", silent = true, noremap = true })
map("n", "<A-2>", "<cmd>BufferGoto 2<cr>", { desc = "Go to buffer 2", silent = true, noremap = true })
map("n", "<A-3>", "<cmd>BufferGoto 3<cr>", { desc = "Go to buffer 3", silent = true, noremap = true })
map("n", "<A-4>", "<cmd>BufferGoto 4<cr>", { desc = "Go to buffer 4", silent = true, noremap = true })
map("n", "<A-5>", "<cmd>BufferGoto 5<cr>", { desc = "Go to buffer 5", silent = true, noremap = true })
map("n", "<A-6>", "<cmd>BufferGoto 6<cr>", { desc = "Go to buffer 6", silent = true, noremap = true })
map("n", "<A-7>", "<cmd>BufferGoto 7<cr>", { desc = "Go to buffer 7", silent = true, noremap = true })
map("n", "<A-8>", "<cmd>BufferGoto 8<cr>", { desc = "Go to buffer 8", silent = true, noremap = true })
map("n", "<A-9>", "<cmd>BufferGoto 9<cr>", { desc = "Go to buffer 9", silent = true, noremap = true })
map("n", "<A-0>", "<cmd>BufferLast<cr>", { desc = "Go to last buffer", silent = true, noremap = true })
map("n", "<leader>bp", "<cmd>BufferPin<cr>", { desc = "Pin/unpin buffer", silent = true, noremap = true })
map(
  "n",
  "<leader>bP",
  "<cmd>BufferCloseAllButPinned<cr>",
  { desc = "Delete not pinned buffers", silent = true, noremap = true }
)
map("n", "<C-p>", "<cmd>BufferPick<cr>", { desc = "Magic buffer-picking mode", silent = true, noremap = true })
map(
  "n",
  "<leader>bsb",
  "<cmd>BufferOrderByBufferNumber<cr>",
  { desc = "Sort buffers by buffer number", silent = true, noremap = true }
)
map("n", "<leader>bsn", "<cmd>BufferOrderByName<cr>", { desc = "Sort buffers by name", silent = true, noremap = true })
map(
  "n",
  "<leader>bsd",
  "<cmd>BufferOrderByDirectory<cr>",
  { desc = "Sort buffers by directory", silent = true, noremap = true }
)
map(
  "n",
  "<leader>bsl",
  "<cmd>BufferOrderByLanguage<cr>",
  { desc = "Sort buffers by language", silent = true, noremap = true }
)
map(
  "n",
  "<leader>bsw",
  "<cmd>BufferOrderByWindowNumber<cr>",
  { desc = "Sort buffers by window number", silent = true, noremap = true }
)

-- nvim-spider
map(
  { "n", "o", "x" },
  "w",
  "<cmd>lua require('spider').motion('w')<cr>",
  { desc = "Spider-w", silent = true, noremap = true }
)
map(
  { "n", "o", "x" },
  "b",
  "<cmd>lua require('spider').motion('b')<cr>",
  { desc = "Spider-b", silent = true, noremap = true }
)
map(
  { "n", "o", "x" },
  "e",
  "<cmd>lua require('spider').motion('e')<cr>",
  { desc = "Spider-e", silent = true, noremap = true }
)
map(
  { "n", "o", "x" },
  "ge",
  "<cmd>lua require('spider').motion('ge')<cr>",
  { desc = "Spider-ge", silent = true, noremap = true }
)

-- No neck pain (zen mode like)
map("n", "<leader>uz", "<cmd>NoNeckPain<cr>", { desc = "No neck pain (zen mode)", silent = true, noremap = true })

-- GitGutter additional keymaps
map("n", "[h", "<cmd>GitGutterPrevHunk<cr>", { desc = "Previous hunk (git change)", silent = true, noremap = true })
map("n", "]h", "<cmd>GitGutterNextHunk<cr>", { desc = "Next hunk (git change)", silent = true, noremap = true })

-- nvim-neoclip
map(
  "n",
  "<leader>yy",
  "<cmd>Telescope neoclip<cr>",
  { desc = "Telescope neoclip (yank history)", silent = true, noremap = true }
)
map(
  "n",
  "<leader>m",
  "<cmd>Telescope macroscope<cr>",
  { desc = "Telescope macroscope (neoclip macros history)", silent = true, noremap = true }
)
map(
  "n",
  "<leader>yo",
  "<cmd>:lua require('neoclip').start()<cr>",
  { desc = "Telescope neoclip On", silent = true, noremap = true }
)
map(
  "n",
  "<leader>yf",
  "<cmd>:lua require('neoclip').stop()<cr>",
  { desc = "Telescope neoclip oFF", silent = true, noremap = true }
)
map(
  "n",
  "<leader>yt",
  "<cmd>:lua require('neoclip').toggle()<cr>",
  { desc = "Telescope neoclip Toggle", silent = true, noremap = true }
)
map(
  "n",
  "<leader>yc",
  "<cmd>:lua require('neoclip').clear_history()<cr>",
  { desc = "Telescope neoclip Clear history", silent = true, noremap = true }
)

-- projects
map(
  "n",
  "<leader>p",
  "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>",
  { desc = "Telescope projects", silent = true, noremap = true }
)

-- Telescope LaTeX symbols
map(
  "n",
  "<leader>tl",
  "<cmd> lua require'telescope.builtin'.symbols{ sources = {'math', 'latex'} } <cr>",
  { desc = "LaTeX symbols", silent = true, noremap = true }
)
-- Telescope undo
map("n", "<leader>tu", "<cmd>Telescope undo<cr>", { desc = "Telescope undo", silent = true, noremap = true })

-- rustaceanvim
map("n", "<leader>rd", "<cmd>RustLsp debuggables<cr>", { desc = "Rust debuggables", silent = true, noremap = true })
map("n", "<leader>rrn", "<cmd>RustLsp runnables<cr>", { desc = "Rust runnables", silent = true, noremap = true })
map("n", "<leader>rt", "<cmd>RustLsp testables<cr>", { desc = "Rust testables", silent = true, noremap = true })
map("n", "<leader>rem", "<cmd>RustLsp expandMacro<cr>", { desc = "Rust expand macro", silent = true, noremap = true })
map(
  "n",
  "<leader>rrp",
  "<cmd>RustLsp rebuildProcMacros<cr>",
  { desc = "Rust rebuild proc macros", silent = true, noremap = true }
)
map("n", "<leader>rmu", "<cmd>RustLsp moveItem up<cr>", { desc = "Rust move up", silent = true, noremap = true })
map("n", "<leader>rmd", "<cmd>RustLsp moveItem down<cr>", { desc = "Rust move down", silent = true, noremap = true })
map("n", "<leader>rca", "<cmd>RustLsp codeAction<cr>", { desc = "Rust code action", silent = true, noremap = true })
map(
  "n",
  "<leader>rha",
  "<cmd>RustLsp hover actions<cr>",
  { desc = "Rust hover actions", silent = true, noremap = true }
)
map("n", "<leader>rhr", "<cmd>RustLsp hover range<cr>", { desc = "Rust hover range", silent = true, noremap = true })
map("n", "<leader>ree", "<cmd>RustLsp explainError<cr>", { desc = "Rust explainError", silent = true, noremap = true })
map(
  "n",
  "<leader>rrd",
  "<cmd>RustLsp renderDiagnostic<cr>",
  { desc = "Rust renderDiagnostic", silent = true, noremap = true }
)
map("n", "<leader>roc", "<cmd>RustLsp openCargo<cr>", { desc = "Rust open Cargo.toml", silent = true, noremap = true })
map("n", "<leader>rpm", "<cmd>RustLsp parentModule<cr>", { desc = "Rust parentModule", silent = true, noremap = true })
map("n", "<leader>rjl", "<cmd>RustLsp joinLines<cr>", { desc = "Rust joinLines", silent = true, noremap = true })
map("n", "<leader>rcg", "<cmd>RustLsp crateGraph<cr>", { desc = "Rust crateGraph", silent = true, noremap = true })
map("n", "<leader>rst", "<cmd>RustLsp syntaxTree<cr>", { desc = "Rust syntaxTree", silent = true, noremap = true })

-- lspsaga
map("n", "<leader>cs", "<cmd>Lspsaga finder<cr>", { desc = "lsp_finder", silent = true, noremap = true })
map("n", "<leader>o", "<cmd>Lspsaga outline<cr>", { desc = "outline", silent = true, noremap = true })
map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", { desc = "incoming calls", silent = true, noremap = true })
map("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>", { desc = "Outgoing calls", silent = true, noremap = true })

-- dap and dap-ui
map(
  "n",
  "<leader>db",
  "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
  { desc = "DAP Toggle breakpoint", silent = true, noremap = true }
)
map(
  "n",
  "<leader>dR",
  "<cmd>lua require'dap'.clear_breakpoints()<cr>",
  { desc = "DAP Remove breakpoints", silent = true, noremap = true }
)
map(
  "n",
  "<leader>dt",
  "<cmd>lua require'dap'.terminate()<cr>",
  { desc = "DAP Terminate session", silent = true, noremap = true }
)
map(
  "n",
  "<leader>dl",
  "<cmd>lua require'dap'.run_last()<cr>",
  { desc = "DAP run last session", silent = true, noremap = true }
)
map(
  "n",
  "<leader>dc",
  "<cmd>lua require'dap'.continue()<cr>",
  { desc = "DAP continue (launch/resume)", silent = true, noremap = true }
)
map(
  "n",
  "<F5>",
  "<cmd>lua require'dap'.continue()<cr>",
  { desc = "DAP continue (launch/resume)", silent = true, noremap = true }
)
map(
  "n",
  "<leader>do",
  "<cmd>lua require'dap'.step_over()<cr>",
  { desc = "DAP step over", silent = true, noremap = true }
)
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", { desc = "DAP step over", silent = true, noremap = true })
map(
  "n",
  "<leader>di",
  "<cmd>lua require'dap'.step_into()<cr>",
  { desc = "DAP step into", silent = true, noremap = true }
)
map("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", { desc = "DAP step into", silent = true, noremap = true })
map("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", { desc = "DAP step out", silent = true, noremap = true })
map("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", { desc = "DAP step out", silent = true, noremap = true })
map("n", "<leader>dur", "<cmd>lua require'dap'.repl.open()<cr>", { desc = "DAP REPL", silent = true, noremap = true })
map(
  "n",
  "<leader>dK",
  "<cmd>lua require'dap.ui.widgets'.hover()<cr>",
  { desc = "DAP widget hover", silent = true, noremap = true }
)

map("n", "<leader>duo", "<cmd>lua require('dapui').open()<cr>", { desc = "DAP UI open", silent = true, noremap = true })
map(
  "n",
  "<leader>duc",
  "<cmd>lua require('dapui').close()<cr>",
  { desc = "DAP UI close", silent = true, noremap = true }
)

-- Ferret
map("n", "<leader>Fa", "<Plug>(FerretAck)", { desc = "FerretAck", silent = true, noremap = true })
map("n", "<leader>FA", "<Plug>(FerretLack)", { desc = "FerretLack", silent = true, noremap = true })
map("n", "<leader>Fb", "<Plug>(FerretBack)", { desc = "FerretBack", silent = true, noremap = true })
map("n", "<leader>FB", "<Plug>(FerretBlack)", { desc = "FerretBlack", silent = true, noremap = true })
map("n", "<leader>Fq", "<Plug>(FerretQuack)", { desc = "FerretQuack", silent = true, noremap = true })
map("n", "<leader>Fw", "<Plug>(FerretAckWord)", { desc = "FerretAckWord", silent = true, noremap = true })
map("n", "<leader>Fr", "<Plug>(FerretAcks)", { desc = "FerretAcks", silent = true, noremap = true })
