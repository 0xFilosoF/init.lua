-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
  cmp = {
    icons = true,
    style = "default",
  },

  telescope = { style = "bordered" },

  statusline = {
    theme = "default",
    separator_style = "default",
  },

  tabufline = {
    lazyload = false,
  },
}

M.base46 = {
  theme = "kanagawa",
  -- transparency = true,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    DiffChange = {
      bg = "#464414",
      fg = "none",
    },
    DiffAdd = {
      bg = "#103507",
      fg = "none",
    },
    DiffRemoved = {
      bg = "#461414",
      fg = "none",
    },
  },
}

M.mason = {
  command = true,
  pkgs = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "json-lsp",
    "taplo", -- toml lsp + fmt
    "yaml-language-server",

    "sql-formatter",

    "typescript-language-server",
    "biome",
    "prettier",
    "eslint-lsp",
    "prisma-language-server",

    "pyright",
    "ruff",
    -- # additional python pkgs
    "isort",
    "black",

    "gopls",
    "goimports",
    "golines",
    "golangci-lint",

    "rust-analyzer",

    "nomicfoundation-solidity-language-server", -- npm install -g @nomicfoundation/solidity-language-server
    "solhint",
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    [[   ___ _            _      ___ _           _       ]],
    [[  / __\ | ___   ___| | __ / __\ |__   __ _(_)_ __  ]],
    [[ /__\// |/ _ \ / __| |/ // /  | '_ \ / _` | | '_ \ ]],
    [[/ \/  \ | (_) | (__|   </ /___| | | | (_| | | | | |]],
    [[\_____/_|\___/ \___|_|\_\____/|_| |_|\__,_|_|_| |_|]],
    [[                                                   ]],
    [[ chain sync: completed 100% ]],
    [[ connecting to mainnet... ✓ ]],
    [[                            ]],
    [[    Powered By   Engine   ]],
  },
}

return M
