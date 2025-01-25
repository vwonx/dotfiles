function getAutoGroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- set different indent to lua file
vim.api.nvim_create_autocmd("FileType", {
  group = getAutoGroup("LuaFormatWidth"),
  pattern = "lua,javascript,typescript",
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
--

-- insert comment on file header
vim.api.nvim_create_user_command('InsertHeader', function()
  local buf = vim.api.nvim_get_current_buf()
  local file_name = vim.fn.expand('%:t') -- Get the file name
  local date = os.date('%Y-%m-%d')
  local year = os.date('%Y')

  local template = string.format([[
/*
 * File Name: %s
 *
 * Created by vwonx on %s
 *
 * Copyright (c) %s vwonx. All rights reserved.
 */
]], file_name, date, year)

  vim.api.nvim_buf_set_lines(buf, 0, 0, false, vim.split(template, '\n'))
end, {})
