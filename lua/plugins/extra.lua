return {
  {
    -- "ggandor/leap.nvim",
    url = "https://codeberg.org/andyg/leap.nvim",
    lazy = false,
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, "<Plug>(leap-forward)", desc = "Leap forward" },
      { "S", mode = { "n", "x", "o" }, "<Plug>(leap-backward)", desc = "Leap backward" },
      { "x", mode = { "x", "o" }, "<Plug>(leap-forward-till)", desc = "Leap forward till" },
      { "X", mode = { "x", "o" }, "<Plug>(leap-backward-till)", desc = "Leap backward till" },
      { "gs", mode = { "n", "x", "o" }, "<Plug>(leap-from-window)", desc = "Leap from window" },
    },
    -- config = function()
    --   require("leap").add_default_mappings(true)
    -- end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 6,
        border = "rounded",
      },
      keymaps = {
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            ---@diagnostic disable-next-line: lowercase-global
            detail = not detail
            if detail then
              require("oil").set_columns { "icon", "permissions", "size", "mtime" }
            else
              require("oil").set_columns { "icon" }
            end
          end,
        },
      },
      confirmation = {
        border = "rounded",
      },
      keymaps_help = {
        border = "rounded",
      },
    },
    lazy = false,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    lazy = false,
    cmd = "Trouble",
    specs = {
      "folke/snacks.nvim",
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts or {}, {
          picker = {
            actions = require("trouble.sources.snacks").actions,
          },
        })
      end,
    },
  },
  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup {
        options = {
          multilines = {
            enabled = true,
          },
          show_source = {
            enabled = true,
          },
        },
      }
      vim.diagnostic.config { virtual_text = false }
    end,
  },
  {
    "Exafunction/windsurf.nvim",
    lazy = false,
    config = function()
      require("codeium").setup {
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "hrsh7th/nvim-cmp",
    },
  },
  {
    "lukas-reineke/virt-column.nvim",
    opts = {},
    lazy = false,
    config = function()
      require("virt-column").setup {
        char = "|",
        virtcolumn = "80,120",
        highlight = "NonText",
      }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = {
        blink = { enabled = true },
        lsp = { enabled = true },
        -- TODO: filter for obsidian
      },
    },
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup {
        -- filetype = { "markdown", "conf" },
        app = "browser",
      }
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "laytan/cloak.nvim",
    cmd = { "CloakDisable", "CloakEnable", "CloakToggle", "CloakPreviewLine" },
    config = function()
      require("cloak").setup {
        enabled = false,
        cloak_character = "*",
        highlight_group = "Comment",
        patterns = {
          {
            file_pattern = {
              -- ".env*",
              ".env",
            },
            cloak_pattern = "=.+",
          },
        },
      }
    end,
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    config = function()
      vim.g.undotree_WindowLayout = 3
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_DiffAutoOpen = 0
      vim.g.undotree_SplitWidth = 40

      -- fix extra diff buffer
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "undotree", "diff" },
        callback = function()
          vim.bo.bufhidden = "wipe"
        end,
      })
    end,
  },
}
