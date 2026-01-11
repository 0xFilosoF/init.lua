return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      render = "wrapped-compact",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("noice").setup {
        lsp = {
          progress = {
            enabled = false,
          },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
          signature = {
            enabled = false,
            -- auto_open = {
            --   enabled = true,
            --   trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
            --   luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
            --   snipppets = true, -- Will open when jumping to placeholders in snippets (Neovim builtin snippets)
            --   throttle = 50, -- Debounce lsp signature help request by 50ms
            -- },
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
          cmdline_output_to_split = false, -- send the output of a command you executed in the cmdline to a split
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
