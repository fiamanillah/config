-- ~/.config/nvim/lua/plugins/github-theme.lua
return {
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- load on startup
    priority = 1000, -- load before other plugins
    config = function()
      require("github-theme").setup({
        options = {
          transparent = false,
          styles = {
            comments = "italic",
            keywords = "bold",
            functions = "italic,bold",
            variables = "NONE",
          },
          darken = {
            floats = true,
            sidebars = {
              enable = true,  -- changed from 'enabled' to 'enable'
              list = { "qf", "help" },
            },
          },
        },
      })
      -- Load the theme using Neovim's colorscheme command
      vim.cmd("colorscheme github_dark_default")
    end,
  },
}