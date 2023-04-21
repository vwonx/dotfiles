local keys = require("utils.global-keys-mapping").nvimTree

local list_keys = {
  { key = keys.refresh, action = "refresh" },

  -- open / close --
  { key = keys.edit, action = "edit" },
  { key = keys.close, action = "close_node" },
  { key = keys.system_open, action = "system_open" },
  { key = keys.vsplit, action = "vsplit" },
  { key = keys.split, action = "split" },

  -- movement ---------------
  { key = keys.parent_node, action = "parent_node" },
  { key = keys.cd, action = "cd" },
  { key = keys.dir_up, action = "dir_up" },
  { key = keys.prev_sibling, action = "prev_sibling" },
  { key = keys.next_sibling, action = "next_sibling" },
  { key = keys.first_sibling, action = "first_sibling" },
  { key = keys.last_sibling, action = "last_sibling" },

  -- file toggle --
  { key = keys.toggle_git_ignored, action = "toggle_git_ignored" },
  { key = keys.toggle_dotfiles, action = "toggle_dotfiles" },
  { key = keys.toggle_custom, action = "toggle_custom" },
  { key = keys.toggle_file_info, action = "toggle_file_info" },

  ------ file operation ----------
  { key = keys.create, action = "create" },
  { key = keys.remove, action = "remove" },
  { key = keys.rename, action = "rename" },
  { key = keys.copy, action = "copy" },
  { key = keys.cut, action = "cut" },
  { key = keys.paste, action = "paste" },
  { key = keys.copy_name, action = "copy_name" },
  { key = keys.copy_path, action = "copy_path" },
  { key = keys.copy_absolute_path, action = "copy_absolute_path" },
  { key = keys.toggle_file_info, action = "toggle_file_info" },
}

return {{
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { keys.toggle, "<CMD>NvimTreeToggle<CR>", desc = "NvimTree Toggle" },
  },
  opts = {
    update_focused_file = {
      enable = true,
      update_root = true,
      ignore_list = {
        "DiffviewFiles",
      },
    },
    view = {
      mappings = {
        custom_only = false,
        list = list_keys,
      },
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          -- git = false,
        },
        webdev_colors = true,
        -- git_placement = "after",
      },
    },
    filters = {
      dotfiles = true,
    },
  }
}}
