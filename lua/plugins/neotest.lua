return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("neotest").setup {
      adapters = {
        -- Jest
        require "neotest-jest" {
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.ts",
          env = { CI = true },
          cwd = function(_)
            return vim.fn.getcwd()
          end,
        },
        -- Jest Monorepo
        require "neotest-jest" {
          jestCommand = "npm test --",
          jestConfigFile = function(file)
            if string.find(file, "/packages/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
            end
            return vim.fn.getcwd() .. "/jest.config.js"
          end,
          env = { CI = true },
          cwd = function(file)
            if string.find(file, "/packages/") then
              return string.match(file, "(.-/[^/]+/)src")
            end
            return vim.fn.getcwd()
          end,
        },
        require "neotest-golang" {
          -- Specify configuration

          -- go_test_args = function()
          --   return {
          --     "-v",
          --     "-race",
          --     "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
          --   }
          -- end,

          -- go_test_args = function()
          --   return { "-count=1", "-tags=integration" }
          -- end,
          -- go_list_args = { "-tags=integration" },
          testify_enabled = true,
        },
      },
    }
  end,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest",
    "fredrikaverpil/neotest-golang",
  },
}
