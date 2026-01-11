---@module 'dap-view'
---@type dapview.Config
local dap_view_opts = {
  winbar = {
    sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
    default_section = "scopes",
    controls = {
      enabled = true,
    },
  },
}

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local ok, dap, dv, dap_vt = pcall(function()
        return require "dap", require "dap-view", require "nvim-dap-virtual-text"
      end)
      if not ok then
        return
      end

      dap_vt.setup()

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ DAP Setup                                                │
      -- ╰──────────────────────────────────────────────────────────╯
      -- Automatically open UI
      dap.listeners.before.attach["dap-view-config"] = function()
        dv.open()
      end
      dap.listeners.before.launch["dap-view-config"] = function()
        dv.open()
      end
      dap.listeners.after.event_initialized["dap-view-config"] = function()
        dv.open()
      end
      dap.listeners.before.event_terminated["dap-view-config"] = function()
        dv.close()
      end
      dap.listeners.before.event_exited["dap-view-config"] = function()
        dv.close()
      end

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Icons                                                    │
      -- ╰──────────────────────────────────────────────────────────╯
      vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" })
      vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379" })

      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "ﳁ", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "DapStopped" })

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Adapters                                                 │
      -- ╰──────────────────────────────────────────────────────────╯
      -- VSCODE JS (Node/Terminal)
      ---@diagnostic disable-next-line: missing-fields
      require("dap-vscode-js").setup {
        -- Not use Mason because => https://github.com/mxsdev/nvim-dap-vscode-js/issues/43
        -- debugger_path = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter",
        debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node", "node-terminal" },
      }

      -- Golang (Delve), with configurations
      require("dap-go").setup()

      -- https://github.com/leoluz/nvim-dap-go?tab=readme-ov-file#debugging-with-build-flags
      -- require('dap-go').get_arguments
      -- require('dap-go').get_buid_flags

      -- Rust (codelldb)
      dap.adapters.codelldb = {
        type = "executable",
        command = vim.fn.expand "~" .. "/codelldb-linux-x64/extension/adapter/codelldb", -- or codelldb
      }

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Configurations                                           │
      -- ╰──────────────────────────────────────────────────────────╯
      -- TODO:
      for _, language in ipairs { "typescript", "javascript" } do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "[node] Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            runtimeExecutable = "node",
            runtimeArgs = { "-r", "ts-node/register" },
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "[node] Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            skipFiles = { "<node_internals>/**" },
          },
        }
      end

      dap.configurations.rust = {
        {
          type = "codelldb",
          name = "Debug",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
        {
          type = "codelldb",
          name = "Debug bin debug_runner",
          request = "launch",
          program = vim.fn.getcwd() .. "/target/debug/debug_runner",
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
    dependencies = {
      { "igorlfs/nvim-dap-view", opts = dap_view_opts },
      "theHamsta/nvim-dap-virtual-text",
      "mxsdev/nvim-dap-vscode-js",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
      {
        "microsoft/vscode-js-debug",
        commit = "4d7c704d3f07",
        build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
      },
    },
  },
}
