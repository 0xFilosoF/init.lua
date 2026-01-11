local lint = require "lint"

lint.linters_by_ft = {
  -- sql = { "sqlfluff" },

  -- javascript = { "eslint_d" },
  -- typescript = { "eslint_d" },
  -- typescriptreact = { "eslint_d" },
  -- javascriptreact = { "eslint_d" },

  python = { "ruff" },

  go = { "golangcilint" },
  rust = { "clippy" },
  solidity = { "solhint" },
}

-- lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
--   -- try to ignore "No ESLint configuration found" error
--   -- if diagnostic.message:find("Error: No ESLint configuration found") then -- old version
--   -- update: 20240814, following is working
--   if diagnostic.message:find "Error: Could not find config file" then
--     return nil
--   end
--   return diagnostic
-- end)

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
