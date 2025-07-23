-- ~/.config/nvim/lua/plugins/jet.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add gotmpl parser for Go templates (closest match to Jet)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "gotmpl", "html" })

      -- Register tree-sitter parser if needed (only required if using a custom parser)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.gotmpl = {
        install_info = {
          url = "https://github.com/ngalaiko/tree-sitter-go-template",
          files = { "src/parser.c" },
          branch = "master",
        },
        filetype = "html",
      }
    end,
  },

  -- Set filetype for .jet files
  {
    "nvim-lua/plenary.nvim", -- used as a dummy plugin to hook into config
    lazy = false,
    config = function()
      vim.filetype.add({
        extension = {
          jet = "html", -- or use "html" if you prefer default highlighting
        },
      })
    end,
  },
}
