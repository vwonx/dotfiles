local nvim_notify = {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    -- use for transparent background
    background_colour = "#000000",

    timeout = 3000,

    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,

    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,

    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,

    top_down = false,
  }
}

local noice = {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
  },
  keys = {
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
  },
}

local M = { nvim_notify, noice }
return M
