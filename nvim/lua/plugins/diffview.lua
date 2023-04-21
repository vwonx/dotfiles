return {{
  "sindrets/diffview.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    view = {
      merge_tool = { layout = "diff3_mixed" },
    },
  }
}}
