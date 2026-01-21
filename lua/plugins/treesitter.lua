return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  opts = {
    -- NOTE: ensure_installed deprecated, but working woth NvChad
    ensure_installed = {
      "bash",
      "zsh",
      "vim",
      "vimdoc",
      "markdown",
      "markdown_inline",
      "hyprlang",
      "nix",

      "html",
      "css",
      "xml",
      "yaml",
      "toml",
      "csv",

      "c",
      "cpp",
      "rust",

      "lua",
      "luadoc",
      "luap",

      "python",
      "javascript",
      "typescript",
      "jsdoc",
      "json",
      "jsonc",

      "make",
      "cmake",
      "terraform",

      "tsx",
      "prisma",

      "elixir",
      "erlang",
      "gleam",

      "go",
      "sql",
      "solidity",
    },
    indent = {
      enable = true,
    },
  },
}
