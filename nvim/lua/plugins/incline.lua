local M = {
  "b0o/incline.nvim",
  event = "VeryLazy",
  config = function()
    local helpers = require("incline.helpers")
    local navic = require("nvim-navic")
    local devicons = require("nvim-web-devicons")
    require("incline").setup {
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
      },
      render = function(props)
        local file = vim.api.nvim_buf_get_name(props.buf);
        local filepath = vim.fn.fnamemodify(file, ":p:.")
        local filename = vim.fn.fnamemodify(file, ":t")
        if filename == '' then
          filepath = '[No Name]'
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local res = {
          ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
          ' ',
          { filepath, gui = modified and 'bold,italic' or 'bold' },
          ' ',
          guibg = '#44406e',
        }
        return res
      end,
    }
  end,
}

return M
