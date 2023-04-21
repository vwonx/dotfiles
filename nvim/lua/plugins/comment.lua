local keys = require("utils.global-keys-mapping").comment

return {{
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = keys.line,
        ---Block-comment toggle keymap
        block = keys.block,
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = keys.op_line,
        ---Block-comment keymap
        block = keys.op_block,
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = keys.above,
        ---Add comment on the line below
        below = keys.below,
        ---Add comment at the end of line
        eol = keys.eol,
    },
  }
}}
