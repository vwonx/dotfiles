local M = {}

M.origin_keys = {
  v_left_arrow = "<",
  v_right_arrow = ">",
  x_p = "p",
}

M.basic = {
  leader_key = " ",

  -- quick move
  n_v_5j = "<C-j>",
  n_v_5k = "<C-k>",
  -- n_v_10k = "<C-u>",
  -- n_v_10j = "<C-d>",
  i_line_head = "<C-h>",
  i_line_tail = "<C-l>",

  -- text move under visual mode
  v_text_up = "K",
  v_text_down = "J",

  -- windows operator
  -- spilt window
  split_vertically = "wv",
  split_horizontally = "wh",
  -- close current
  close = "wc",
  -- close others
  close_others = "wo",
  -- jump between windows
  jump_left = "<leader>h",
  jump_right = "<leader>l",
  jump_up = "<leader>k",
  jump_down = "<leader>j",
  -- control windows size
  width_decrease = "w,",
  width_increase = "w.",
  height_decrease = "wj",
  height_increase = "wk",
  size_equal = "w=",

  -- terminal
  terminal_to_normal = "<esc>",
}

M.nvimTree = {
  toggle = "<leader>m",
  refresh = "R",
  -- open / close --
  edit = "o",
  close = "<BS>",
  system_open = "<CR>",
  vsplit = "sv",
  split = "sh",
  tabnew = "ob",
  -- movement --
  parent_node = "P",
  cd = "]",
  dir_up = "[",
  prev_sibling = "<",
  next_sibling = ">",
  first_sibling = "K",
  last_sibling = "J",
  -- file toggle --
  toggle_git_ignored = "i", --.gitignore (git enable)
  toggle_dotfiles = ".", -- Hide (dotfiles)
  toggle_custom = "u", -- togglle custom config
  toggle_file_info = "gh",
  -- file operate --
  create = "a",
  remove = "d",
  rename = "r",
  cut = "x",
  copy = "c",
  paste = "p",
  copy_name = "y",
  copy_path = "Y",
  copy_absolute_path = "gy",
}

M.bufferline = {
  -- left / right cycle
  prev = "<C-h>",
  next = "<C-l>",
  -- close current buffer
  close = "<C-w>", -- close = "<leader>bc",
  -- close all left / right tabs
  close_left = "<leader>bh",
  close_right = "<leader>bl",
  -- close all other tabs
  close_others = "<leader>bo",
  close_pick = "<leader>bp",
}

M.telescope = {
  find_files = "<C-p>",
  live_grep = "<C-f>",
  -- up and down
  move_selection_next = "<C-j>",
  move_selection_previous = "<C-k>",
  -- history
  cycle_history_next = "<Down>",
  cycle_history_prev = "<Up>",
  -- scrolling in preview window
  preview_scrolling_up = "<C-u>",
  preview_scrolling_down = "<C-d>",
}

M.treesitter = {
  init_selection = "<CR>",
  node_incremental = "<CR>",
  node_decremental = "<BS>",
  scope_incremental = "<TAB>",
}

M.comment = {
  line = "gcc",
  block = "gbc",
  op_line = "gc",
  op_block = "gb",
  above = 'gcO',
  below = 'gco',
  eol = 'gcA',
}

M.lsp = {
  -- diagnostic
  open_flow = "gp",
  goto_next = "gj",
  goto_prev = "gk",
  list = "gl",

  -- jumps to the declaration
  definition = "gd",
  -- jumps to the declaration, many servers do not implement this method
  declaration = false,
  -- displays hover information
  hover = "gh",
  -- lists all the implementations
  implementation = "gi",
  -- lists all the references to the symbol
  references = "gr",

  rename = "<leader>rn",
  code_action = "<leader>ca",
}

M.cmp = {
  confirm = "<CR>",
  select_next_item = "<C-j>",
  select_prev_item = "<C-k>",
  scroll_doc_up = "<C-u>",
  scroll_doc_down = "<C-d>",
  complete = "<A-.>",
  abort = "<A-,>",
  -- luasnip
  snip_jump_next = "<A-l>",
  snip_jump_prev = "<A-h>",
  snip_next_choice = "<C-j>",
  snip_prev_choice = "<C-k>",
}

return M
