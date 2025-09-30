-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Terminal settings
local terminal_group = augroup("TerminalSettings", { clear = true })

-- Auto insert mode when entering terminal
autocmd("TermOpen", {
  group = terminal_group,
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.cmd("startinsert")
  end,
})

-- Auto close terminal if process exits successfully
autocmd("TermClose", {
  group = terminal_group,
  pattern = "*",
  callback = function()
    vim.cmd("bdelete!")
  end,
})

-- Remember terminal size
autocmd("VimResized", {
  group = terminal_group,
  callback = function()
    vim.cmd("wincmd =")
  end,
})