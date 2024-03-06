local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer Nvim-Tree" },
  },
  opts = {
    update_focused_file = {
      enable = true,
    },
    renderer = {
      highlight_git = true,
      icons = {
        git_placement = "after",
        glyphs = {
          git = {
            unstaged = "[u]",
            staged = "[s]",
            unmerged = "[]",
            renamed = "[r]",
            untracked = "[+]",
            deleted = "[-]",
            ignored = "[i]",
          },
        },
      },
    },
  },
}

function M.config(_, opts)
  -- Always open nvim-tree
  local function open_nvim_tree(data)
    -- Buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1
    -- Buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    if not real_file and not no_name then
      return
    end
    -- Open the tree, find the file but don't focus it
    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
  end
  vim.api.nvim_create_autocmd({ "VimEnter" }, {
    group = vim.api.nvim_create_augroup("NvimTreeAlwaysOpen", {clear = true}),
    callback = open_nvim_tree
  })

  -- Auto close
  vim.api.nvim_create_autocmd({ "QuitPre" }, {
    group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
    callback = function()
      local tree_wins = {}
      local floating_wins = {}
      local wins = vim.api.nvim_list_wins()
      for _, w in ipairs(wins) do
        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
        if bufname:match("NvimTree_") ~= nil then
          table.insert(tree_wins, w)
        end
        if vim.api.nvim_win_get_config(w).relative ~= '' then
          table.insert(floating_wins, w)
        end
      end
      if 1 == #wins - #floating_wins - #tree_wins then
        -- Should quit, so we close all invalid windows.
        for _, w in ipairs(tree_wins) do
          vim.api.nvim_win_close(w, true)
        end
      end
    end
  })

  require("nvim-tree").setup(opts)
end

return M
