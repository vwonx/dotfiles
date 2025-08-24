local indentscope = {
  "echasnovski/mini.indentscope",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "NvimTree",
        "lazy",
        "mason",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}

function indentscope.config()
  local indentscope = require('mini.indentscope')
  indentscope.setup({
    symbol = "│",
    options = { try_as_border = true },
  })
end

local M = { indentscope }
return M
