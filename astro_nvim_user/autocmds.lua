local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

-- Set different indent to lua file
vim.api.nvim_create_autocmd("FileType", {
  group = myAutoGroup,
  pattern = "lua",
  command = "setlocal shiftwidth=2 tabstop=2",
})

-- Auto remove tail whitespace when save file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = myAutoGroup,
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
