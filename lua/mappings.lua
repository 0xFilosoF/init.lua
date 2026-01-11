---@diagnostic disable: undefined-global

require "nvchad.mappings"

local map = vim.keymap.set

-- Basic
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- Divine mappings
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move down" })
map("x", "<leader>p", '"_dP', { desc = "Paste with buffer" })
map("n", "<leader>d", '"_d', { desc = "Delete without buffer" })
map("v", "<leader>d", '"_d', { desc = "Delete without buffer" })
map("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w><Left><Left><Left>]], { desc = "Local rename" })
map("n", "<leader>ri", "30<C-w>>", { desc = "Increase width window" })
map("n", "<leader>rd", "30<C-w><", { desc = "Decrease width window" })
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code actions" })

-- Utils
map("n", "<leader>cx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close All Buffers" })
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todo" })
map("n", "\\", "<cmd>:vsplit <CR>", { desc = "Vertical Split" })
map("n", "<leader>uh", function()
  ---@diagnostic disable-next-line: undefined-global
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { bufnr })
end, { desc = "Toggle inlay hint" })
map("n", "<leader>fn", "<cmd>Telescope noice<CR>", { desc = "Noice history" })
map("n", "<leader>nx", "<cmd>Telescope nx actions<CR>", { desc = "Nx actions" })
map("n", "<leader>mp", function()
  local peek = require "peek"
  if peek.is_open() then
    peek.close()
    return
  end
  peek.open()
end, { desc = "Markdown preview" })
map("n", "<leader>mt", "<cmd>RenderMarkdown toggle<CR>", { desc = "Markdown render toggle" })
map("n", "<leader>uc", "<cmd>CloakToggle<CR>", { desc = "Toggle Cloak allows toggle (env)" })
map("n", "<leader>pl", "<cmd>CloakPreviewLine<CR>", { desc = "Cloak preview hidden line" })
map("n", "<leader>uu", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>-", function()
  require("oil").toggle_float()
end, { desc = "Open Float parent directory" })

-- Tmux
map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>", { desc = "Tmux Down" })

-- Snacks
map("n", "<leader><space>", function()
  Snacks.picker.smart()
end, { desc = "Smart Find Files" })
map("n", "<leader>sS", function()
  Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })
map("n", "<leader>sd", function()
  Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
map("n", "<leader>sc", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })
map("n", "<leader>sC", function()
  Snacks.picker.commands()
end, { desc = "Commands" })
map("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })

-- Trouble
map("n", "<leader>qc", "<cmd>TinyInlineDiag toggle<CR>", { desc = "Diagnostic Toggle" })
map("n", "<leader>qq", function()
  vim.diagnostic.open_float()
end, { desc = "Focus Diagnostic" })
map("n", "<leader>qo", "<cmd>Trouble<CR>", { desc = "Open Trouble" })
map("n", "<leader>qD", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>qd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>qQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix List (Trouble)" })
map("n", "<leader>qL", "<cmd>Trouble lsp toggle<CR>", { desc = "LSP Definitions / references / ... (Trouble)" })
map("n", "<leader>qt", "<cmd>TodoTrouble<CR>", { desc = "Todo (Trouble)" })

-- Tests
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run file test" })
map("n", "<leader>to", ":Neotest output<CR>", { desc = "Show test output" })
map("n", "<leader>ts", ":Neotest summary<CR>", { desc = "Show test summary" })

-- Debug
map("n", "<leader>du", function()
  require("dap-view").toggle()
end, { desc = "Toggle Debug View UI" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
map("n", "<leader>ds", function()
  require("dap").continue()
end, { desc = "Start/Continue Debug" })
map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Debug Step Over" })

-- Git
map("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, { desc = "Git Branches" })
map("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, { desc = "Git Log" })
map("n", "<leader>gL", function()
  Snacks.picker.git_log_file()
end, { desc = "Git Log File" })
map("n", "<leader>gf", ":DiffviewFileHistory<CR>", { desc = "Diffview File History" })
map("n", "<leader>gc", ":DiffviewOpen HEAD~1<CR>", { desc = "Diffview Last Commit" })
map("n", "<leader>gd", function()
  Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })

-- Git signs
map("n", "<leader>gB", ":Gitsigns blame_line<CR>", { desc = "Blame line" })
map("n", "<leader>ph", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
map("n", "<leader>rh", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", { desc = "Toogle deleted hunks" })
map("n", "[c", ":Gitsigns prev_hunk<CR>", { desc = "Jump to prev hunk" })
map("n", "]c", ":Gitsigns next_hunk<CR>", { desc = "Jump to next hunk" })

-- Terminal
map("n", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp", size = 0.4 }
end, { desc = "Toogle Terminal Vertical" })
map("n", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp", size = 0.4 }
end, { desc = "Toogle Terminal Horizontal" })
map("n", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })
map("t", "<C-]>", function()
  require("nvchad.term").toggle { pos = "vsp" }
end, { desc = "Toogle Terminal Vertical" })
map("t", "<C-\\>", function()
  require("nvchad.term").toggle { pos = "sp" }
end, { desc = "Toogle Terminal Horizontal" })
map("t", "<C-f>", function()
  require("nvchad.term").toggle { pos = "float" }
end, { desc = "Toogle Terminal Float" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
