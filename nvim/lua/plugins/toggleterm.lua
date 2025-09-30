return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    keys = {
      -- Float terminal
      { "<C-/>", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
      { "<C-_>", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal (alternative)" },
      
      -- Horizontal terminal
      { "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
      
      -- Vertical terminal
      { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Toggle vertical terminal" },
      
      -- Multiple terminals
      { "<leader>t1", "<cmd>1ToggleTerm<cr>", desc = "Toggle terminal 1" },
      { "<leader>t2", "<cmd>2ToggleTerm<cr>", desc = "Toggle terminal 2" },
      { "<leader>t3", "<cmd>3ToggleTerm<cr>", desc = "Toggle terminal 3" },
      { "<leader>t4", "<cmd>4ToggleTerm<cr>", desc = "Toggle terminal 4" },
      
      -- Send selection to terminal
      { "<leader>ts", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Send line to terminal" },
      { "<leader>ts", "<cmd>ToggleTermSendVisualSelection<cr>", mode = "v", desc = "Send selection to terminal" },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
      
      -- Custom terminal commands
      local Terminal = require("toggleterm.terminal").Terminal
      
      -- Lazygit
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
          border = "double",
        },
      })
      
      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end
      
      -- Node REPL
      local node = Terminal:new({
        cmd = "node",
        hidden = true,
        direction = "float",
      })
      
      function _NODE_TOGGLE()
        node:toggle()
      end
      
      -- Python REPL
      local python = Terminal:new({
        cmd = "python",
        hidden = true,
        direction = "float",
      })
      
      function _PYTHON_TOGGLE()
        python:toggle()
      end
      
      -- Keymaps for custom terminals
      vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", { desc = "LazyGit" })
      vim.keymap.set("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", { desc = "Node REPL" })
      vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", { desc = "Python REPL" })
    end,
  },
}