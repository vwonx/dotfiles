-- Basic keybindings -------------------------------

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
---------------------------------------------------------

local gKeysMap = require("utils.global-keys-mapping")
local keys = gKeysMap.basic
local oKeys = gKeysMap.origin_keys

-- leader key
vim.g.mapleader = keys.leader_key
vim.g.maplocalleader = keys.leader_key

-- quick move
-- keymap({ "n", "v" }, keys.n_v_5j, "5j")
-- keymap({ "n", "v" }, keys.n_v_5k, "5k")
-- keymap({ "n", "v" }, keys.n_v_10j, "10j")
-- keymap({ "n", "v" }, keys.n_v_10k, "10k")
keymap("i", keys.i_line_head, "<ESC>I")
keymap("i", keys.i_line_tail, "<ESC>A")

-- use ">" and "<" in visual mode
keymap("v", oKeys.v_left_arrow, "<gv")
keymap("v", oKeys.v_right_arrow, ">gv")

-- move selected text up and down
keymap("x", keys.v_text_down, ":move '>+1<CR>gv-gv")
keymap("x", keys.v_text_up, ":move '<-2<CR>gv-gv")

-- paste do not copy in visual mode
keymap("x", oKeys.x_p, '"_dP')

-- split windows
-- cancle the default function of "s"
keymap("n", "w", "")
keymap("n", keys.split_vertically, ":vsp<CR>")
keymap("n", keys.split_horizontally, ":sp<CR>")
keymap("n", keys.close, "<C-w>c")
keymap("n", keys.close_others, "<C-w>o") -- close others
keymap("n", keys.jump_left, "<C-w>h")
keymap("n", keys.jump_down, "<C-w>j")
keymap("n", keys.jump_up, "<C-w>k")
keymap("n", keys.jump_right, "<C-w>l")
keymap("n", keys.width_decrease, ":vertical resize -10<CR>")
keymap("n", keys.width_increase, ":vertical resize +10<CR>")
keymap("n", keys.height_decrease, ":horizontal resize -10<CR>")
keymap("n", keys.height_increase, ":horizontal resize +10<CR>")
keymap("n", keys.size_equal, "<C-w>=")

-- Esc back to Normal mode
keymap("t", keys.terminal_to_normal, "<C-\\><C-n>")
