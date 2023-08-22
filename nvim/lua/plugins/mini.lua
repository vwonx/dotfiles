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

local animate = {
  "echasnovski/mini.animate",
  event = { "BufReadPre", "BufNewFile" },
}

function animate.config()
  -- don't use animate when scrolling with the mouse
  local mouse_scrolled = false
  for _, scroll in ipairs({ "Up", "Down" }) do
    local key = "<ScrollWheel" .. scroll .. ">"
    vim.keymap.set({ "", "i" }, key, function()
      mouse_scrolled = true
      return key
    end, { expr = true })
  end

  local animate = require("mini.animate")
  animate.setup({
    scroll = {
      subscroll = animate.gen_subscroll.equal({
        predicate = function(total_scroll)
          if mouse_scrolled then
            mouse_scrolled = false
            return false
          end
          return total_scroll > 1
        end,
      }),
    }
  })
end

local M = { indentscope, animate }
return M
