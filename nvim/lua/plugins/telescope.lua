local keys = require("utils.global-keys-mapping").telescope

return {{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  branch = "0.1.x",
  keys = {
    { keys.find_files, ":Telescope find_files<CR>", desc = "global find files" },
    -- { keys.live_grep, ":Telescope live_grep<CR>", desc = "glaobal grep text" },
    { keys.live_grep, ":execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>", desc = "glaobal grep text" },
  },
  opts = {
    defaults = {
      initial_mode = "insert",
      -- vertical , center , cursor
      -- layout_strategy = "center",
      mappings = {
        i = {
          -- move up and down
          [keys.move_selection_next] = "move_selection_next",
          [keys.move_selection_previous] = "move_selection_previous",
          [keys.preview_scrolling_up] = "preview_scrolling_up",
          [keys.preview_scrolling_down] = "preview_scrolling_down",
          -- history
          [keys.cycle_history_next] = "cycle_history_next",
          [keys.cycle_history_prev] = "cycle_history_prev",
        },
      },
    },
  }
}}
