-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.termguicolors = true
vim.opt.conceallevel = 0
vim.opt.guifont = "JetBrains Mono Nerd Font"
vim.api.nvim_set_hl(0, "Function", { bold = true })
vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", italic = true })
