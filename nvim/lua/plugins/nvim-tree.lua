local keys = require("utils.global-keys-mapping").nvimTree

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<CR>', api.node.run.system, opts('Run System'))
  vim.keymap.set('n', 'sv', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'sh', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', ']', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '[', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', 'i', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
  vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'u', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
  vim.keymap.set('n', 'gh', api.node.show_info_popup, opts('Info'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', 'gh', api.node.show_info_popup, opts('Info'))
end

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
    on_attach = on_attach,
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
