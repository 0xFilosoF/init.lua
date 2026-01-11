-- load defaults i.e. lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = {},
  cssls = {},
  jsonls = {
    settings = {
      json = {
        format = { enable = false },
        validate = { enable = true },
      },
    },
  },
  taplo = {},
  yamlls = {
    settings = {
      yaml = {
        format = { enable = true, singleQuote = true },
        validate = true,
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["../path/relative/to/file.yml"] = "/.github/workflows/*",
          ["/path/from/root/of/project"] = "/.github/workflows/*",
        },
      },
    },
  },
  ts_ls = {
    settings = {
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  eslint = {},
  prismals = {},
  biome = {},
  pyright = {
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { "*" },
        },
      },
    },
  },
  gopls = {
    settings = {
      gopls = {
        analyses = { unusedparams = true, unreachable = false },
        codelenses = {
          generate = true,
          gc_details = true,
          tidy = true,
        },
        usePlaceholders = true,
        -- staticcheck = true,
        -- buildFlags = { "-tags", "integration" },
        semanticTokens = true,
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  },
  rust_analyzer = {
    -- see https://rust-analyzer.github.io/book/configuration.html
    --   settings = {
    --     ["rust-analyzer"] = {
    --       check = {
    --         command = "clippy",
    --       },
    --     },
    --   },
  },
  solidity_ls_nomicfoundation = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
  -- vim.lsp.enable(name)
end

vim.lsp.enable(vim.tbl_keys(servers)) -- nvim v0.11.0 or above required
vim.diagnostic.config { virtual_text = false } -- for tiny-inline-diagnostic
