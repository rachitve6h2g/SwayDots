return {
  -- catppuccin theme
  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    name = "catppuccin",
    opts = {
      flavor = "mocha",
      background = {
        dark = "mocha",
        light = "latte",
      },

      transparent_background = true,
      show_end_of_buffer = false,
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        indent_blankline = {
          enabled = true,
          scope_color = "",
          color_indent_levels = true,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        rainbow_delimiters = true,
        telescope = {
          enabled = true,
        },
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      function LineNumberColors()
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#89b4fa", bold = true })
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#bac2de", bold = true })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#cba6f7", bold = true })
      end
      vim.cmd.colorscheme("catppuccin")
      LineNumberColors()
    end,
  },

  -- make LazuVim use this
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
