return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  opts = {
    ensure_installed = {
      "bash",
      "html",
      "css",
      "markdown",
      "markdown_inline",

      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "toml",

      "c",
      "cpp",

      "lua",
      "luadoc",
      "luap",

      "javascript",
      "jsdoc",
      "json",
      "jsonc",

      "tsx",
      "typescript",
      "prisma",

      "sql",

      "python",
      "go",
      "rust",
      "solidity",
    },
    indent = {
      enable = true,
    },
  },
}
