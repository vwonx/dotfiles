local util = require("util")

local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    -- find
    { "<leader>fF", util.telescope("files"), desc = "Find Files (root dir)" },
    { "<leader>ff", util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>fr", util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
    -- search
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    { "<leader>sW", util.telescope("live_grep"), desc = "Grep (root dir)" },
    { "<leader>sw", util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    { "<leader>cs", util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    -- keymap
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Show KeyMaps" },
  },
  opts = {
    defaults = {
      ath_display = { "truncate" },
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = { prompt_position = "top", preview_width = 0.55 },
        vertical = { mirror = false },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      mappings = {
        i = {
          -- move up and down
          ["<c-j>"] = "move_selection_next",
          ["<c-k>"] = "move_selection_previous",
          ["<c-u>"] = "preview_scrolling_up",
          ["<c-d>"] = "preview_scrolling_down",
          -- history
          ["<c-down>"] = "cycle_history_next",
          ["<c-up>"] = "cycle_history_prev",
        },
        n = { ["q"] = "close" },
      },
    },
  },
}

return M
