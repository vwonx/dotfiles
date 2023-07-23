-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  i = {
    ["<C-h>"] = { "<ESC>I", desc = "Move cursor to the head of the line" },
    ["<C-l>"] = { "<ESC>A", desc = "Move cursor to the tail of the line" },
  },
  v = {
    ["<A-k>"] = { ":m '<-2<CR>gv-gv", desc = "Move the selected line up" },
    ["<A-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move the selected line down" },
  }
}
