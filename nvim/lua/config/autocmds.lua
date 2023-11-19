function getAutoGroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- set different indent to lua file
vim.api.nvim_create_autocmd("FileType", {
  group = getAutoGroup("LuaFormatWidth"),
  pattern = "lua",
  command = "setlocal shiftwidth=2 tabstop=2"
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = getAutoGroup("TrimTailWhite"),
  pattern = {"*"},
  command = [[%s/\s\+$//e]],
})

-- vim.api.nvim_create_autocmd("CursorHold", {
--   group = getAutoGroup("PopUpDiagnostics"),
--   pattern = {"*"},
--   command = "lua vim.diagnostic.open_float()",
-- })
