local Comment = {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = true,
}

local JsDoc = {
  "heavenshell/vim-jsdoc",
  event = { "BufReadPost", "BufNewFile" },
  build = "make install",
}

local M = { Comment, JsDoc }
return M
