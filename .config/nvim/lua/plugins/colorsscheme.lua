return {
  {
    "dgox16/oldworld.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require("oldworld").setup({
        styles = {
          comments = { italic = true },
          functions = { bold = true, italic = true },
          keywords = { italic = true },
        },
        integrations = {
          hop = true,
          telescope = false,
        },
      })
      vim.cmd.colorscheme("oldworld")
    end,
  },
}
